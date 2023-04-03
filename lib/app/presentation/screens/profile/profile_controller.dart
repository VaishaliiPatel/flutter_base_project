import 'package:cmsocpp/app/data/models/user_profile/user_profile.dart';
import 'package:cmsocpp/app/data/network/api_controller.dart';
import 'package:cmsocpp/app/presentation/bottom_sheet/edit_profile_image.dart';
import 'package:cmsocpp/app/presentation/dialogs/image_picker_dialog.dart';
import 'package:cmsocpp/app/presentation/dialogs/profile_confirmation.dart';
import 'package:cmsocpp/app/presentation/dialogs/remove_profile_image_confirmation.dart';
import 'package:cmsocpp/app/presentation/screens/profile/edit_profile_image_screen.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/base_configs/controller/style_controller.dart';
import 'package:cmsocpp/base_configs/controller/utility_controller.dart';
import 'package:cmsocpp/core/base/base_controller.dart';
import 'package:cmsocpp/core/base/base_instance.dart';
import 'package:cmsocpp/utils/common_methods.dart';
import 'package:cmsocpp/utils/print_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends ScreenController {
  late UtilityController utility;
  late ApiController apiController;
  final formKey = GlobalKey<FormState>();
  RxString userFirstName = ''.obs;
  RxString userLastName = ''.obs;
  RxString imagePath = ''.obs;
  RxString imageName = ''.obs;
  RxString localImageUrl = ''.obs;
  Data? userData;
  TextEditingController emailTextEditingController = TextEditingController(text: '');
  TextEditingController mobileTextEditingController = TextEditingController(text: '');
  TextEditingController firstNameTextEditingController = TextEditingController(text: '');
  TextEditingController lastNameTextEditingController = TextEditingController(text: '');
  TextEditingController postalCodeTextEditingController = TextEditingController(text: '');
  TextEditingController addressTextEditingController = TextEditingController(text: '');

  /// Variables to store country state city data in onChanged method.
  RxString country = ''.obs;
  RxString state = ''.obs;
  RxString city = ''.obs;

  // For API call
  final Rx<bool> isLoading = false.obs;
  RxBool isScreenLoad = false.obs;
  RxBool isShowAddressToast = false.obs;
  bool isImageDeleted = false;

  @override
  void onInit() {
    utility = ScreenController.get();
    apiController = BaseInstance.get();
    getUserData();
    super.onInit();
  }

  // Get user data
  Future<void> getUserData() async {
    try {
      isLoading.value = true;
      printLog('Get user data----------');
      apiController.getUserProfile().then((value) {
        isScreenLoad.value = true;
        userData = Data(
          firstName: value.data!.firstName,
          lastName: value.data!.lastName,
          country: value.data!.country,
          state: value.data!.state,
          city: value.data!.city,
          pincode: value.data!.pincode,
          address: value.data!.address,
          userImage: value.data!.userImage,
        );
        if (value.data != null) {
          printLog('Get user data----$value');
          firstNameTextEditingController.text = value.data!.firstName ?? '';
          userFirstName.value = value.data!.firstName ?? '';
          lastNameTextEditingController.text = value.data!.lastName ?? '';
          userLastName.value = value.data!.lastName ?? '';
          mobileTextEditingController.text = value.data!.mobileNo ?? '';
          emailTextEditingController.text = value.data!.email ?? '';
          country.value = value.data!.country ?? '';
          state.value = value.data!.state ?? '';
          city.value = value.data!.city ?? '';
          postalCodeTextEditingController.text = value.data!.pincode ?? '';
          addressTextEditingController.text = value.data!.address ?? '';
          imagePath.value = value.data!.userImage ?? '';
        }
      });
    } catch (error) {
      printLog('Error in fetch data---$error');
    }
    Future.delayed(const Duration(seconds: 5), () {
      isShowAddressToast.value = true;
    });
  }

  // To open image picker dialogs
  void getImagePickerDialog() {
    Get.defaultDialog(
      onWillPop: onWillPop,
      title: StringConfig.selectImageText,
      backgroundColor: flavor.appColors!.dialogColor,
      titleStyle: styles.titleStyle,
      contentPadding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 8.h),
      titlePadding: EdgeInsets.only(top: 20.h, bottom: 30.h, left: 20.w, right: 20.w),
      radius: 12.r,
      content: const ImagePickerDialog(),
    );
  }

  // For pic image fom camera or gallery
  Future getImage({bool isFromCamera = true}) async {
    Get.back();
    try {
      var pickedImage = isFromCamera
          ? await ImagePicker().pickImage(
              source: ImageSource.camera,
              maxWidth: 1080,
              maxHeight: 1080,
            )
          : await ImagePicker().pickImage(
              source: ImageSource.gallery,
              maxWidth: 1080,
              maxHeight: 1080,
            );
      if (pickedImage == null) return;
      cropImage(pickedImage);
      imageName.value = pickedImage.name;
    } on PlatformException catch (e) {
      printLog('Failed to pick image: $e');
    } catch (e) {
      printLog('Failed to pick image catch: $e');
    }
  }

  // Crop selected image
  void cropImage(XFile? pickedImage) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedImage!.path,
      maxWidth: 1080,
      maxHeight: 1080,
      cropStyle: CropStyle.circle,
      aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: StringConfig.cropImageText,
          toolbarColor: ColorConfig.primaryColor,
          toolbarWidgetColor: flavor.appColors!.appBgColor,
          showCropGrid: false,
          lockAspectRatio: false,
          activeControlsWidgetColor: ColorConfig.primaryColor,
          statusBarColor: flavor.appColors!.appBgColor,
          initAspectRatio: CropAspectRatioPreset.square,
        ),
        IOSUiSettings(
          title: StringConfig.cropImageText,
        ),
      ],
    );
    if (croppedFile != null) {
      imagePath.value = croppedFile.path;
      localImageUrl.value = croppedFile.path;
    }
  }

  // Submit profile
  void onSubmitProfile() async {
    final isValid = formKey.currentState != null && formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    updateProfileData();
  }

  Future<void> updateProfileData() async {
    try {
      isLoading.value = true;
      apiController
          .updateUserProfile(
        firstName: firstNameTextEditingController.text,
        lastName: lastNameTextEditingController.text,
        city: city.value,
        state: state.value,
        country: country.value,
        pinCode: postalCodeTextEditingController.text,
        address: addressTextEditingController.text,
        fileName: imageName.value,
        localImage: localImageUrl.value,
        removeImg: isImageDeleted ? 1 : 0,
      )
          .then((value) {
        if (value.status == 1) {
          isLoading.value = false;
          isImageDeleted = false;
          Get.back();
          CommonMethods.showSnackBarSuccess(StringConfig.updateDataSuccessText);
        } else {
          isLoading.value = false;
        }
      });
    } catch (error) {
      printLog('Error in fetch data---$error');
    }
  }

  // To open image picker dialogs
  void getProfileExitDialog() {
    Get.defaultDialog(
      onWillPop: onWillPop,
      title: StringConfig.profileConfirmationText,
      backgroundColor: flavor.appColors!.dialogColor,
      titleStyle: styles.titleStyle,
      contentPadding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 8.h),
      titlePadding: EdgeInsets.only(top: 20.h, bottom: 30.h, left: 20.w, right: 20.w),
      radius: 12.r,
      content: const ProfileConfirmationDialog(),
    ).then(
      (value) {},
    );
  }

  void onSaveData() {
    CommonMethods.hideKeyBoard();
    Get.back();
    onSubmitProfile();
  }

  // To go back
  void onBack() {
    CommonMethods.hideKeyBoard();
    Data updatedUserData = Data(
      firstName: firstNameTextEditingController.text != '' ? firstNameTextEditingController.text : null,
      lastName: lastNameTextEditingController.text != '' ? lastNameTextEditingController.text : null,
      country: country.value != '' ? country.value : null,
      state: state.value != '' ? state.value : null,
      city: city.value != '' ? city.value : null,
      pincode: postalCodeTextEditingController.text != '' ? postalCodeTextEditingController.text : null,
      address: addressTextEditingController.text != '' ? addressTextEditingController.text : null,
      userImage: imagePath.value != '' ? imagePath.value : null,
    );
    if (updatedUserData == userData || userData == null) {
      Get.back();
    } else {
      getProfileExitDialog();
    }
  }

  // On profile image tap
  void navigateToEditProfileImage() {
    Get.to(() => const EditProfileImageScreen());
  }

  // To open edit profile bottom sheet
  void openBottomSheetForEditProfile() {
    Get.bottomSheet(
      const EditProfileImageBottomSheet(),
      backgroundColor: flavor.appColors!.appBgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
    );
  }

  // To open remove profile image confirmation dialogs
  void removeProfileIMageConfirmationDialog() {
    Get.back();
    Get.defaultDialog(
      onWillPop: onWillPop,
      title: StringConfig.removeProfileImageConfirmationText,
      backgroundColor: flavor.appColors!.dialogColor,
      titleStyle: styles.titleStyle,
      contentPadding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 8.h),
      titlePadding: EdgeInsets.only(top: 20.h, bottom: 30.h, left: 20.w, right: 20.w),
      radius: 12.r,
      content: const RemoveProfileConfirmationDialog(),
    );
  }

  // Delete profile image
  void onDeleteProfileImage() {
    Get.back();
    imagePath.value = '';
    localImageUrl.value = '';
    isImageDeleted = true;
  }

  // Exit screen from dialog
  void onBackFromDialog() {
    CommonMethods.hideKeyBoard();
    Get.back();
    Get.back();
  }

  // On tap on screen while dialog is open
  Future<bool> onWillPop() async {
    onClosePage();
    return true;
  }

  // On back from mobile back button for profile screen
  Future<bool> onWillPopProfile() async {
    onBack();
    return true;
  }

  // For close bottom sheet
  void onClosePage() => Get.back();

  @override
  void dispose() {
    isScreenLoad.value = false;
    emailTextEditingController.clear();
    mobileTextEditingController.clear();
    firstNameTextEditingController.clear();
    lastNameTextEditingController.clear();
    postalCodeTextEditingController.clear();
    addressTextEditingController.clear();
    super.dispose();
  }

  @override
  BaseFlavorConfig get flavor => utility.flavor.currentFlavor;

  @override
  StyleController get styles => utility.style;
}