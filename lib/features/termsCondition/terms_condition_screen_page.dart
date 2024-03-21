import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:yuktidea_demo/constants/constants.dart';
import 'package:yuktidea_demo/features/termsCondition/terms_condition_screen_controller.dart';

class TermsConditionScreen extends StatefulWidget {
  const TermsConditionScreen({super.key});

  @override
  TermsConditionScreenState createState() => TermsConditionScreenState();
}

class TermsConditionScreenState extends State<TermsConditionScreen> {
  @override
  void initState() {
    super.initState();
    initSetup();
  }

  initSetup() {
    TermsConditionScreenController.shared.getTermsAndCondition();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TermsConditionScreenController
          .shared.termsConditionScreenModel.value.title != null
      ? SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: (){
                RoutesPage.backWithResult('');
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(IconAssetsPNG.closeButton,height: 70,)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(IconAssetsPNG.files,height: 80,),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      TermsConditionScreenController
                              .shared.termsConditionScreenModel.value.title ??
                          "",
                      style: AppTextStyle.textTitleSemiBold(context, AppColorStyle.primary(context)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Update ${TermsConditionScreenController
                          .shared.createdAt ?? ""}',
                      style: AppTextStyle.textDetailsLight(context, AppColorStyle.shimmerSecondary(context)),
                    ),
                  ],
                ),
              ],
            ),
            Html(data: TermsConditionScreenController
                .shared.termsConditionScreenModel.value.content ??
                "",style: {'h1': Style(color: AppColorStyle.primary(context),fontSize: FontSize.large,fontFamily: FontsHelper.metropolisSemiBold,display: Display.inline,
                                textDecoration: TextDecoration.none,textDecorationColor: Colors.transparent)
              ,'p': Style(color: AppColorStyle.text(context),fontSize: FontSize.medium,fontFamily: FontsHelper.metropolisSemiBold,textDecoration: TextDecoration.none,textDecorationColor: Colors.transparent),
              'li': Style(color: AppColorStyle.text(context),fontSize: FontSize.medium,fontFamily: FontsHelper.metropolisSemiBold,textDecoration: TextDecoration.none,textDecorationColor: Colors.transparent),},),
          ],
        ),
      ) : Center(child: Text(StringHelper.noContentAvailable,style: AppTextStyle.textCaptionMedium(context, AppColorStyle.text(context)),)),
    );
  }
}
