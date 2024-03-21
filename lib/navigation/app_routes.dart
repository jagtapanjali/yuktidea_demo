import 'package:yuktidea_demo/constants/constants.dart';
import 'package:yuktidea_demo/features/getCountry/country_screen_page.dart';
import 'package:yuktidea_demo/features/getPhoneNumber/phone_number_screen_page.dart';
import 'package:yuktidea_demo/features/splash/splash_screen_page.dart';
import 'package:yuktidea_demo/features/startUp/startup_screen_page.dart';
import 'package:yuktidea_demo/features/termsCondition/terms_condition_screen_page.dart';

class RoutesPage {
  static var argument;
  static String goToPage = '';
  static String backToPage = '';
  static var currentPage;

  RoutesPage.of();

  goTo({required RouteMode mode, required String moveTo, var bundle}) {
    try {
      switch (mode) {
        case RouteMode.push:
          Get.toNamed(moveTo, arguments: bundle);
          break;
        case RouteMode.replace:
          Get.offAndToNamed(moveTo, arguments: bundle);
          break;
        case RouteMode.remove:
          Get.offAllNamed(moveTo, arguments: bundle);
          break;
      }
    } catch (e) {
      Get.toNamed(moveTo, arguments: bundle);
    }
  }

  goToAnother(
      {required RouteMode mode,
      required String moveTo,
      var bundle,
      required Function func}) {
    try {
      switch (mode) {
        case RouteMode.push:
          Get.toNamed(moveTo, arguments: bundle);
          break;
        case RouteMode.replace:
          Get.offAndToNamed(moveTo, arguments: bundle);
          break;
        case RouteMode.remove:
          Get.offAllNamed(moveTo, arguments: bundle);
          break;
      }
    } catch (e) {
      Get.toNamed(moveTo, arguments: bundle);
    }
  }

  static Future<Object?>? goForResult(String routeName, var bundle) {
    try {
      final result = Get.toNamed(routeName, arguments: bundle);
      return result;
    } catch (e) {
      return null;
    }
  }

  static backWithResult(var argument) async {
    try {
      Get.back(result: argument);
    } catch (e) {
      printLog(e);
    }
  }
}

class RouteName {
  static const initial = root;

  // Base routes
  static const String root = "/";
  static const String startupScreenPage = "/startupScreenPage";
  static const String termsConditionScreenPage = "/termsConditionScreenPage";
  static const String countryScreenPage = "/countryScreenPage";
  static const String phoneNumberScreenPage = "/phoneNumberScreenPage";

}

class Routes {
  static final commonRoutes = <String, WidgetBuilder>{};

  static final routes = [
    GetPage(
        name: RouteName.root,
        page: () => const SplashScreen(),
        popGesture: false),
    GetPage(
        name: RouteName.startupScreenPage,
        page: () => const StartupScreen(),
        popGesture: false),
    GetPage(
        name: RouteName.termsConditionScreenPage,
        page: () => const TermsConditionScreen(),
        popGesture: false),
    GetPage(
        name: RouteName.countryScreenPage,
        page: () => const CountryScreen(),
        popGesture: false),
    GetPage(
        name: RouteName.phoneNumberScreenPage,
        page: () => const PhoneNumberScreen(),
        popGesture: false),
  ];
}
