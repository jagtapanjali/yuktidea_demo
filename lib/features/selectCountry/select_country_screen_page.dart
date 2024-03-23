import 'package:shimmer/shimmer.dart';
import 'package:yuktidea_demo/constants/constants.dart';
import 'package:yuktidea_demo/features/selectCountry/select_country_screen_controller.dart';
import 'package:yuktidea_demo/widget/place_holder.dart';

class SelectCountryScreen extends StatefulWidget {
  const SelectCountryScreen({super.key});

  @override
  SelectCountryScreenState createState() => SelectCountryScreenState();
}

class SelectCountryScreenState extends State<SelectCountryScreen> {

  @override
  void initState() {
    super.initState();
    initSetup();
  }

  initSetup() async {
    SelectCountryScreenController.shared.getCountryList();
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
                child: Obx(() => selectCountryWidget()),
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

  selectCountryWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 20, top: 5, bottom: 5),
          child: Text(
            StringHelper.selectCountry,
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
                StringHelper.countryInfo,
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
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
              5,
              (index) {
                return singleCountry(index);
              },
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        WidgetHelper.halfButtonWidget(
            context: context,
            callBacked: () async {},
            buttonText: StringHelper.proceed,
            isPressed: false),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }

  singleCountry(int index){
    return GestureDetector(
      onTap: (){
        SelectCountryScreenController.shared.opacity.value = List<num>.generate(5,(counter) => 0.3);
        SelectCountryScreenController.shared.opacity[index] = 1.0;
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Opacity(
          opacity: SelectCountryScreenController.shared.opacity[index],
          child: Column(
            children: [
              Container(
                height: 90,
                 width: 90,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(IconAssetsPNG.student),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text("India",style: AppTextStyle.textCaptionMedium(context, AppColorStyle.text(context)),)
            ],
          ),
        ),
      ),
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
