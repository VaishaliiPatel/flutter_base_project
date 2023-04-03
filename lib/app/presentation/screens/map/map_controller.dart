import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:cmsocpp/app/data/models/charge_point_location/charge_point_location.dart';
import 'package:cmsocpp/app/presentation/bottom_sheet/charger_location.dart';
import 'package:cmsocpp/app/presentation/bottom_sheet/map_tooltip.dart';
import 'package:cmsocpp/app/presentation/screens/charge_by/charge_by_screen.dart';
import 'package:cmsocpp/app/presentation/screens/charger_summary/charging_summary_screen.dart';
import 'package:cmsocpp/app/presentation/screens/charging_details/charging_details_screen.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/base_configs/controller/style_controller.dart';
import 'package:cmsocpp/base_configs/controller/utility_controller.dart';
import 'package:cmsocpp/core/base/base_controller.dart';
import 'package:cmsocpp/utils/common_methods.dart';
import 'package:cmsocpp/utils/enums.dart';
import 'package:cmsocpp/utils/print_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';

class MapController extends ScreenController {
  late UtilityController _utility;
  LatLng kMapCenter = const LatLng(23.0513, 72.4943);
  GoogleMapController? _controller;
  late BitmapDescriptor _markerIcon = BitmapDescriptor.defaultMarker;
  late BitmapDescriptor _markerIconGreen = BitmapDescriptor.defaultMarker;
  late BitmapDescriptor _markerIconBlue = BitmapDescriptor.defaultMarker;
  late BitmapDescriptor _markerIconRed = BitmapDescriptor.defaultMarker;
  late BitmapDescriptor _markerIconGrey = BitmapDescriptor.defaultMarker;
  late BitmapDescriptor _markerIconYellow = BitmapDescriptor.defaultMarker;
  late BitmapDescriptor _markerIconPaid = BitmapDescriptor.defaultMarker;
  final RxList<Datum> _chargerLocationList = <Datum>[].obs;
  final RxList<Datum> _searchedChargerList = <Datum>[].obs;
  final RxMap<MarkerId, Marker> _markers = <MarkerId, Marker>{}.obs;
  String searchText = '';
  final TextEditingController _searchController = TextEditingController();
  RxBool isTransactionStart = false.obs;

  // late LocalTransactionModel modelData;
  String chargerName = '';
  final Rx<bool> isLoadMore = false.obs;
  final ScrollController _scrollController = ScrollController();
  final RxBool _showSearchIcon = true.obs;
  int _lastPage = 1;
  int _lastSearchPage = 1;
  int _pageNumber = 1;
  int _searchPageNumber = 1;
  final Rx<bool> _isLoading = false.obs;
  RxString initialDropdownValue = StringConfig.allDaysText.obs;
  RxString selectedFilterValue = ''.obs;
  final items = [
    StringConfig.all,
    StringConfig.available,
    StringConfig.notAvailable,
    StringConfig.faulty,
    StringConfig.inUse,
    StringConfig.paid,
    StringConfig.free,
  ];
  Datum ongoingTransactionData = const Datum();

  @override
  void onInit() {
    _utility = ScreenController.get();
    loadInitialData();
    super.onInit();
  }

  Future<void> loadInitialData() async {
    // To generate custom marker
    await _generateCustomMarkerFromAsset();
    _getFilteredChargePointList();
    _loadMoreData();
    _loadMoreDataForSearch();
  }

  // added scroll controller to load more data (pagination)
  _loadMoreData() {
    _scrollController.addListener(() {
      if (_pageNumber <= _lastPage) {
        if (scrollController.position.maxScrollExtent == scrollController.position.pixels) {
          isLoadMore.value = true;
          String filterType =
              selectedFilterValue.value == StringConfig.all ? StringConfig.emptyText : selectedFilterValue.value;
          _getFilteredChargePointList(filterBy: filterType);
        }
      }
    });
  }

