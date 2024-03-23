import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yuktidea_demo/constants/constants.dart';
import 'dart:math' as math;

class StartupScreen extends StatefulWidget {
  const StartupScreen({super.key});

  @override
  StartupScreenState createState() => StartupScreenState();
}

class StartupScreenState extends State<StartupScreen> {
  @override
  void initState() {
    super.initState();
    initSetup();
  }

  initSetup() {
    // Future.delayed(const Duration(seconds: 1), () async {
    //   final isLogin = await SharedPreferenceController.shared.getIsLogin();
    //   if (isLogin) {
    //     RoutesPage.of().goTo(
    //         mode: RouteMode.remove, moveTo: RouteName.dashboardProjectPage);
    //   } else {
    //     RoutesPage.of()
    //         .goTo(mode: RouteMode.remove, moveTo: RouteName.loginPage);
    //   }
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.asset(IconAssetsPNG.startupGifPic),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 350,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: AppColorStyle.primaryBackground(context),
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(StringHelper.wlcmStudyLancer,style: AppTextStyle.textSubHeadlineBold(context, AppColorStyle.text(context)),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(StringHelper.selectRole,style: AppTextStyle.textCaptionMedium(context, AppColorStyle.text(context)),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () async{
                            await SharedPreferenceController.shared.setUserType(1);
                            RoutesPage.of()
                                .goTo(mode: RouteMode.push, moveTo: RouteName.countryScreenPage);
                          },
                          child: Column(
                            children: [
                              WidgetHelper.cardImage(context, IconAssetsPNG.student,),
                              const SizedBox(height: 10,),
                              Text(StringHelper.student,style: AppTextStyle.textSubTitleMedium(context, AppColorStyle.text(context)),)
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () async{
                            await SharedPreferenceController.shared.setUserType(2);
                            RoutesPage.of()
                                .goTo(mode: RouteMode.push, moveTo: RouteName.countryScreenPage);
                          },
                          child: Column(
                            children: [
                              Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.rotationY(math.pi),child: WidgetHelper.cardImage(context, IconAssetsPNG.agent,)),
                              const SizedBox(height: 10,),
                              Text(StringHelper.agent,style: AppTextStyle.textSubTitleMedium(context, AppColorStyle.text(context)),)
                            ],
                          ),
                        ),
                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   mainAxisSize: MainAxisSize.min,
                        //   children: [
                        //     Image.asset(IconAssetsPNG.student,fit: BoxFit.fill,height: 170,width: 200,),
                        //     Text(StringHelper.student,style: AppTextStyle.textSubTitleMedium(context, AppColorStyle.text(context)),)
                        //   ],
                        // ),
                        // Column(
                        //   children: [
                        //     Image.asset(IconAssetsPNG.agent,height: 170,width: 200),
                        //     Text(StringHelper.agent,style: AppTextStyle.textSubTitleMedium(context, AppColorStyle.text(context)),)
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(StringHelper.continueAgree,style: AppTextStyle.textCaptionLight(context, AppColorStyle.text(context))),
                        GestureDetector(
                            onTap: (){
                              RoutesPage.of()
                                  .goTo(mode: RouteMode.push, moveTo: RouteName.termsConditionScreenPage);
                            },
                            child: Text(StringHelper.termCondition,style: AppTextStyle.textCaptionSemiBold(context, AppColorStyle.primary(context)))),
                      ],
                    )
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
