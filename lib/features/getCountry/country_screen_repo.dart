import 'package:yuktidea_demo/constants/constants.dart';
import 'package:yuktidea_demo/features/termsCondition/terms_condition_screen_form_ui_model.dart';

class CountryScreenRepo{

  getCountryListResponse() async {
    try {
      var header = await APIConstant.getHeader([
        ApiHeader.authorization,
      ]);

      Utility.showLoadingView();
      ApiResponseModel response = await apiServices.getMethod(
        APIConstant.getCountries,
        headers: header,
      );
      Utility.hideLoadingView();

      if (response.statusCode ?? false) {
        return (response.data);
      }else {
        Utility.showSnackBar(
            response.message ?? StringHelper.somethingWentWrong);
      }
    } catch (e) {
      printLog(e);
    }
  }

}
