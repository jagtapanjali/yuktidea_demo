import 'package:yuktidea_demo/constants/constants.dart';

class SelectCountryScreenRepo{

  getCountryListResponse() async {
    try {
      var header = await APIConstant.getHeader([
        ApiHeader.authorization,
        ApiHeader.contentTypeJson,
      ]);

      Utility.showLoadingView();
      ApiResponseModel response = await apiServices.getMethod(
        APIConstant.getCountry,
        headers: header
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
