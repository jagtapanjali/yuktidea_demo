import 'package:yuktidea_demo/constants/constants.dart';
import 'package:yuktidea_demo/features/getCountry/country_screen_repo.dart';
import 'country_screen_form_ui_model.dart';

class CountryScreenController extends GetxController {
  static final CountryScreenController shared =
      CountryScreenController._internal();
  var data = false.obs;
  var countryList = <CountryScreenModel>[].obs;

  factory CountryScreenController() {
    return shared;
  }

  CountryScreenController._internal();

  getCountryList() async {
    try {
      //countryList.clear();
      // if internet connected then call api otherwise navigate to dashboard(if available userdata)
      if (NetworkManager.shared.isInternetConnected) {
        var res = await CountryScreenRepo().getCountryListResponse();
        countryList.value = res
            .map<CountryScreenModel>((json) => CountryScreenModel.fromJson(json))
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
