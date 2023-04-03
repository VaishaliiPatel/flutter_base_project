import 'package:cmsocpp/app/data/models/payment_history/payment_history.dart';
import 'package:cmsocpp/app/data/models/user_data/user_data.dart';
import 'package:cmsocpp/app/presentation/bottom_sheet/add_amount.dart';
import 'package:cmsocpp/app/presentation/dialogs/date_selection_for_payment.dart';
import 'package:cmsocpp/app/presentation/screens/payment/payment_history.dart';
import 'package:cmsocpp/app/presentation/screens/payment/payment_summary.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/base_configs/controller/style_controller.dart';
import 'package:cmsocpp/base_configs/controller/utility_controller.dart';
import 'package:cmsocpp/core/base/base_controller.dart';
import 'package:cmsocpp/utils/common_methods.dart';
import 'package:cmsocpp/utils/print_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreenController extends ScreenController {
  late UtilityController utility;

  // Payment history screen data
  final Rx<bool> _isLoading = false.obs;

  Rx<bool> get isLoading => _isLoading;
  RxBool isRazorpaySelected = false.obs;
  late Razorpay razorpay;
  RxDouble balance = 0.0.obs;
  RxDouble reservedBalance = 0.0.obs;
  final formKey = GlobalKey<FormState>();
  int selectedAmount = 0;
  String selectedAmountValue = '';
  RxBool isPayEnable = false.obs;

  RxBool isAPICallOnGoing = true.obs;

  RxString initialDropdownValue = StringConfig.allDaysText.obs;
  final items = [
    StringConfig.allDaysText,
    StringConfig.sevenDaysText,
    StringConfig.fifteenDaysText,
    StringConfig.thirtyDaysText,
    StringConfig.selectDateText,
  ];
  bool isDateFilter = false;
  String dropdownValue = StringConfig.allDaysText;

  // filterDaysCount var for save count for pagination
  int filterDaysCount = 0;
  final Rx<bool> _isLoadingPaymentHistoryData = false.obs;

  Rx<bool> get isLoadingPaymentHistoryData => _isLoadingPaymentHistoryData;
  final ScrollController _scrollController = ScrollController();

  ScrollController get scrollController => _scrollController;
  final RxList _transactionList = <Datum>[].obs;

  RxList get transactionList => _transactionList;

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

  // Payment summery screen data
  int _lastPage = 1;
  int _pageNumber = 1;
  final Rx<bool> isLoadMore = false.obs;
  String paymentId = '';
  String paymentTime = '';

  @override
  void onInit() {
    utility = ScreenController.get();
    getUserWalletDetails();
    razorpayInit();
    getPaymentHistory();
    _loadMoreData();
    super.onInit();
  }

  // Initialise razorpay
  void razorpayInit() {
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
  }

  // get user wallet balance
  void getUserWalletDetails() {
    utility.api.getUserWalletDetails().then((wallet) {
      if (wallet.status == 1) {
        balance.value = wallet.data!.wallet!;
        reservedBalance.value = wallet.data!.reservedWalletBal!;
      }
    });
  }

  // For open sheet for add money to wallet
  void openBottomSheet() {
    Get.bottomSheet(
      const AddMoneyToWalletBottomSheet(),
      backgroundColor: flavor.appColors!.appBgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
    );
  }

  void navigateToPaymentHistory() {
    Get.to(() => const PaymentHistoryScreen());
    getPaymentHistory();
  }

  // On pay click
  void onPayment() {
    CommonMethods.hideKeyBoard();
    // To close bottom sheet
    Get.back();

    // Get user credential
    var str = utility.localStorage.getUserData();
    UserDataModel userModel = userDataModelFromJson(str);
    addAmountToWallet(email: userModel.email!, mobile: userModel.mobile!);
  }

  // Razorpay  payment gateway
  void addAmountToWallet({required String mobile, required String email}) {
    try {
      // In live mode , change static data
      var options = {
        'key': ApiConfig.paymentKey,
        'amount': selectedAmount * 100,
        'name': 'Bacancy Charger Station',
        'description': 'EV Charger',
        'retry': {'enabled': true, 'max_count': 1},
        'send_sms_hash': true,
        'prefill': {'contact': mobile, 'email': email},
      };
      razorpay.open(options);
    } catch (error) {
      printLog('Error in payment--${error.toString()}');
    }
  }

  // Razorpay API failure
  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    CommonMethods.showSnackBarError(response.message ?? StringConfig.failPayment);
    printLog(
        '"Payment Failed", "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}"');
  }

  // Razorpay API success
  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    printLog('"Payment Successful", "Payment ID: ${response.paymentId}"');
    paymentId = response.paymentId ?? '';
    updateWalletBalance();
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    printLog('"External Wallet Selected", "${response.walletName}"');
  }

  // API call for update wallet
  Future<void> updateWalletBalance() async {
    try {
      _isLoadingPaymentHistoryData.value = true;
      utility.api.updateWallet(balance: selectedAmount, paymentId: paymentId).then((value) {
        if (value.status == 1) {
          _isLoadingPaymentHistoryData.value = false;
          CommonMethods.showSnackBarSuccess(value.message!);
          navigateToPaymentSummary();
        } else {
          _isLoadingPaymentHistoryData.value = false;
        }
      }).catchError((error) {
        _isLoadingPaymentHistoryData.value = false;
        printLog('Error in update data catch---$error');
      });
    } catch (error) {
      _isLoadingPaymentHistoryData.value = false;
      printLog('Error in update data---$error');
    }
  }

  void navigateToPaymentSummary() {
    var time = DateTime.now();
    paymentTime = '${DateFormat('hh:mm a').format(time)}, ${DateFormat("d MMM yyyy").format(time)}';
    Get.to(() => const PaymentSummaryScreen());
  }

  // API call for get payment history
  Future<void> getPaymentHistory({
    bool isFromPagination = false,
    int dayCount = 0,
    String startDate = '',
    String endDate = '',
  }) async {
    try {
      if (!isFromPagination) {
        _isLoadingPaymentHistoryData.value = true;
      }
      if (isAPICallOnGoing.value) {
        isAPICallOnGoing.value = false;
        utility.api
            .paymentHistory(dayCount: dayCount, startDate: startDate, endDate: endDate, page: _pageNumber)
            .then((value) {
          if (value.status == 1) {
            isAPICallOnGoing.value = true;
            _lastPage = value.data!.paymentHistory!.lastPage!;
            _isLoadingPaymentHistoryData.value = false;
            isLoadMore.value = false;
            _pageNumber = _pageNumber + 1;
            _transactionList.addAll(value.data!.paymentHistory!.data!);
          } else {
            isLoadMore.value = false;
            _isLoadingPaymentHistoryData.value = false;
          }
          isAPICallOnGoing.value = true;
        }).catchError((error) {
          isAPICallOnGoing.value = true;
          _isLoadingPaymentHistoryData.value = false;
          printLog('Error in payment history data catch---$error');
        });
      }
    } catch (error) {
      _isLoadingPaymentHistoryData.value = false;
      printLog('Error in  payment history data---$error');
    }
  }

  // Added scroll controller to load more data (pagination)
  _loadMoreData() {
    _scrollController.addListener(() {
      if (_pageNumber <= _lastPage) {
        if (scrollController.position.maxScrollExtent == scrollController.position.pixels) {
          isLoadMore.value = true;
          getPaymentHistory(
            isFromPagination: true,
            startDate: isDateFilter ? startDate.value : '',
            endDate: isDateFilter ? endDate.value : '',
            dayCount: filterDaysCount,
          );
        }
      }
    });
  }

  // Call API on change value from dropdown
  void onChangeDropdownItem(String? newValue) {
    if (newValue == StringConfig.selectDateText) {
      filterDaysCount = 0;
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
        switch (newValue) {
          case StringConfig.allDaysText:
            filterDaysCount = 0;
            getPaymentHistory(dayCount: 0, startDate: '', endDate: '');
            break;
          case StringConfig.sevenDaysText:
            filterDaysCount = 7;
            getPaymentHistory(dayCount: 7, startDate: '', endDate: '');
            break;
          case StringConfig.fifteenDaysText:
            filterDaysCount = 15;
            getPaymentHistory(dayCount: 15, startDate: '', endDate: '');
            break;
          case StringConfig.thirtyDaysText:
            filterDaysCount = 30;
            getPaymentHistory(dayCount: 30, startDate: '', endDate: '');
            break;
        }
      }
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
      content: const DateSelectionForPaymentDialog(),
      onWillPop: onWillPop,
    );
  }

  // Remove date value on close popup
  void removeDateValue() {
    startDateTextEditingController.text = '';
    endDateTextEditingController.text = '';
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
    getPaymentHistory(startDate: startDate.value, endDate: endDate.value);
  }

  // To go back
  void onBack() => Get.back();

  // On back from mobile back button from paymnet summary screen
  Future<bool> onWillPopFormSummary() async {
    onBackFromSummary();
    return true;
  }

  void onBackFromSummary() {
    _pageNumber = 1;
    _transactionList.clear();
    getUserWalletDetails();
    getPaymentHistory();
    Get.back();
  }

  // Refresh page
  Future<void> onRefreshPage() {
    // Added delay to look like refreshing
    return Future.delayed(const Duration(milliseconds: 800), () {
      _transactionList.clear();
      _pageNumber = 1;
      _lastPage = 1;
      getPaymentHistory();
      getUserWalletDetails();
      isDateSelected.value = false;
      initialDropdownValue.value = StringConfig.allDaysText;
    });
  }

  @override
  void onClose() {
    razorpay.clear();
    super.onClose();
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

  // Select transaction mode
  void onChangePaymentMode() {
    isRazorpaySelected.value = !isRazorpaySelected.value;
  }

  // On tap on mobile screen to close date dialog
  Future<bool> onWillPop() async {
    onCancel();
    return true;
  }

  @override
  BaseFlavorConfig get flavor => utility.flavor.currentFlavor;

  @override
  StyleController get styles => utility.style;
}
