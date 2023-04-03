abstract class StringConfig {
  StringConfig._();

  // App routes
  static const String homeRoute = '/home';
  static const String resetPasswordRoute = '/resetPassword';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String splashScreenRoute = '/splash';
  static const String loginScreenRoute = '/login';
  static const String registerScreenRoute = '/register';
  static const String otpScreenRoute = '/otp';
  static const String qrScannerScreenRoute = '/qrScanner';
  static const String chargingDetailsScreenRoute = '/chargingDetails';
  static const String chargeByScreenRoute = '/chargeBy';
  static const String settingsScreenRoute = '/settings';
  static const String mapScreenRoute = '/map';
  static const String paymentScreenRoute = '/payment';
  static const String paymentHistoryScreenRoute = '/paymentHistory';
  static const String paymentSummaryScreenRoute = '/paymentSummary';
  static const String historyScreenRoute = '/history';
  static const String profileScreenRoute = '/profile';
  static const String editProfileImageScreenRoute = '/editProfileImage';
  static const String chargerSummaryScreenRoute = '/chargerSummary';
  static const String changePasswordScreenRoute = '/changePassword';
  static const String historyDetailScreenRoute = '/historyDetail';

  // Splash Screen
  static const String splashScreenTagLineText = 'Charge your electric vehicle easily';
  static const String getStartedText = 'Get Started';

  //Login Screen
  static const String welcomeBackText = 'Welcome Back';
  static const String emailIdText = 'Email ID';
  static const String enterEmailText = 'Enter email ID';
  static const String passwordText = 'Password';
  static const String forgotPasswordText = 'Forgot Password?';
  static const String enterPasswordText = 'Enter Password';
  static const String registerAccountText = "Don't have an account? ";
  static const String registerText = 'Register';
  static const String orText = 'OR';
  static const String continueText = 'Continue';

  // Forgot Password
  static const String forgotPassword = 'Forgot Password';
  static const String pleaseEnterYourRegisteredEmail =
      'Please enter your registered email address and we will send you reset password link.';
  static const String submit = 'Submit';

  // Reset Password
  static const String resetPassword = 'Reset Password';
  static const String confirmPassword = 'Confirm Password';
  static const String changePassword = 'Change Password';
  static const String otp = 'OTP';
  static const String pleaseEnterTheNewPassword = 'Please enter the new password';
  static const String pleaseEnterTheCurrentPassword = 'Please enter the current password';

  // Field validations
  static const String pleaseProvideValidEmail = 'Please provide valid Email ID';
  static const String passwordLengthError = 'The password must be at least 8 characters';
  static const String specialCharValidation =
      'Password must contain at least one number and both uppercase and lowercase letters.';
  static const String pleaseEnterPassword = 'Please enter password';
  static const String pleaseEnterEmail = 'Please enter Email ID';
  static const String validateUsername = 'Please enter your username';
  static const String passwordsDoNotMatch = 'Passwords do not match';
  static const String validateUsernameLength = 'The username must be at least 3 characters';
  static const String validateMobileLength = 'The mobile no must be at least 10 characters.';
  static const String validateMobile = 'Please enter your mobile number';
  static const String validateTAndC = 'Please agree to terms and condition';
  static const String invalidCodePleaseReenterYourCode = 'Invalid Code. Please re-enter your code.';
  static const String verificationCodeHasExpired = 'Verification code has expired.\nTo send a new code, select resend.';
  static const String fieldCannotBeEmpty = 'This field cann\'t be empty';
  static const String validateChargerIdField = 'Please enter charger ID';
  static const String emptyOTPValidation = 'Please enter valid OTP';
  static const String otpLengthError = 'Invalid OTP, Please enter valid OTP';
  static const String firebaseInvalidOTPError =
      'The SMS verification code used to create the phone auth credential is invalid. Please resend the verification code SMS and be sure to use the verification code provided by the user.';
  static const String firebaseInvalidOTPErrorSmallLetters =
      'The sms verification code used to create the phone auth credential is invalid. Please resend the verification code sms and be sure use the verification code provided by the user.';
  static const String selectTimeErrorMessage = 'Please add energy, time or amount to start transaction';
  static const String firebaseOTPExpireMsg =
      'The SMS code has expired. Please re-send the verification code to try again.';
  static const String firebaseOTPExpireMsgSmall =
      'The sms code has expired. Please re-send the verification code to try again.';

  // Register Screen
  static const String usernameText = 'Username';
  static const String countryCodeText = 'Country Code';
  static const String mobileFieldText = 'Mobile';
  static const String enterMobileText = 'Mobile Number';
  static const String confirmPasswordFieldText = 'Confirm Password';
  static const String enterConfirmPasswordText = 'Enter Confirm Password';
  static const String tAndCText = 'I agree to all terms and condition';
  static const String loginAccountText = 'Already have an account? ';
  static const String loginText = 'Login';
  static const String createAccountText = 'Create an Account';
  static const String firstNameText = 'First name';
  static const String lastNameText = 'Last name';
  static const String pickYourCountryText = 'Pick your country';
  static const String countryPickerPackageName = 'country_list_pick';

  // OTP Screen
  static const String otpTagLine = 'OTP sent to your mobile number';
  static const String otpTagLineSubstring = 'X XXX XX';
  static const String verifyText = 'Verify';
  static const String resendOTPText = 'Resend OTP';
  static const String resendOTPTimerText = 'Resend OTP in';
  static const String secondText = 'seconds';
  static const String otpVerificationText = 'OTP Verification';
  static const String resendOTPMessage = 'OTP send successfully to you register mobile number';
  static const String sendOTPMessage = 'OTP sent successfully to you register mobile number';
  static const String otpFieldKey = ' otpTextField';
  static const String validMobileError = 'Please enter valid mobile number';
  static const String mobileFormatError =
      'The format of the phone number provided is incorrect. Please enter the phone number in a format that can be parsed into E.164 format. E.164 phone numbers are written in the format [+][country code][subscriber number including area code].';
  static const String mobileFormatErrorWithFormatExample =
      "The format of the phone number provided is incorrect. Please enter the phone number in a format that can be parsed into E.164 format. E.164 phone numbers are written in the format [+][country code][subscriber number including area code]. [ Invalid format. ]";
  static const String tooLongMobileNumberError = 'TOO_LONG';
  static const String tooShortMobileNumberError = 'TOO_SHORT';

  // Error Messages
  static const String errorTitle = 'Oops!';
  static const String successTitle = 'Success';
  static const String requestCancelled = 'Request to API server was cancelled';
  static const String connectionTimeout = 'Connection timeout with API server';
  static const String receiveTimeout = 'Receive timeout in connection with API server';
  static const String sendTimeout = 'Send timeout in connection with API server';
  static const String noInternetError = 'No Internet connection. Make sure that Wi-Fi or mobile data is turned on.';
  static const String unexpectedError = 'Oops! Unexpected error occurred. Please try again later!';
  static const String responseError = 'Oops! Something went wrong. Please try again later!';
  static const String connectorError = 'No connector available, Please try again later!';

  // QR scanner screen
  static const String qrScanner = 'QR Scanner';
  static const String connectWithChargeId = 'Connect with Charger ID';
  static const String scanTheQRCodeText = 'Scan the QR code placed on the charger for booking.';
  static const String or = 'OR';
  static const String permission = 'Permission';
  static const String missingIdError = 'Charger Id is missing, please try again!';
  static const String allowPermission = 'Please grant camera permission from app settings.';

  // Charging details screen
  static const String power = 'Power';
  static const String energyUsed = 'Energy used';
  static const String remainingTime = 'Remaining Time';
  static const String stop = 'Stop';
  static const String chargerId = 'Charger ID';
  static const String evCharger = 'EV Charger';
  static const String remainingEnergy = 'Remaining energy';
  static const String remainingAmount = 'Remaining amount';
  static const String chargingStopMsg = 'Charging completed';
  static const String updatingText = 'Updating...';
  static const String unitChargeText = 'Per unit charge';
  static const String chargingAmountText = 'Charging amount';

  // Charge By screen design
  static const String chargeBy = 'Charge By';
  static const String chargeByDescription = 'How do you want to charge your vehicle?';
  static const String start = 'Start';
  static const String energy = 'Energy';
  static const String time = 'Time';
  static const String amount = 'Amount';
  static const String selectConnector = 'Select Connector';
  static const String timerFormatText = 'Hr';
  static const String waitingStatus = 'waiting';
  static const String successStatus = 'success';
  static const String errorStatus = 'error';
  static const String startTransactionWarningText =
      'Do not kill application, if you kill it will stop the transaction!';
  static const String checkTheChargingProcess = 'Check the charging progress';

  // Charger Id dialog
  static const String chargerDialogTitle = 'Connect With Charger ID';
  static const String cancelText = 'Cancel';

  // Home Screen
  static const String emptyText = '';
  static const String exitAppConfirmationText = 'Are you sure want to exit app?';

  // History Screen
  static const String historyScreen = 'History';
  static const String totalDurationText = 'Total duration';
  static const String chargesText = 'Charges';
  static const String customerNameText = 'Customer Name';
  static const String stationName = 'Railway Station road';
  static const String date = 'Date: ';
  static const String allDaysText = 'All';
  static const String sevenDaysText = '7 Days';
  static const String fifteenDaysText = '15 Days';
  static const String thirtyDaysText = '30 Days';
  static const String selectDateText = 'Select Date';
  static const String searchText = 'Search';
  static const String dateSelectionTitle = 'Select Date';
  static const String startDateText = 'Start Date';
  static const String endDateText = 'End Date';
  static const String noTransactionFound = 'No transaction found!';

  // History Detail
  static const String historyDetailScreen = 'History Detail';
  static const String connectorID = 'Connector ID';
  static const String connectorType = 'Connector Type';
  static const String currentType = 'Current Type';
  static const String energyConsume = 'Energy Consume';
  static const String energyCharge = 'Energy Charge';
  static const String connectorImage = 'Connector Image';
  static const String stopReason = 'Stop Reason';
  static const String location = 'Location';
  static const String transactionIdTitle = 'Transaction ID';
  static const String infoTitleText = 'Other Info';

  // Settings Screen
  static const String settingsScreen = 'Settings';
  static const String themeText = 'Theme';
  static const String logoutText = 'Logout';
  static const String appVersionText = 'Version';
  static const String appVersion = 'v1.0.0';
  static const String profileText = 'Profile';
  static const String changePasswordText = 'Change Password';
  static const String logoutConfirmationText = 'Are you sure want to logout?';
  static const String saveText = 'Save';
  static const String exitText = 'Exit';
  static const String profileConfirmationText = 'Are you sure you want to exit without saving changes?';

  // Profile Screen
  static const String editProfileText = 'Edit Profile';
  static const String editProfileImageText = 'Edit Photo';
  static const String profileImageText = 'Profile Photo';
  static const String cityText = 'City';
  static const String stateText = 'State';
  static const String countryText = 'Country';
  static const String postalCodeText = 'Postal code';
  static const String addressText = 'Address';
  static const String updateText = 'Update';
  static const String changePhotoText = 'Change Profile Photo';
  static const String addPhotoText = 'Add Profile Photo';
  static const String updateDataSuccessText = 'Profile successfully updated';
  static const String emptyStateText = 'No state for selected country';
  static const String emptyCityText = 'No city for selected state';
  static const String cropImageText = 'Crop Image';
  static const String removeProfileImageConfirmationText = 'Remove profile photo?';
  static const String deleteText = 'Delete';

  // Image picker dialog
  static const String cameraButtonText = 'Camera';
  static const String galleryButtonText = 'Gallery';
  static const String selectImageText = 'Select Image';

  // Charging Summary screen
  static const String chargingSummary = 'Charging Summary';
  static const String endChargingSession = 'End Charging Session';
  static const String powerText = 'Power';
  static const String energyText = 'Energy';
  static const String durationText = 'Duration';
  static const String averageText = 'Average';
  static const String home = 'Home';
  static const String charges = 'Charges';
  static const String rupees = '\u{20B9}';
  static const String chargingUnit = 'KW';
  static const String dateText = 'Date';

  // Charger bottom sheet
  static const String chargerLocation = 'Charger location';
  static const String noChargersFound = 'No chargers found!';
  static const String ongoing = 'Ongoing';
  static const String locationText = 'Location';
  static const String chargeText = 'Charge';
  static const String statusText = 'Status';

  // Map Screen
  static const String searchHereText = 'Search here';
  static const String available = 'Available';
  static const String notAvailable = 'Not Available';
  static const String faulty = 'Faulted';
  static const String all = 'All';
  static const String charging = 'Charging';
  static const String free = 'Free';
  static const String paid = 'Paid';
  static const String inUse = 'In Use';
  static const String acConnector = 'AC';
  static const String dcConnector = 'DC';
  static const String no = 'No';
  static const String noChargerAvailableMsg = 'chargers found';
  static const String noChargerAvailableMsgSuffix = ' charger type';
  static const String chargerData = 'Charger Data';

  // Change Password screen
  static const String currentPassword = 'Current Password';
  static const String currentPasswordValidationText = 'Please add your current password';

  // Payment  Screen
  static const String walletText = 'Wallet';
  static const String availableBalance = 'Available balance';
  static const String balanceText = 'Balance';
  static const String payUsing = 'Pay using';
  static const String payText = 'Pay';
  static const String addMoneyText = 'Add money';
  static const String paymentWarningText = 'Please enter amount';
  static const String transactionsText = 'Transactions';
  static const String seeAllText = 'See All';
  static const String rupeesText = 'Rs.';
  static const String paymentSummaryMsg = 'You have successfully added money to EV charger wallet';
  static const String paymentDetails = 'Payment Details';
  static const String walletTxn = 'Wallet Txn ID: 121354857879';
  static const String transactionId = 'Transaction ID:';
  static const String needHelpText = 'Need Help?';
  static const String paymentSummary = 'Payment Summary';
  static const String successPayment = 'Money added successfully to your wallet';
  static const String failPayment = 'Payment Failed';
  static const String addMoney = 'Add money to wallet';
  static const String amountText = 'Amount(INR.)';
  static const String enterAmountText = 'Enter Amount';
  static const String addedMoneyMsg = 'Added to wallet';
  static const String selectDays = 'Select Day';
  static const String creditType = 'cr';
  static const String transactionFeesMsg = '2% Transfer fees + GST will be applicable on your transactions.';
  static const String paymentId = 'Payment Id: ';
  static const String minAmount = 'Minimum Rs. ';
  static const String minAmountPostTest = ' balance is required.';
}