  // Get charger location list
  void _getFilteredChargePointList({String? filterBy, bool isShowToast = false}) {
    if (_pageNumber == 1) isLoading.value = true;
    _utility.api.getAllChargePointLocation(page: _pageNumber, filterBy: filterBy).then((value) {
      if (value.status == 1) {
        _lastPage = value.data!.chargerLocation!.lastPage!;
        _pageNumber = _pageNumber + 1;
        isLoading.value = false;
        isLoadMore.value = false;
        _chargerLocationList.addAll(value.data!.chargerLocation!.data!);
        if (isShowToast && value.data!.chargerLocation!.data!.isEmpty) {
          String value = filterBy!.isNotEmpty
              ? filterBy
              : filterBy == StringConfig.all
                  ? StringConfig.emptyText
                  : StringConfig.all;
          CommonMethods.showSnackBarInfo(
            '${StringConfig.no} ${(value == ConnectorStatus.inUse.value) ? StringConfig.inUse : value} ${StringConfig.noChargerAvailableMsg}',
            StringConfig.chargerData,
          );
        }
        _showMarkers();
        try {
          ongoingTransactionData = _chargerLocationList.firstWhere((element) => element.isChargingRunning! == true);
          _utility.localStorage.setTransactionOnStatus(ongoingTransactionData.isChargingRunning!);
          chargerName = ongoingTransactionData.locationName!;
          print('transaction data: ');
        } catch (e) {
          printLog('Error: no ongoing transactions found');
        }
        isTransactionStart.value = _utility.localStorage.getTransactionOnStatus();
        printLog('length : ${_chargerLocationList.length}  ${isTransactionStart.value}');
      } else {
        isLoading.value = false;
        isLoadMore.value = false;
      }
    }).catchError((e) {
      isLoading.value = false;
      isLoadMore.value = false;
    });
  }

  void resetPages() {
    _pageNumber = 1;
    _lastPage = 1;
    _chargerLocationList.clear();
    _markers.clear();
  }

  // refresh map and chargers list
  Future<void> onRefreshClick() async {
    resetPages();
    selectedFilterValue.value = StringConfig.all;
    _getFilteredChargePointList();
  }

  // On Tap dropdown
  void onFilterChangeDropdownItem(Object? newValue) {
    if (newValue !=
        ((selectedFilterValue.value == ConnectorStatus.inUse.value) ? StringConfig.inUse : selectedFilterValue.value)) {
      switch (newValue) {
        case StringConfig.all:
          selectedFilterValue.value = StringConfig.all;
          break;
        case StringConfig.available:
          selectedFilterValue.value = StringConfig.available;
          break;
        case StringConfig.notAvailable:
          selectedFilterValue.value = StringConfig.notAvailable;
          break;
        case StringConfig.faulty:
          selectedFilterValue.value = StringConfig.faulty;
          break;
        case StringConfig.free:
          selectedFilterValue.value = StringConfig.free;
          break;
        case StringConfig.inUse:
          selectedFilterValue.value = StringConfig.charging;
          break;
        case StringConfig.paid:
          selectedFilterValue.value = StringConfig.paid;
          break;
        default:
          selectedFilterValue.value = StringConfig.all;
      }
      resetPages();
      String filterType =
          selectedFilterValue.value == StringConfig.all ? StringConfig.emptyText : selectedFilterValue.value;
      _getFilteredChargePointList(filterBy: filterType, isShowToast: true);
    }
  }

  // added scroll controller to load more data (pagination)
  void _loadMoreDataForSearch() {
    _scrollController.addListener(() {
      if (_searchPageNumber <= _lastSearchPage) {
        if (scrollController.position.maxScrollExtent == scrollController.position.pixels) {
          isLoadMore.value = true;
          _getSearchedChargePointList(searchText);
        }
      }
    });
  }

  void onSearchTextChange(String searchText) {
    printLog(searchText);
    if (searchText.isNotEmpty) {
      _showSearchIcon.value = false;
      _searchPageNumber = 1;
      _lastSearchPage = 1;
      _searchedChargerList.value = [];
      _markers.clear();
      Future.delayed(const Duration(milliseconds: 800), () {
        _getSearchedChargePointList(
          searchText,
        );
      });
    } else {
      _showSearchIcon.value = true;
      _searchedChargerList.value = [];
    }
  }

