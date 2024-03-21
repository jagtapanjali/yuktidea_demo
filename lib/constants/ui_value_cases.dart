
import 'package:yuktidea_demo/constants/constants.dart';

class UiValueCases {
  static BoxFit imageBoxFitValue(int boxFit) {
    switch (boxFit) {
      case 0:
        return BoxFit.fill;
      case 1:
        return BoxFit.cover;
      case 2:
        return BoxFit.contain;
      case 3:
        return BoxFit.fitHeight;
      case 4:
        return BoxFit.fitWidth;
      case 5:
        return BoxFit.scaleDown;
      case 6:
        return BoxFit.none;
      default:
        return BoxFit.fill;
    }
  }

  static FontWeight fontWeightValue(int value) {
    switch (value) {
      case 100:
        return FontWeight.w100;
      case 200:
        return FontWeight.w200;
      case 300:
        return FontWeight.w300;
      case 400:
        return FontWeight.w400;
      case 500:
        return FontWeight.w500;
      case 600:
        return FontWeight.w600;
      case 700:
        return FontWeight.w700;
      case 800:
        return FontWeight.w800;
      case 900:
        return FontWeight.w900;
      default:
        return FontWeight.normal;
    }
  }

  static TextInputType keyboardTypeValue(String value) {
    switch (value) {
      case "name":
        return TextInputType.name;
      case "text":
        return TextInputType.text;
      case "multiline":
        return TextInputType.multiline;
      case "number":
        return TextInputType.number;
      case "phone":
        return TextInputType.phone;
      case "datetime":
        return TextInputType.datetime;
      case "emailAddress":
        return TextInputType.emailAddress;
      case "url":
        return TextInputType.url;
      case "visiblePassword":
        return TextInputType.visiblePassword;
      case "streetAddress":
        return TextInputType.streetAddress;
      case "none":
        return TextInputType.none;
      default:
        return TextInputType.text;
    }
  }
}
