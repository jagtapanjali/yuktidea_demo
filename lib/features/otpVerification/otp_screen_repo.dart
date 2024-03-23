import 'package:yuktidea_demo/constants/constants.dart';
import 'package:yuktidea_demo/features/otpVerification/otp_screen_form_ui_model.dart';

class OTPScreenRepo{

  verifyOtpApi(String phoneNumber, String code) async {
    try {
      var param = {
        APIConstant.requestKeys.code: code,
        APIConstant.requestKeys.phone: phoneNumber,
      };

      Utility.showLoadingView();
      ApiResponseModel response = await apiServices.postMethod(
          APIConstant.verifyOtp,
          param);
      Utility.hideLoadingView();

      if (response.statusCode ?? false) {
        return OtpScreenModel.fromJson(response.data);
      } else {
        if (response.data != null) {

        } else {
          Utility.showSnackBar(response.message ?? "");
        }
      }
    } catch (e) {
      printLog(e);
    }
  }

}
