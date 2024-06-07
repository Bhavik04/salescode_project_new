import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salescode_sdk/salescode_sdk.dart';

import '../constants/kpiConstants.dart';
import '../services/kpi_review_service.dart';
import '../utils/kpi_utils.dart';

class KpiTiles extends StatefulWidget {
  const KpiTiles({Key? key}) : super(key: key);

  @override
  State<KpiTiles> createState() => _KpiTilesState();
}

class _KpiTilesState extends State<KpiTiles> {
  List<dynamic> kpiList = [];
  // late KpiProvider kpiProvider;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // kpiProvider = Provider.of<KpiProvider>(context, listen: false);
      prepareKpis();
    });

    super.initState();
  }

  void prepareKpis() {
    String kpiConfigStr =
        ConfigurationDictionary.kpiConfiguration.kpiConfigList;
    if (kpiConfigStr != "null") {
      setState(() {
        kpiList = jsonDecode(kpiConfigStr);
      });
      //   dynamic dataFieldsToShow = KpiUtils.getDataFieldsToShow(kpiList);
      //   kpiProvider.setDataFieldToShowConfig(value:dataFieldsToShow);
    }
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: kpiList.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Container(
              color: HexColor("#ffffff"),
              height: GlobalVariables.deviceWidth > 599 ? 250 : 185,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: kpiList.length,
                  itemBuilder: (context, index) {
                    return kpiCardComponent(
                        kpiValue: kpiList[index], index: index);
                  }),
            ),
          ),
        ),
      ],
    );
  }

  Widget kpiCardComponent({required kpiValue, required int index}) {
    KpiReviewService kpiReviewService = KpiReviewService();
    bool showKpiValuesOnCard = kpiValue.containsKey("data_points") &&
        kpiValue["data_points"].length > 0;

    Map<String, String> dataPoints = kpiReviewService.getHomeScreenDataByKpiId(
        id: kpiValue["id"] ?? "", kpiName: kpiValue["kpiName"] ?? "");
    String percentageValue = KpiUtils.roundOffString(
        kpiReviewService.getPercentageForHomeByKpiId(
            id: kpiValue["id"] ?? "", kpiName: kpiValue["kpiName"] ?? ""));
    String date = kpiReviewService.getDateForHome();

    Map<String, String> validationData = kpiReviewService
        .getColourForHomeScreenEmoji(kpiValue["id"] ?? "", "homescreen", "");

    return InkWell(
        onTap: () {
          // sendKpiClickEvent(kpiValue['id']);
          bool isDetailSummaryEmpty =
              kpiReviewService.isDetailSummaryEmpty(kpiValue);

          if (isDetailSummaryEmpty) {
            return;
          }

          // provider.setSelectedKpiLabelId(
          //     label: kpiValue["title"], id: kpiValue['id']);
          // provider.selectedKpiToggleIndex = 0;
          // provider.activeTablePage = 1;
          // provider.tableSortType = KpiTableSortType.none;
          // provider.tableSearchController.text = "";
          // context.goNamed(KpiScreen.routeName);
        },
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 209,
            decoration: BoxDecoration(
              color: HexColor("#ffffff"),
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey, //New
                  blurRadius: 2.0,
                )
              ],
            ),
            child: SizedBox(
              width: GlobalVariables.deviceWidth > 590 ? 350 : 290,
              height: 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    decoration: BoxDecoration(
                      color: HexColor("#e7ecf2"),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                    ),
                    width: GlobalVariables.deviceWidth > 590
                        ? 350
                        : GlobalVariables.deviceWidth * 0.85,
                    child: Row(
                      key: const Key('TestSalesVolume'),
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  kpiValue["title"] ?? "NA",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: GlobalVariables.deviceWidth > 599
                                          ? 16
                                          : 13,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(date,
                                    style: TextStyle(
                                        fontSize:
                                            GlobalVariables.deviceWidth > 599
                                                ? 13
                                                : 10,
                                        fontWeight: FontWeight.normal))
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: showKpiValuesOnCard,
                          //allValuesNotNull(kpiValues),
                          child: Icon(
                            validationData["type"] == KPIConstants.SUCCESS
                                ? Icons.tag_faces_rounded
                                : Icons.sentiment_neutral_sharp,
                            color:
                                HexColor(validationData["color"] ?? "#000000"),
                            size: GlobalVariables.deviceWidth > 599 ? 30 : null,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: showKpiValuesOnCard
                        ? Text.rich(TextSpan(children: [
                            TextSpan(
                                text: percentageValue,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: HexColor(validationData["color"]!),
                                    fontSize: GlobalVariables.deviceWidth > 599
                                        ? 55
                                        : 30)),
                            TextSpan(
                                text: "%",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: HexColor(validationData["color"]!),
                                    fontSize: GlobalVariables.deviceWidth > 599
                                        ? 32
                                        : 22))
                          ]))
                        : SvgPicture.asset(
                            "assets/svg/card_filler.svg",
                            height:
                                GlobalVariables.deviceWidth > 599 ? 130 : 90,
                            width: GlobalVariables.deviceWidth > 599 ? 130 : 90,
                          ),
                  ),
                  Visibility(
                    visible: showKpiValuesOnCard,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Divider(
                          height: 1, thickness: 1, color: HexColor("#d5d5d5")),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: dataPoints.entries.map((entry) {
                        // final key = entry.key;
                        // var value = entry.value;
                        if (entry.key == "null" && entry.value == "null") {
                          return const SizedBox(
                            width: 0,
                            height: 0,
                          );
                        }
                        return Expanded(
                          flex: 1,
                          child: Container(
                            height:
                                GlobalVariables.deviceWidth > 599 ? 60 : null,
                            child: Column(
                              mainAxisAlignment:
                                  GlobalVariables.deviceWidth > 599
                                      ? MainAxisAlignment.center
                                      : MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  entry.value,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize:
                                          GlobalVariables.deviceWidth > 599
                                              ? 16
                                              : 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  entry.key,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize:
                                          GlobalVariables.deviceWidth > 599
                                              ? 11
                                              : 9,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
  }
}
