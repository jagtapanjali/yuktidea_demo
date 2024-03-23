import 'package:yuktidea_demo/constants/constants.dart';
import 'package:yuktidea_demo/features/getCountry/country_screen_repo.dart';
import 'package:yuktidea_demo/features/otpVerification/otp_screen_repo.dart';
import 'otp_screen_form_ui_model.dart';

class OTPScreenController extends GetxController {
  static final OTPScreenController shared =
      OTPScreenController._internal();

  factory OTPScreenController() {
    return shared;
  }

  OTPScreenController._internal();

  verifyOtp(String code) async {
    try {
      String phoneNumber = await SharedPreferenceController.shared.getPhoneNumber();
      // if internet connected then call api otherwise navigate to dashboard(if available userdata)
      if (NetworkManager.shared.isInternetConnected) {
        OtpScreenModel? data = await OTPScreenRepo().verifyOtpApi(phoneNumber, code);
        if (data != null) {
          await SharedPreferenceController.shared.setToken(data.accessToken ?? "");
          return true;
        }else{
          return false;
        }
      } else {
        Utility.showSnackBar(StringHelper.noInternetConnection);
        return false;
      }
    } catch (e) {
      printLog(e);
    }
  }

}
