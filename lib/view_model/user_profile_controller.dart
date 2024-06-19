import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/models/api_responses/get_user_profile_response_model.dart';
import 'package:greeve/services/api/api_user_serpice.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';
import 'package:greeve/view/user_profile/widgets/user_profile_dialog_widget.dart';
import 'package:greeve/view_model/home_controller.dart';

class UserProfileController extends GetxController {
  final ApiUserService _apiUserService = ApiUserService();
  Rx<GetUserProfileResponseModel?> userProfileData =
      Rx<GetUserProfileResponseModel?>(null);
  Rx<String?> errorMessage = Rx<String?>(null);
  Rx<bool> isLoading = Rx<bool>(false);
  Rx<String> selectedOption = Rx<String>('Laki-laki');

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();

  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get phoneNumberController => _phoneNumberController;
  TextEditingController get addressController => _addressController;
  FocusNode get nameFocusNode => _nameFocusNode;
  FocusNode get emailFocusNode => _emailFocusNode;
  FocusNode get phoneNumberFocusNode => _phoneNumberFocusNode;
  FocusNode get addressFocusNode => _addressFocusNode;

  @override
  void onInit() {
    getUserProfile();
    super.onInit();
  }

  void getUserProfile() async {
    final String? token = await SharedPreferencesManager.getToken();
    isLoading.value = true;
    try {
      final result = await _apiUserService.getUserProfile(token);
      userProfileData.value = result;
      _nameController.text = result.data?.name ?? '';
      _emailController.text = result.data?.email ?? '';
      _phoneNumberController.text = result.data?.phone ?? '';
      _addressController.text = result.data?.address ?? '';
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void updateUserProfile() async {
    final String? token = await SharedPreferencesManager.getToken();
    isLoading.value = true;
    try {
      final result = await _apiUserService.updateUserProfile(
        token,
        _emailController.text,
        name: _nameController.text,
        phone: _phoneNumberController.text,
        address: _addressController.text,
        gender: selectedOption.value,
      );
      errorMessage.value = '';
      if (result.status == true && result.data != null) {
        SharedPreferencesManager.saveToken(token: result.data!.token!);
      }
      showSaveSuccessDialog();
      getUserProfile();
      Get.find<HomeController>().getUserProfile();
    } catch (e) {
      showSaveFailedDialog(e.toString());
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void setSelectedOption(String value) => selectedOption.value = value;
}
