import 'package:yuktidea_demo/constants/constants.dart';
import 'package:yuktidea_demo/features/termsCondition/terms_condition_screen_form_ui_model.dart';

class TermsConditionScreenRepo{

  getTermsAndConditionResponse() async {
    try {
      var header = await APIConstant.getHeader([
        ApiHeader.authorization,
      ]);

      Utility.showLoadingView();
      ApiResponseModel response = await apiServices.getMethod(
        APIConstant.termsCondition,
        headers: header,
      );
      Utility.hideLoadingView();

      if (response.statusCode ?? false) {
        return TermsConditionScreenModel.fromJson(response.data);
      } else {
        Utility.showSnackBar(response.message ?? "");
      }
    } catch (e) {
      printLog(e);
    }
  }

}
