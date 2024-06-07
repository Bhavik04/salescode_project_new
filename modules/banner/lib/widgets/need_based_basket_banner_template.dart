
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:salescode_sdk/objectbox.g.dart';
import 'package:salescode_sdk/salescode_sdk.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../models/banner_ui.dart';
import 'package:salescode_sdk/db/models/app/banner.dart' as banner;
import '../services/banner_service_app.dart';
import 'order_basket_header.dart';

class NeedBasedBasketBannerTemplate extends StatefulWidget {
  Map<dynamic, dynamic> bucketData;
  NeedBasedBasketBannerTemplate({Key? key, required this.bucketData})
      : super(key: key);

  @override
  State<NeedBasedBasketBannerTemplate> createState() =>
      _NeedBasedBasketBannerTemplateState();
}

class _NeedBasedBasketBannerTemplateState
    extends State<NeedBasedBasketBannerTemplate> {
  List<BannerUI> bannerList = [];
  late Key need1Key;

  bool _synced = true;
  bool _didDepedenciesChanged = false;

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_didDepedenciesChanged) {
      _didDepedenciesChanged = true;
      aggregateBannerData();
      need1Key = Key('need based bucket ${widget.bucketData["id"]}');
    }
  }

  // void getDataFromBannerObj(BannerUI bannerObj) {
  //   context.goNamed(BannerPage.routeName,
  //       queryParameters: {
  //         'basketLabel': widget.bucketData["title"] ?? "",
  //         "bannerType": "Need Based Bucket Banner",
  //         'basketName': "Needbasedstore",
  //         "bannerId": bannerObj.bannerId
  //       },
  //       extra: bannerObj);
  // }

  @override
  Widget build(BuildContext context) {

    return Visibility(
      visible:
          widget.bucketData['statusEnabled'] == true && bannerList.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: VisibilityDetector(
          key: need1Key,
          onVisibilityChanged: (info) {},
          child: Container(
            width: double.infinity,
            decoration: widget.bucketData.containsKey("backgroundBlobKey")
                ? BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            widget.bucketData['backgroundBlobKey']),
                        fit: BoxFit.fill))
                : BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        HexColor(widget.bucketData['backgroundColor']),
                        HexColor(widget.bucketData['backgroundColor'])
                            .withOpacity(.7),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0, 1],
                    ),
                  ),
            child: Column(
              children: [
                OrderBasketHeader(
                  title: widget.bucketData['title'],
                  desc: widget.bucketData['subtitle'],
                  basketTitleIconBlobKey:
                      widget.bucketData['bannerIconBlobKey'] ?? "",
                  displayImageBlobKey: '',
                  basketTitleSize: 40,
                  titleColor: widget.bucketData["titleColor"] ?? "#000000",
                  subTitleColor:
                      widget.bucketData["subTitleColor"] ?? "#000000",
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: SizedBox(
                      height: 210,
                      width: double.infinity,
                      child: NotificationListener<OverscrollNotification>(
                        onNotification: (notification) {
                          return true;
                        },
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: bannerList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: 15.0,
                                    right: index == bannerList.length - 1
                                        ? 15.0
                                        : 0),
                                child: GestureDetector(
                                  onTap: () async {
                                    // getDataFromBannerObj(bannerList[index]);
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                        imageUrl: bannerList[index].blobKey,
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                                  height: 210,
                                                  width: 150,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                )),
                                  ),
                                ),
                              );
                            }),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void aggregateBannerData() async {
    BannerServiceApp bannerService = BannerServiceApp();
    DatabaseServiceApp databaseService = DatabaseServiceApp();
    if (!kIsWeb) {
      Store store = databaseService.getStore()!;
      Box<banner.BannerV1> bannerBox = store.box<banner.BannerV1>();
      if (widget.bucketData['bannerIds'] != null) {
        if (widget.bucketData['bannerIds'] == []) {
          QueryBuilder<banner.BannerV1> queryBuilder = bannerBox.query(
              BannerV1_.bannerParentId.equals(widget.bucketData['bannerId']));
          Query<banner.BannerV1> query = queryBuilder.build();
          List<banner.BannerV1> temp = query.find();
          for (int i = 0; i < temp.length; i++) {
            bannerList.add(BannerUI.fromMap(temp[i].toMap()));
          }
          bannerList
              .sort((a, b) => a.lastModifiedTime.compareTo(b.lastModifiedTime));
          bannerList = bannerList.reversed.toList();
        } else {
          for (int i = 0; i < widget.bucketData['bannerIds'].length; i++) {
            QueryBuilder<banner.BannerV1> queryBuilder = bannerBox.query(
                BannerV1_.bannerParentId
                    .equals(widget.bucketData['bannerIds'][i]));
            Query<banner.BannerV1> query = queryBuilder.build();
            List<banner.BannerV1> tempBannerList = query.find();
            List<BannerUI> temp = [];
            for (int i = 0; i < tempBannerList.length; i++) {
              temp.add(BannerUI.fromMap(tempBannerList[i].toMap()));
            }
            temp.sort(
                (a, b) => a.lastModifiedTime.compareTo(b.lastModifiedTime));
            temp = temp.reversed.toList();
            bannerList = [...bannerList, ...temp];
          }
        }
      } else {
        QueryBuilder<banner.BannerV1> queryBuilder = bannerBox.query(
            BannerV1_.bannerParentId.equals(widget.bucketData['bannerId']));
        Query<banner.BannerV1> query = queryBuilder.build();
        List<banner.BannerV1> tempBannerList = query.find();
        for (int i = 0; i < tempBannerList.length; i++) {
          bannerList.add(BannerUI.fromMap(tempBannerList[i].toMap()));
        }
        bannerList
            .sort((a, b) => a.lastModifiedTime.compareTo(b.lastModifiedTime));
        bannerList = bannerList.reversed.toList();
      }
    }
    // int i = bannerList.length - 1;
    // while (i >= 0) {
    //   List<ProductUI> arr = bannerService.getDataFromBannerObj(bannerList[i]);
    //   if (arr.isEmpty) {
    //     bannerList.removeAt(i);
    //   }
    //   i--;
    // }
    setState(() {});
  }
}