  void _getSearchedChargePointList(String searchedText) {
    String filterType =
        selectedFilterValue.value == StringConfig.all ? StringConfig.emptyText : selectedFilterValue.value;
    _utility.api
        .getAllChargePointLocation(page: _lastSearchPage, searchText: searchedText, filterBy: filterType)
        .then((value) {
      if (value.status == 1) {
        _searchedChargerList.value = value.data!.chargerLocation!.data!;
        _lastSearchPage = value.data!.chargerLocation!.lastPage!;
        _searchPageNumber = _searchPageNumber + 1;
        _showMarkers();
      }
    });
  }

  void onClearSearchClick() {
    if (searchController.text.isNotEmpty) {
      searchController.text = '';
      _searchedChargerList.value = [];
      _showSearchIcon.value = true;
    }
  }

  // to get bytes from assets
  Future<Uint8List> _getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  // convert asset to bitmap for custom marker
  Future<BitmapDescriptor> _getBitmapDescriptorFromAssetBytes(String path, int width) async {
    final Uint8List imageData = await _getBytesFromAsset(path, width);
    return BitmapDescriptor.fromBytes(imageData);
  }

  void onMapCreated(GoogleMapController controllerParam) {
    _controller = controllerParam;
  }

  // load custom marker
  _generateCustomMarkerFromAsset() async {
    _markerIcon = await _getBitmapDescriptorFromAssetBytes(
      AssetsConfig.markerIconGreen,
      getMarkerSize(),
    );
    _markerIconGreen = await _getBitmapDescriptorFromAssetBytes(
      AssetsConfig.markerIconGreen,
      getMarkerSize(),
    );
    _markerIconRed = await _getBitmapDescriptorFromAssetBytes(
      AssetsConfig.markerIconRed,
      getMarkerSize(),
    );
    _markerIconBlue = await _getBitmapDescriptorFromAssetBytes(
      AssetsConfig.markerIconBlue,
      getMarkerSize(),
    );
    _markerIconGrey = await _getBitmapDescriptorFromAssetBytes(
      AssetsConfig.markerIconGrey,
      getMarkerSize(),
    );
    _markerIconYellow = await _getBitmapDescriptorFromAssetBytes(
      AssetsConfig.markerIconYellow,
      getMarkerSize(),
    );
    _markerIconPaid = await _getBitmapDescriptorFromAssetBytes(
      AssetsConfig.markerIconOrange,
      getMarkerSize(),
    );
  }

  // Set marker size according os
  int getMarkerSize() {
    return (Platform.isIOS) ? 60 : 76;
  }

  // Add markers to the markers list
  void _showMarkers() async {
    for (int i = 0; i < _chargerLocationList.length; i++) {
      if (_chargerLocationList[i].status == StringConfig.available) {
        _markerIcon = _markerIconGreen;
      } else if (_chargerLocationList[i].status == StringConfig.faulty) {
        _markerIcon = _markerIconRed;
      } else if (_chargerLocationList[i].status == StringConfig.notAvailable) {
        _markerIcon = _markerIconGrey;
      } else if (_chargerLocationList[i].status == StringConfig.charging) {
        _markerIcon = _markerIconYellow;
      } else if (_chargerLocationList[i].status == StringConfig.free) {
        _markerIcon = _markerIconBlue;
      } else if (_chargerLocationList[i].status == StringConfig.paid) {
        _markerIcon = _markerIconPaid;
      }
      _addMarker(_chargerLocationList[i], i);
    }
  }

  // create custom marker and add to list
  void _addMarker(Datum charger, index) {
    final MarkerId markerId = MarkerId('$index');
    final Marker marker = Marker(
        markerId: markerId,
        position: LatLng(double.parse(charger.locationLatitude!), double.parse(charger.locationLongitude!)),
        icon: _markerIcon,
        onTap: () {
          openMapToolTipBottomSheet(chargerLocationList[index]);
        });
    _markers[markerId] = marker;
  }

