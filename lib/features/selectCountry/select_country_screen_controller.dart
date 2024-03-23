import 'package:yuktidea_demo/constants/constants.dart';
import 'package:yuktidea_demo/features/getCountry/country_screen_repo.dart';
import 'package:yuktidea_demo/features/getPhoneNumber/phone_number_screen_repo.dart';
import 'package:yuktidea_demo/features/selectCountry/select_country_screen_repo.dart';
import 'select_country_screen_form_ui_model.dart';

class SelectCountryScreenController extends GetxController {
  static final SelectCountryScreenController shared =
      SelectCountryScreenController._internal();
  var data = false.obs;
  var countryList = <SelectCountryScreenModel>[].obs;
  var opacity = [].obs;

  factory SelectCountryScreenController() {
    return shared;
  }

  SelectCountryScreenController._internal();


  getCountryList() async {
    try {
      //countryList.clear();
      // if internet connected then call api otherwise navigate to dashboard(if available userdata)
      opacity.value = List<num>.generate(5,(counter) => 0.3);
      if (NetworkManager.shared.isInternetConnected) {
        var res = await SelectCountryScreenRepo().getCountryListResponse();
        countryList.value = res
            .map<SelectCountryScreenModel>((json) => SelectCountryScreenModel.fromJson(json))
            .toList();
        opacity.value = List<num>.generate(5,(counter) => 0.3);
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
