import 'package:yuktidea_demo/constants/constants.dart';
import 'package:yuktidea_demo/features/getCountry/country_screen_repo.dart';
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

  getCountryList() async {
    try {
      countryList.clear();
      // if internet connected then call api otherwise navigate to dashboard(if available userdata)
      if (NetworkManager.shared.isInternetConnected) {
        var res = await CountryScreenRepo().getCountryListResponse();
        countryList.value = res
            .map<PhoneNumberScreenModel>((json) => PhoneNumberScreenModel.fromJson(json))
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