  // For validate charger  API integration and navigate to charge by screen
  onChargePointItemClick(Datum data) {
    // To dismiss keyboard
    CommonMethods.hideKeyBoard();
    onClearSearchClick();
    Get.back();
    // If charging running then navigate to charging detail screen else charge by screen
    if (data.isChargingRunning ?? false) {
      onPressChargingContainer();
    } else {
      _isLoading.value = true;
      printLog('charge box id: ${data.chargeBoxId}');
      _utility.api.validateCharger(chargerCode: data.chargeBoxId!).then((value) async {
        if (value.status == 1 && value.data != null && value.data?.connectorId != null) {
          Future.delayed(const Duration(milliseconds: 300), () {
            _isLoading.value = false;
            Get.to(
              () => const ChargeByScreen(),
              arguments: {
                ArgumentsConfig.chargerId: data.chargeBoxId!,
                ArgumentsConfig.connectorList: value.data!.connectorId!,
                ArgumentsConfig.chargerName: data.locationName!,
                ArgumentsConfig.chargePerUnit: data.tariffPlanCharge ?? '0.0',
              },
            );
          });
        } else if (value.message != null) {
          _isLoading.value = false;
          // On wrong charger id
        } else {
          _isLoading.value = false;
        }
      });
    }
  }

  // To open list of charge points
  void openChargerListBottomSheet() {
    Get.bottomSheet(
      const ChargerLocationBottomSheet(),
      backgroundColor: flavor.appColors!.appBgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
    );
  }

  // Get Transaction detail API integration
  void onPressChargingContainer() {
    if (ongoingTransactionData.transactionId != null && ongoingTransactionData.transactionId! > 0) {
      _utility.api.getTransactionMeterValue(transactionId: ongoingTransactionData.transactionId!).then((value) {
        if (value.status == 1 && value.data != null) {
          _utility.localStorage.setTransactionOnStatus(!value.data!.isChargingStop!);
          //  Navigate to charging screens
          if (value.data!.isChargingStop!) {
            Get.to(() => const ChargingSummaryScreen(), arguments: {
              ArgumentsConfig.chargerName: chargerName,
              ArgumentsConfig.transactionId: ongoingTransactionData.transactionId,
            });
          } else {
            if (ongoingTransactionData.chargeBoxId == '' || ongoingTransactionData.chargeBoxId == null) {
              CommonMethods.showSnackBarError(StringConfig.responseError);
              return;
            } else {
              Get.to(() => const ChargingDetailsScreen(), arguments: {
                ArgumentsConfig.chargerId: ongoingTransactionData.chargeBoxId,
                ArgumentsConfig.transactionId: ongoingTransactionData.transactionId,
                ArgumentsConfig.chargeByType: CommonMethods.getChargeByType(value.data!.selectedOperationType!),
                ArgumentsConfig.selectedEnergy: value.data!.selectedEnergy,
                ArgumentsConfig.selectedTime: (value.data!.totalTimeSeconds! / 3600),
                ArgumentsConfig.chargerName: ongoingTransactionData.locationName,
                ArgumentsConfig.isFromChargeByScreen: false
              });
            }
          }
        }
      }).catchError((error) {
        printLog('Error in get transaction meter value API call - $error');
      });
    } else {
      // if transaction id is not available
      CommonMethods.showSnackBarError(StringConfig.responseError);
      return;
    }
  }

  // to open google map with charger location
  void openMap(Datum charger) async {
    Get.back();
    MapsLauncher.launchCoordinates(
        double.parse(charger.locationLatitude!), double.parse(charger.locationLongitude!), charger.locationName);
  }

  // To open map tooltip
  void openMapToolTipBottomSheet(Datum chargerData) {
    Get.bottomSheet(
      MapToolTipBottomSheet(charger: chargerData),
      backgroundColor: flavor.appColors!.appBgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
    );
  }

// To go back
  void onBack() => Get.back();

  @override
  BaseFlavorConfig get flavor => _utility.flavor.currentFlavor;

  @override
  StyleController get styles => _utility.style;

  RxList<Datum> get chargerLocationList => _chargerLocationList;

  RxList<Datum> get searchedChargerList => _searchedChargerList;

  TextEditingController get searchController => _searchController; // Transaction data

  ScrollController get scrollController => _scrollController;

  RxBool get showSearchIcon => _showSearchIcon;

  Map<MarkerId, Marker> get markers => _markers;

  GoogleMapController? get controller => _controller;

  Rx<bool> get isLoading => _isLoading;
}
