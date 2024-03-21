import 'package:yuktidea_demo/constants/constants.dart';
import 'package:yuktidea_demo/features/termsCondition/terms_condition_screen_form_ui_model.dart';
import 'package:yuktidea_demo/features/termsCondition/terms_condition_screen_repo.dart';
import 'package:intl/intl.dart';

class TermsConditionScreenController extends GetxController {
  static final TermsConditionScreenController shared =
      TermsConditionScreenController._internal();
  var termsConditionScreenModel = TermsConditionScreenModel().obs;
  DateFormat dateFormat1 = DateFormat("yyyy-MM-dd HH:mm:ss");
  DateFormat dateFormat2 = DateFormat("dd/MM/yyyy");
  String? createdAt;

  factory TermsConditionScreenController() {
    return shared;
  }

  TermsConditionScreenController._internal();

  getTermsAndCondition() async {
    try {
      termsConditionScreenModel.value = TermsConditionScreenModel();
      // if internet connected then call api otherwise navigate to dashboard(if available userdata)
      if (NetworkManager.shared.isInternetConnected) {
        termsConditionScreenModel.value = await TermsConditionScreenRepo().getTermsAndConditionResponse();
        DateTime dateTime = dateFormat1.parse(termsConditionScreenModel.value.createdAt!);
        createdAt = dateFormat2.format(dateTime);
      } else {
        Utility.showSnackBar(StringHelper.noInternetConnection);
      }
    } catch (e) {
      Utility.showSnackBar(StringHelper.somethingWentWrong);
      printLog(e);
    }
  }

}
