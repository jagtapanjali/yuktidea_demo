import 'package:yuktidea_demo/constants/constants.dart';

class OTPScreenRepo{

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
