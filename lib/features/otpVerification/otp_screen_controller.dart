import 'package:yuktidea_demo/constants/constants.dart';
import 'package:yuktidea_demo/features/getCountry/country_screen_repo.dart';
import 'otp_screen_form_ui_model.dart';

class OTPScreenController extends GetxController {
  static final OTPScreenController shared =
      OTPScreenController._internal();
  var data = false.obs;
  var countryList = <OTPScreenModel>[].obs;

  factory OTPScreenController() {
    return shared;
  }

  OTPScreenController._internal();

  getCountryList() async {
    try {
      countryList.clear();
      // if internet connected then call api otherwise navigate to dashboard(if available userdata)
      if (NetworkManager.shared.isInternetConnected) {
        var res = await CountryScreenRepo().getCountryListResponse();
        countryList.value = res
            .map<OTPScreenModel>((json) => OTPScreenModel.fromJson(json))
            .toList();
        data.value = true;
      } else {
        Utility.showSnackBar(StringHelper.noInternetConnection);
      }
    } catch (e) {
      Utility.showSnackBar(StringHelper.somethingWentWrong);
      printLog(e);
    }
  }

}
