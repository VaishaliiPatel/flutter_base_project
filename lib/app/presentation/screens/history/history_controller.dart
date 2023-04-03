import 'dart:convert';

import 'package:cmsocpp/app/data/models/history/history.dart';
import 'package:cmsocpp/app/presentation/dialogs/date_selection.dart';
import 'package:cmsocpp/app/presentation/screens/history/history_detail_screen.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/base_configs/controller/style_controller.dart';
import 'package:cmsocpp/base_configs/controller/utility_controller.dart';
import 'package:cmsocpp/core/base/base_controller.dart';
import 'package:cmsocpp/utils/print_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HistoryScreenController extends ScreenController {
  late UtilityController _utility;
  final items = [
    StringConfig.allDaysText,
    StringConfig.sevenDaysText,
    StringConfig.fifteenDaysText,
    StringConfig.thirtyDaysText,
    StringConfig.selectDateText,
  ];
  int _lastPage = 1;
  int _pageNumber = 1;
  final Rx<bool> isLoading = false.obs;
  final Rx<bool> isLoadMore = false.obs;
  final RxList<Datum> _transactionList = <Datum>[].obs;
  int filterDaysCount = 0;
  Rx<bool> isAPICallOnGoing = true.obs;
  bool isDateFilter = false;

  RxList<Datum> get transactionList => _transactionList;
  final ScrollController _scrollController = ScrollController();

  ScrollController get scrollController => _scrollController;
  RxString initialDropdownValue = StringConfig.allDaysText.obs;
  String dropdownValue = StringConfig.allDaysText;

  // For show date picker initial value
  Rx<DateTime> selectedStartDate = DateTime.now().obs;
  Rx<DateTime> selectedEndDate = DateTime.now().obs;

  // For show date text field initial value
  TextEditingController startDateTextEditingController = TextEditingController(text: '');
  TextEditingController endDateTextEditingController = TextEditingController(text: '');

  // Save date for API call and pagination
  RxString startDate = ''.obs;
  RxString endDate = ''.obs;

  // On cancel popup save selected date value
  DateTime submitStartDate = DateTime.now();
  DateTime submitEndDate = DateTime.now();

  // For show date field in history screen
  RxBool isDateSelected = false.obs;

  // For enable/disable submit button on popup
  RxBool isStartDateSelected = false.obs;
  RxBool isEndDateSelected = false.obs;

  // Data for search history
  final TextEditingController _searchController = TextEditingController();

  TextEditingController get searchController => _searchController; // Transaction data
  String searchText = '';
  final RxBool _showSearchIcon = true.obs;

  RxBool get showSearchIcon => _showSearchIcon;
  final RxList<Datum> _searchedChargerList = <Datum>[].obs;

  List<Datum> get searchedChargerList => _searchedChargerList.value;
  FocusNode searchFocus = FocusNode();

  // History detail screen
  Datum histroyData = const Datum();

  @override
  void onInit() {
    _utility = ScreenController.get();
    _getTransactionHistory();
    _loadMoreData();
    super.onInit();
  }

  // added scroll controller to load more data (pagination)
  _loadMoreData() {
    _scrollController.addListener(() {
      if (_pageNumber <= _lastPage) {
        if (scrollController.position.maxScrollExtent == scrollController.position.pixels) {
          isLoadMore.value = true;
          _getTransactionHistory(
            isFromPagination: true,
            startDate: isDateFilter ? startDate.value : '',
            endDate: isDateFilter ? endDate.value : '',
            dayCount: filterDaysCount,
          );
        }
      }
    });
  }

  // Refresh page
  Future<void> onRefreshPage() {
    // Added delay to look like refreshing
    return Future.delayed(const Duration(milliseconds: 800), () {
      resetPages();
      _getTransactionHistory(
        refresh: true,
        dayCount: filterDaysCount,
        startDate: isDateFilter ? startDate.value : '',
        endDate: isDateFilter ? endDate.value : '',
      );
    });
  }

  // Get transaction history
  _getTransactionHistory({
    bool refresh = false,
    int dayCount = 0,
    String startDate = '',
    String endDate = '',
    bool isFromPagination = false,
    String searchText = '',
  }) {
    // Hide full screen loader in case if pull to refresh
    {
      if (_pageNumber == 1 && !refresh && !isFromPagination) {
        isLoading.value = true;
      }
      try {
        printLog('Transaction List--Page number--: $_pageNumber');
        // isAPICallOnGoing flag for check if API call is in progress or not
        if (isAPICallOnGoing.value) {
          isAPICallOnGoing.value = false;
          _utility.api
              .getTransactionHistory(
            page: _pageNumber,
            dayCount: dayCount,
            startDate: startDate,
            endDate: endDate,
            searchText: searchText,
          )
              .then((history) {
            if (history.status == 1) {
              isAPICallOnGoing.value = true;
              _lastPage = history.data!.transactionData!.lastPage!;
              isLoading.value = false;
              isLoadMore.value = false;
              _pageNumber = _pageNumber + 1;
              _transactionList.addAll(history.data!.transactionData!.data!);
            } else {
              isAPICallOnGoing.value = true;
              isLoading.value = false;
              isLoadMore.value = false;
            }
          });
        }
      } catch (error) {
        isAPICallOnGoing.value = true;
        printLog('Error in fetch transaction data---: ${error.toString()}');
      }
    }
  }

  // Call API on change value from dropdown
  void onChangeDropdownItem(String? newValue) {
    if (newValue == StringConfig.selectDateText) {
      isDateFilter = true;
      initialDropdownValue.value = newValue!;
      openDateSelectionDialog();
    } else {
      // On filter change hide date value
      isDateSelected.value = false;
      // On filter change enable/disable submit button
      isStartDateSelected.value = false;
      isEndDateSelected.value = false;
      dropdownValue = newValue!;
      isDateFilter = false;
      removeDateValue();
      if (newValue != initialDropdownValue.value) {
        initialDropdownValue.value = newValue;
        _pageNumber = 1;
        _transactionList.clear();
        setFilteredCount(selectedValue: newValue);
        getHistoryBasedOnFiltersAndSearch(search: searchController.text);
      }
    }
  }

  getHistoryBasedOnFiltersAndSearch({String search = ''}) {
    _getTransactionHistory(
      startDate: isDateFilter ? startDate.value : '',
      endDate: isDateFilter ? endDate.value : '',
      dayCount: filterDaysCount,
      searchText: search,
    );
  }

  setFilteredCount({required String selectedValue}) {
    switch (selectedValue) {
      case StringConfig.allDaysText:
        filterDaysCount = 0;
        break;
      case StringConfig.sevenDaysText:
        filterDaysCount = 7;
        break;
      case StringConfig.fifteenDaysText:
        filterDaysCount = 15;
        break;
      case StringConfig.thirtyDaysText:
        filterDaysCount = 30;
        break;
    }
  }

  // Open start date picker
  Future<void> openStartDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: startDateTextEditingController.text != ''
            ? selectedStartDate.value
            : endDateTextEditingController.text != ''
                ? selectedEndDate.value
                : DateTime.now(),
        firstDate: DateTime(2022, 1),
        lastDate: endDateTextEditingController.text != '' ? selectedEndDate.value : DateTime.now(),
        initialDatePickerMode: DatePickerMode.day);
    if (picked != null) {
      isStartDateSelected.value = true;
      selectedStartDate.value = picked;
      startDateTextEditingController.text = '${picked.year}-${picked.month}-${picked.day}';
    }
  }

  // Open end date picker
  Future<void> openEndDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: endDateTextEditingController.text != ''
            ? selectedEndDate.value
            : startDateTextEditingController.text != ''
                ? selectedStartDate.value
                : DateTime.now(),
        firstDate: startDateTextEditingController.text != '' ? selectedStartDate.value : DateTime(2022, 1),
        lastDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day);
    if (picked != null) {
      isEndDateSelected.value = true;
      selectedEndDate.value = picked;
      endDateTextEditingController.text = '${picked.year}-${picked.month}-${picked.day}';
    }
  }

  // For date selection
  void openDateSelectionDialog() {
    // If date filter selected then store submitted value and show in dialog
    if (isDateSelected.value) {
      // On filter change enable/disbale submit button
      isStartDateSelected.value = true;
      isEndDateSelected.value = true;
      startDateTextEditingController.text = startDate.value;
      endDateTextEditingController.text = endDate.value;
      selectedStartDate.value = submitStartDate;
      selectedEndDate.value = submitEndDate;
    }
    Get.defaultDialog(
      title: StringConfig.dateSelectionTitle,
      backgroundColor: flavor.appColors!.dialogColor,
      titleStyle: styles.titleStyle,
      contentPadding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 8.h),
      titlePadding: EdgeInsets.only(top: 20.h, bottom: 30.h, left: 20.w, right: 20.w),
      radius: 12.r,
      content: const DateSelectionDialog(),
      onWillPop: onWillPop,
    );
  }

  // On Submit from date selection popup and API call for date selection filter
  void onSubmit() {
    // Store submitted value
    startDate.value = startDateTextEditingController.text;
    endDate.value = endDateTextEditingController.text;
    submitStartDate = selectedStartDate.value;
    submitEndDate = selectedEndDate.value;
    isDateSelected.value = true;
    Get.back();
    filterDaysCount = 0;
    _pageNumber = 1;
    _transactionList.clear();
    getHistoryBasedOnFiltersAndSearch(search: searchText);
  }

  // To cancel popup
  void onCancel() {
    // if user select date and then cancel dialog
    if (dropdownValue.isNotEmpty && !isDateSelected.value) {
      removeDateValue();
      initialDropdownValue.value = dropdownValue;
      // Disable hide button
      isStartDateSelected.value = false;
      isEndDateSelected.value = false;
    }
    Get.back();
  }

  // Remove date value on close popup
  void removeDateValue() {
    startDateTextEditingController.text = '';
    endDateTextEditingController.text = '';
  }

  // On search text change
  void onSearchTextChange(String searchText) {
    this.searchText = searchText;
    Future.delayed(const Duration(milliseconds: 800), () {
      onSearchData(searchText);
    });
  }

// On search icon click
  onSearchClick() {
    _showSearchIcon.value = false;
    searchFocus.requestFocus();
  }

//  On click search cancel icon
  onClearSearchClick() {
    if (searchController.text.isNotEmpty) {
      searchController.text = '';
      resetPages();
      getHistoryBasedOnFiltersAndSearch();
    } else {
      _showSearchIcon.value = true;
    }
  }

  resetPages() {
    _pageNumber = 1;
    _lastPage = 1;
    _transactionList.clear();
    _searchedChargerList.value = [];
  }

  // Search filter API call
  void onSearchData(String searchedText) {
    printLog('On search data--${searchController.text}');
    resetPages();
    getHistoryBasedOnFiltersAndSearch(search: searchedText);
  }

  // On tap on mobile screen to close date dialog
  Future<bool> onWillPop() async {
    onCancel();
    return true;
  }

  // Navigate to history detail screen
  void navigateToHistoryDetail(Datum data) {
    String stringData = json.encode(data.toJson());
    Get.to(() => const HistoryDetailScreen(), arguments: {
      ArgumentsConfig.historyData: stringData,
    });
  }
  @override
  BaseFlavorConfig get flavor => _utility.flavor.currentFlavor;

  @override
  StyleController get styles => _utility.style;
}
