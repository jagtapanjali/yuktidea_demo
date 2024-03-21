import 'package:flutter_svg/svg.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yuktidea_demo/app_style/app_text_style.dart';
import 'package:yuktidea_demo/app_style/theme/app_color_style.dart';
import 'package:yuktidea_demo/constants/constants.dart';
import 'package:yuktidea_demo/data_provider/shared_preference/shared_preference_controller.dart';
import 'package:yuktidea_demo/features/getCountry/country_screen_form_ui_model.dart';
import 'package:yuktidea_demo/navigation/app_routes.dart';
import 'package:yuktidea_demo/resources/icons.dart';
import 'package:yuktidea_demo/resources/strings.dart';
import 'package:yuktidea_demo/widget/place_holder.dart';
import 'package:flutter/material.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  PhoneNumberScreenState createState() => PhoneNumberScreenState();
}

class PhoneNumberScreenState extends State<PhoneNumberScreen> {
  var countryModel = CountryScreenModel().obs;
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final FocusNode focusNode = FocusNode();


  @override
  void initState() {
    super.initState();
    initSetup();
  }

  initSetup() async {
    countryModel.value = CountryScreenModel.fromJson(await SharedPreferenceController.shared.getCountry());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorStyle.primaryBackground(context),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(top: 130),
              child: Obx(() => phoneNumberWidget()),
            ),
          ),
          Container(
            height: 130,
            color: AppColorStyle.primaryBackground(context),
            child: GestureDetector(
              onTap: () {
                RoutesPage.backWithResult('');
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 50, left: 10),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      IconAssetsPNG.backButton,
                      height: 70,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  phoneNumberWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 20, top: 5, bottom: 5),
          child: Text(
            StringHelper.enterPhoneNumber,
            style: AppTextStyle.textSubHeadlineRegular(
                context, AppColorStyle.text(context)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          child: Container(
              margin: const EdgeInsets.all(8),
              child: Text(
                StringHelper.mobileInfo,
                textAlign: TextAlign.center,
                style: AppTextStyle.textDetailsRegular(
                    context, AppColorStyle.primary(context)),
              )),
        ),
        Divider(
          color: AppColorStyle.shimmerPrimary(context),
          height: 1,
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
          child: Form(
            key: _formKey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.network(
                  countryModel.value.flag ?? "",
                  height: 20,
                  width: 20,
                ),
                const SizedBox(width: 10,),
                Text(countryModel.value.telCode ?? '',style: AppTextStyle.textDetailsLight(
                    context, AppColorStyle.text(context))),
                const SizedBox(width: 10,),
                SizedBox(
                  width: 180,
                  child: TextFormField(
                    cursorColor: AppColorStyle.primary(context),
                    style: AppTextStyle.textDetailsRegular(context, AppColorStyle.text(context)),
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: "XXXXXXXXXX",
                      hintStyle: AppTextStyle.textDetailsRegular(context, AppColorStyle.shimmerSecondary(context))
                    ),
                  ),
                ),
                // Container(
                //     height: 100,
                //     width: 250,
                //     color: Colors.grey.shade200,
                //     padding: const EdgeInsets.symmetric(
                //         vertical: 2,
                //         horizontal: 8),
                //     child: TextFormField(
                //       controller: _phoneController,
                //       validator: (value) {
                //         return Validators().validateMobile(value);
                //       },
                //       style: const TextStyle(
                //           fontSize: 19),
                //       keyboardType:
                //       TextInputType.phone,
                //       onChanged: (value) {
                //         if (value.isEmpty) {
                //           FocusScope.of(context)
                //               .previousFocus();
                //         } else if (value.length ==
                //             10) {
                //           FocusScope.of(context)
                //               .unfocus();
                //         }
                //       },
                //       inputFormatters: [
                //         LengthLimitingTextInputFormatter(
                //             10),
                //         FilteringTextInputFormatter
                //             .digitsOnly
                //       ],
                //       decoration: InputDecoration(
                //           border: InputBorder.none,
                //           hintText: "XXXXXXXXXX",
                //           hintStyle: TextStyle(
                //               color: Colors
                //                   .grey.shade400)),
                //     )),
              ],
            ),
          )
        ),
      ],
    );
  }

  shimmerList() {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                //BannerPlaceholder(),
                //TitlePlaceholder(width: 200.0),
                SizedBox(height: 16.0),
                ContentPlaceholder(
                  lineType: ContentLineType.twoLines,
                ),
                SizedBox(height: 16.0),
                //TitlePlaceholder(width: 200.0),
                SizedBox(height: 16.0),
                ContentPlaceholder(
                  lineType: ContentLineType.twoLines,
                ),
                SizedBox(height: 16.0),
                //TitlePlaceholder(width: 200.0),
                SizedBox(height: 16.0),
                ContentPlaceholder(
                  lineType: ContentLineType.twoLines,
                ),
                SizedBox(height: 16.0),
                SizedBox(height: 16.0),
                ContentPlaceholder(
                  lineType: ContentLineType.twoLines,
                ),
                SizedBox(height: 16.0),
                SizedBox(height: 16.0),
                ContentPlaceholder(
                  lineType: ContentLineType.twoLines,
                ),
                SizedBox(height: 16.0),
                SizedBox(height: 16.0),
                ContentPlaceholder(
                  lineType: ContentLineType.twoLines,
                ),
              ],
            ),
          ),
        ));
  }
}
