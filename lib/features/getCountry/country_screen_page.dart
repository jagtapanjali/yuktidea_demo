import 'package:shimmer/shimmer.dart';
import 'package:yuktidea_demo/constants/constants.dart';
import 'package:yuktidea_demo/features/getCountry/country_screen_controller.dart';
import 'package:yuktidea_demo/features/getCountry/country_screen_form_ui_model.dart';
import 'package:yuktidea_demo/widget/place_holder.dart';
import 'package:flutter/material.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  CountryScreenState createState() => CountryScreenState();
}

class CountryScreenState extends State<CountryScreen> {
  ValueNotifier<List<CountryScreenModel>> filtered =
      ValueNotifier<List<CountryScreenModel>>([]);
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocus = FocusNode();
  bool searching = false;

  @override
  void initState() {
    super.initState();
    initSetup();
  }

  initSetup() {
    CountryScreenController.shared.getCountryList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 130),
            child: Obx(() => CountryScreenController.shared.data.value == false
                ? shimmerList()
                : countryListView()),
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
    );
  }

  countryListView() {
    return ValueListenableBuilder<List>(
        valueListenable: filtered,
        builder: (context, value, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                StringHelper.selectCountry,
                style: AppTextStyle.textSubHeadlineRegular(
                    context, AppColorStyle.text(context)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Container(
                  margin: const EdgeInsets.all(8),
                  child: Card(
                    color: AppColorStyle.shimmerSecondary(context),
                    child: ListTile(
                      leading: Icon(
                        Icons.search,
                        color: AppColorStyle.primary(context),
                      ),
                      title: TextField(
                        cursorColor: AppColorStyle.primary(context),
                        style: AppTextStyle.textCaptionMedium(context, AppColorStyle.text(context)),
                        controller: searchController,
                        decoration: InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                            hintStyle: AppTextStyle.textCaptionLight(
                                context, AppColorStyle.text(context))),
                        onChanged: (text) {
                          if (text.isNotEmpty) {
                            searching = true;
                            filtered.value = [];
                            for (var country
                                in CountryScreenController.shared.countryList) {
                              if (country.name!
                                      .toLowerCase()
                                      .contains(text.toLowerCase()) ||
                                  country.telCode!.contains(text)) {
                                filtered.value.add(country);
                              }
                            }
                          } else {
                            searching = false;
                            filtered.value = [];
                          }
                        },
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.cancel),
                        onPressed: () {
                          searchController.clear();
                          searching = false;
                          filtered.value = [];
                          if (searchFocus.hasFocus) searchFocus.unfocus();
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                color: AppColorStyle.shimmerPrimary(context),
                height: 1,
              ),
              ListView.builder(
                  itemCount: searching
                      ? filtered.value.length
                      : CountryScreenController.shared.countryList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return countryItem(index);
                  }),
            ],
          );
        });
  }

  countryItem(int index) {
    final item = searching
        ? filtered.value[index]
        : CountryScreenController.shared.countryList[index];
    return GestureDetector(
      onTap: () async{
        await SharedPreferenceController.shared.setCountry(item);
        RoutesPage.of()
            .goTo(
            mode: RouteMode.push,
            moveTo: RouteName.phoneNumberScreenPage
        );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
        child: Card(
          elevation: 2,
          color: AppColorStyle.primaryBackground(context),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.network(
                  item.flag ?? "",
                  height: 30,
                  width: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Text(
                    item.name ?? "",
                    overflow: TextOverflow.clip,
                    style: AppTextStyle.textDetailsMedium(
                        context, AppColorStyle.text(context)),
                  ),
                ),
                const Spacer(),
                Text(
                  item.telCode ?? "",
                  overflow: TextOverflow.clip,
                  style: AppTextStyle.textDetailsLight(
                      context, AppColorStyle.text(context)),
                ),
              ],
            ),
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
