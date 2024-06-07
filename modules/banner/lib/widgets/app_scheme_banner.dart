import 'package:banner/services/banner_service_app.dart';
import 'package:banner/widgets/banner_skeleton.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:salescode_sdk/salescode_sdk.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../models/banner_ui.dart';

class AppSchemeBanner extends StatefulWidget {
  final List<BannerUI> bannerList;
  final String bannerId;
  const AppSchemeBanner(
      {Key? key, required this.bannerList, required this.bannerId})
      : super(key: key);

  @override
  State<AppSchemeBanner> createState() => _AppSchemeBannerState();
}

class _AppSchemeBannerState extends State<AppSchemeBanner> {
  List<BannerUI> bannerList = [];
  int _currentIndex = 0;
  // late BannerProvider bannerProvider;
  late Key bannerMoengageKey;
  bool loading = true;
  BannerServiceApp bannerService = BannerServiceApp();
  bool _synced = true;
  bool isBannerVisible = false;
  ConfigurationServiceApp configurationServiceApp = ConfigurationServiceApp();

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      aggregateBannerData();
      bannerMoengageKey = const Key("app scheme banner");
    });
  }

  @override
  Widget build(BuildContext context) {
    // AutoSyncService autoSyncService = Provider.of<AutoSyncService>(context);
    // bannerProvider = Provider.of<BannerProvider>(context);
    // String syncState = autoSyncService.syncState;

    // if (syncState == "syncing") {
    //   bannerProvider.setBoolForAllBanners(false);
    //   setState(() {
    //     _synced = false;
    //   });
    // }

    // if (syncState == "synced" && _synced == false) {
    //   aggregateBannerData(); // yeh init state jesa function dubara call karega
    //   setState(() {
    //     _synced = true;
    //   });
    // }

    // void getDataFromBannerObj(BannerUI bannerObj) {
    //   context.goNamed(BannerPage.routeName,
    //       queryParameters: {
    //         "basketLabel":
    //             "Scheme Products",
    //         "bannerId": bannerObj.bannerId,
    //         "basketName": "AppSchemeBanner",
    //         "bannerType": "App Scheme Banner"
    //       },
    //       extra: bannerObj);
    // }

    if (!loading) {
      return Visibility(
        visible: bannerList.isNotEmpty,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: VisibilityDetector(
            key: bannerMoengageKey,
            onVisibilityChanged: (info) {
              if (info.visibleFraction == 1) {
                // sendBannerViewEvent(bannerList[_currentIndex],
                //     "app scheme banner", (_currentIndex + 1).toString());
                isBannerVisible = true;
                setState(() {});
              } else if (info.visibleFraction == 0) {
                isBannerVisible = false;
                setState(() {});
              }
            },
            child: CarouselSlider(
              items: bannerList.map(
                (bannerObj) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: GestureDetector(
                      onTap: () async {
                        // getDataFromBannerObj(bannerObj);
                        // sendBannerClickEvent(bannerObj, "app scheme banner",
                        //     (_currentIndex + 1).toString());
                        // sendSelectPromotionEvent(
                        //     promotionId: bannerObj.bannerId,
                        //     promotionName: bannerObj.bannerName,
                        //     creativeName: bannerObj.fileName,
                        //     creativeSlot: (_currentIndex + 1).toString(),
                        //     pageType: "HomePage");
                      },
                      child: Builder(
                        builder: (BuildContext context) => ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CachedNetworkImage(
                              placeholder: (context, url) =>
                                  BannerImageSkeletonLoader(
                                      height: GlobalVariables.deviceWidth > 599
                                          ? GlobalVariables.deviceHeight * .25
                                          : 200),
                              imageUrl: bannerObj.blobKey,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  )),
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
              options: CarouselOptions(
                viewportFraction: 0.64,
                autoPlayInterval: const Duration(seconds: 5),
                padEnds: bannerList.length == 1 ? true : false,
                height: GlobalVariables.deviceWidth > 599
                    ? GlobalVariables.deviceHeight * .25
                    : 200,
                autoPlay: bannerList.length == 1 ? false : true,
                enableInfiniteScroll: bannerList.length == 1 ? false : true,
                onPageChanged: (index, reason) {
                  // if (isBannerVisible) {
                  //   sendViewPromotionEvent(
                  //       promotionId: bannerList[_currentIndex].bannerId,
                  //       promotionName: bannerList[_currentIndex].bannerName,
                  //       creativeName: bannerList[_currentIndex].fileName,
                  //       creativeSlot: (_currentIndex + 1).toString(),
                  //       pageType: "HomePage");
                  // }
                  // if (reason == CarouselPageChangedReason.manual) {
                  //   sendBannerSwipeEvent(bannerList[_currentIndex],
                  //       "app scheme banner", (index + 1).toString());
                  // }
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
        child: SizedBox(
          child: Row(
            children: [
              Container(
                  width: (GlobalVariables.deviceWidth * .64) - 15,
                  margin: const EdgeInsets.only(left: 15),
                  child: BannerImageSkeletonLoader(
                      height: GlobalVariables.deviceWidth > 599
                          ? GlobalVariables.deviceHeight * .25
                          : 200)),
              Container(
                  width: (GlobalVariables.deviceWidth * (1 - .64)) - 15,
                  margin: const EdgeInsets.only(left: 15),
                  child: BannerImageSkeletonLoader(
                    height: GlobalVariables.deviceWidth > 599
                        ? GlobalVariables.deviceHeight * .25
                        : 200,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0)),
                  )),
            ],
          ),
        ),
      );
    }
  }

  void aggregateBannerData() async {
    if (widget.bannerId == "use template") {
      bannerList = await bannerService.getBannerData("template28", false);
      if (bannerList.isEmpty) {
        bannerList = await bannerService.getBannerData("template9", false);
      }
    }
    // else {
    //   bool bannerIdAlreadyExists = bannerProvider.bannerData
    //       .any((element) => element.bannerId == widget.bannerId);
    //   if (!bannerIdAlreadyExists) {
    //     bannerList = await bannerService.multiPurposeBannerFilter(
    //         widget.bannerList, "App Scheme Banner");
    //     BannerData bannerData = BannerData(
    //         bannerList: bannerList, areBannersSet: true, isEventHit: false);
    //     BannerValues bannerValues =
    //         BannerValues(bannerId: widget.bannerId, bannerData: bannerData);
    //     bannerProvider.addValueToBannerData(bannerValues);
    //   } else {
    //     for (int i = 0; i < bannerProvider.bannerData.length; i++) {
    //       if (bannerProvider.bannerData[i].bannerId == widget.bannerId) {
    //         if (!bannerProvider.bannerData[i].bannerData.areBannersSet) {
    //           bannerList = await bannerService.multiPurposeBannerFilter(
    //               widget.bannerList, "App Scheme Banner");
    //           bannerProvider.setBoolForSingleBanner(widget.bannerId, true);
    //           bannerProvider.setBannerListForSingleBannerId(
    //               widget.bannerId, bannerList);
    //         } else {
    //           bannerList = bannerProvider.bannerData[i].bannerData.bannerList;
    //         }
    //       }
    //     }
    //   }
    // }
    loading = false;
    setState(() {});
  }
}
