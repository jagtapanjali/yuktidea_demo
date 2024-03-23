import 'package:yuktidea_demo/constants/constants.dart';
import 'package:yuktidea_demo/features/getPhoneNumber/phone_number_screen_form_ui_model.dart';

class PhoneNumberScreenRepo{

  loginApi({required String phoneNumber,required String telCode,required int userType}) async {
    try {
      var header = await APIConstant.getHeader([
        ApiHeader.contentTypeJson,
      ]);

      var param = {
        APIConstant.requestKeys.telCode: telCode,
        APIConstant.requestKeys.phone: phoneNumber,
      };

      Utility.showLoadingView();
      ApiResponseModel response = await apiServices.postMethod(
          userType == 1 ? APIConstant.studentLogin : APIConstant.counsellorLogin,
          param,
          headers: header);
      Utility.hideLoadingView();

      if (response.statusCode ?? false) {
        return PhoneNumberScreenModel.fromJson(response.data);
      } else {
        if (response.data != null) {
          Get.dialog(CustomAlertDialog(
            title: StringHelper.errorOops,
            message: response.message ?? StringHelper.somethingWentWrong,
            isForcedDialog: false,
            positiveBtnText: StringHelper.okay,
          ));
        } else {
          Utility.showSnackBar(response.message ?? "");
        }
      }
    } catch (e) {
      printLog(e);
    }
  }

}
