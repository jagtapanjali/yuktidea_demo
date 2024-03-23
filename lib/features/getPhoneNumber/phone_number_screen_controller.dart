import 'package:yuktidea_demo/constants/constants.dart';
import 'package:yuktidea_demo/features/getCountry/country_screen_repo.dart';
import 'package:yuktidea_demo/features/getPhoneNumber/phone_number_screen_repo.dart';
import 'phone_number_screen_form_ui_model.dart';

class PhoneNumberScreenController extends GetxController {
  static final PhoneNumberScreenController shared =
      PhoneNumberScreenController._internal();
  var data = false.obs;
  var countryList = <PhoneNumberScreenModel>[].obs;

  factory PhoneNumberScreenController() {
    return shared;
  }

  PhoneNumberScreenController._internal();

  login(String phoneNumber, String telCode, int userType) async {
    try {
      // if internet connected then call api otherwise navigate to dashboard(if available userdata)
      if (NetworkManager.shared.isInternetConnected) {
        PhoneNumberScreenModel? data = await PhoneNumberScreenRepo()
            .loginApi(phoneNumber: phoneNumber,telCode: telCode, userType: userType);
        if (data != null) {
          await SharedPreferenceController.shared
              .setPhoneNumber(data.phone ?? "");
          return true;
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
