import 'package:alt_sms_autofill/alt_sms_autofill.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yuktidea_demo/constants/constants.dart';
import 'package:yuktidea_demo/features/getPhoneNumber/phone_number_screen_controller.dart';
import 'package:yuktidea_demo/features/otpVerification/otp_screen_controller.dart';
import 'package:yuktidea_demo/widget/place_holder.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  OTPScreenState createState() => OTPScreenState();
}

class OTPScreenState extends State<OTPScreen> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  var verificationCode = "".obs;
  var isError = false.obs;
  Timer? timer;
  var start = 10.obs;
  String phoneNumber = "";
  int userType = 0;

  @override
  void initState() {
    super.initState();
    initSetup();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (start.value == 1) {
            timer.cancel();
            start.value = 10;
        } else {
            start.value--;
        }
      },
    );
  }

  // @override
  // void codeUpdated() {
  //   verificationCode.value = code!;
  //   _otpController.text = code!;
  //   if(mounted){
  //     setState(() {
  //
  //     });
  //   }
  // }

  initSetup() async {
    phoneNumber = await SharedPreferenceController.shared.getPhoneNumber();
    userType = await SharedPreferenceController.shared.getUserType();
    String? commingSms;
    try {
      commingSms = await AltSmsAutofill().listenForSms;
    } on PlatformException {
      commingSms = 'Failed to get Sms.';
    }
    if (!mounted) return;

    printLog("Message $commingSms");
    _otpController.text = commingSms?.substring(commingSms.length - 4) ?? "";
    verificationCode.value = _otpController.text;
  }

  @override
  void dispose() {
    AltSmsAutofill().unregisterListener();
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
              child: Obx(() => oTPWidget()),
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

  oTPWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 20, top: 5, bottom: 5),
          child: Text(
            StringHelper.vrfyNmbr,
            style: AppTextStyle.textSubHeadlineRegular(
                context, AppColorStyle.text(context)),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          child: Container(
              margin: const EdgeInsets.all(8),
              child: Text(
                StringHelper.otpInfo,
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
              child: Column(
                children: [
                  SizedBox(
                    width: 200,
                    child: PinFieldAutoFill(
                      decoration: UnderlineDecoration(
                        textStyle: TextStyle(
                            fontSize: 20, color: AppColorStyle.text(context)),
                        colorBuilder: FixedColorBuilder(
                          AppColorStyle.shimmerSecondary(context),
                        ),
                        gapSpace: 5,
                        lineHeight: 4,
                      ),
                      autoFocus: false,
                      cursor: Cursor(
                          color: AppColorStyle.primary(context),
                          enabled: true,
                          height: 20,
                          width: 1),
                      currentCode: _otpController.text,
                      controller: _otpController,
                      onCodeSubmitted: (code) {
                        verificationCode.value = code;
                      },
                      codeLength: 4,
                      onCodeChanged: (code) {
                        verificationCode.value = code ?? "";
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  isError.value ? Text(StringHelper.errorOTP,style: AppTextStyle.textCaptionLight(context, AppColorStyle.error(context)),) : const Text(""),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(StringHelper.didntRecvOTP,style: AppTextStyle.textCaptionLight(context, AppColorStyle.shimmerSecondary(context)),),
                  const SizedBox(
                    height: 15,
                  ),
                  start < 10 ? /*Text('${StringHelper.waitResendOTP} $start seconds',style: AppTextStyle.textSubTitleSemiBold(context, AppColorStyle.primary(context)),)*/
                  RichText(
                    text: TextSpan(
                      text: StringHelper.waitResendOTP,
                      style: AppTextStyle.textSubTitleSemiBold(context, AppColorStyle.shimmerSecondary(context)),
                      children: <TextSpan>[
                        TextSpan(text: ' $start seconds', style: AppTextStyle.textSubTitleSemiBold(context, AppColorStyle.primary(context))),
                      ],
                    ),
                  )
                      : GestureDetector(
                      onTap: () async {
                        String temp = phoneNumber;
                        String phone = temp.substring(phoneNumber.length - 10);
                        String telCode = phoneNumber.substring(0,phoneNumber.length - 10);
                        await PhoneNumberScreenController.shared.login(phone,telCode,userType);
                      },
                      child: Text(StringHelper.resendOTP,style: AppTextStyle.textSubTitleSemiBold(context, AppColorStyle.primary(context)),)),
                ],
              ),
            )),
        const SizedBox(
          height: 120,
        ),
        WidgetHelper.halfButtonWidget(
            context: context,
            callBacked: () async {
              startTimer();
              if(await OTPScreenController.shared.verifyOtp(verificationCode.value)){
                isError.value = false;
                RoutesPage.of()
                    .goTo(mode: RouteMode.push, moveTo: RouteName.selectCountryScreenPage);
              }else{
                isError.value = true;
              }
            },
            buttonText: StringHelper.vrfyOTP,
            isPressed: verificationCode.value.length == 4 ? true : false),
        const SizedBox(
          height: 50,
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
