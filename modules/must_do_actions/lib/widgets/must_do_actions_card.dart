
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:must_do_actions/model/must_do_action_ui.dart';
import 'package:must_do_actions/service/must_do_action_service.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:salescode_sdk/salescode_sdk.dart';

class MustDoActionCard extends StatefulWidget {
  int index;
  MustDoActionCard({Key? key, required this.index}) : super(key: key);

  @override
  State<MustDoActionCard> createState() => _MustDoActionCardState();
}

class _MustDoActionCardState extends State<MustDoActionCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MustDoActionService mustDoActionService = MustDoActionService();
    List<MustDoActionUI> mustDoActionsList = mustDoActionService.getAllMustDoActions();
    MustDoActionUI mustDoActionUI = mustDoActionsList[widget.index];
    switch (mustDoActionUI.id) {
        case 'salesTarget':
          mustDoActionUI.ach = 0.0;
          break;
        case 'mustOrderOutlets':
          mustDoActionUI.ach = 0.0;
          break;
        case 'mustSellSKUs':
          mustDoActionUI.ach = 0.0;
          break;
      }
      String? valuePrefix;

      String target = convertToKString(mustDoActionUI.target);
      String avgAch = convertToKString(mustDoActionUI.avgAch);
      if (target.contains("K")) {
        valuePrefix = "K";
        target = target.replaceAll("K", "");
      }
      String label = mustDoActionUI.heading;
      List<String> mainLabel = label.split(' ');
      String heading = mainLabel.sublist(0, mainLabel.length - 1).join(" ");
    return InkWell(
        onTap: () async {
          // OutletType? outletType =
          //     mustDoActionToOutletTypeMapping[mustDoActionUI.id];
          // sendMustDoActionsClickEvent(outletType);
          // context.goNamed(OutletScreen.routeName,
          //     queryParameters: {"mustDoActionId": mustDoActionUI.id});
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 3),
          height: GlobalVariables.deviceWidth > 500
              ? GlobalVariables.deviceHeight * 0.2
              : mainLabel.length > 2
                  ? 165
                  : 152,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              side: BorderSide(
                  color: HexColor(mustDoActionUI
                      .color)), //set border radius more than 50% of height and width to make circle
            ),
            child: Stack(children: [
              GlobalVariables.deviceWidth > 500
                  ? SvgPicture.asset(
                      'assets/svg/Mask_bg.svg',
                      width: GlobalVariables.deviceWidth,
                      fit: BoxFit
                          .fill, // Use "BoxFit.cover" for a different scaling option
                    )
                  : SvgPicture.asset(
                      'assets/svg/Mask_bg.svg',
                      width: GlobalVariables.deviceWidth,
                      height: mainLabel.length > 2 ? 165 : 156,
                      fit: BoxFit
                          .fill, // Use "BoxFit.cover" for a different scaling option
                    ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                decoration: BoxDecoration(
                    color: HexColor(mustDoActionUI.color),
                    border: Border.all(
                        color: HexColor(mustDoActionUI.color), width: 1.5),
                    borderRadius:
                        const BorderRadius.only(topLeft: Radius.circular(15))),
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                      text: "TASK",
                      style:
                          TextStyle(fontSize: 12, color: HexColor("#FFFFFF"))),
                  TextSpan(
                      text: " ${widget.index + 1}",
                      style: TextStyle(
                          fontSize: 12,
                          color: HexColor("#FFFFFF"),
                          fontWeight: FontWeight.bold))
                ])),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 6,
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 10.0, right: 10, top: 38),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: GlobalVariables.deviceWidth * 0.52,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "$heading ",
                                        style: TextStyle(
                                            fontSize:
                                                GlobalVariables.deviceWidth >
                                                        599
                                                    ? 24
                                                    : 17,
                                            color:
                                                HexColor(mustDoActionUI.color),
                                            fontWeight: FontWeight.w400),
                                      ),
                                      TextSpan(
                                        text: mainLabel.last,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize:
                                              GlobalVariables.deviceWidth > 599
                                                  ? 24
                                                  : 17,
                                          color: HexColor(mustDoActionUI.color),
                                        ),
                                      )
                                    ],
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            mustDoActionUI.subHeading,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize:
                                    GlobalVariables.deviceWidth > 599 ? 18 : 13,
                                color: HexColor("#5C5C5C")),
                          ),
                          // Visibility(
                          //     visible: false &&
                          //         mustDoActionUI.avgValueLabel.isNotEmpty,
                          //     child: Container(
                          //         margin: !isFeatureEnabled("incentive") ||
                          //                 mustDoActionUI.incentivePoints == null
                          //             ? const EdgeInsets.only(top: 15)
                          //             : const EdgeInsets.only(top: 3),
                          //         // width: GlobalVariables.deviceWidth * 0.47,
                          //         child: Text.rich(TextSpan(children: [
                          //           TextSpan(
                          //               text: mustDoActionUI.avgValueLabel,
                          //               style: TextStyle(
                          //                   fontWeight: FontWeight.normal,
                          //                   fontSize:
                          //                       GlobalVariables.deviceWidth >
                          //                               599
                          //                           ? 16
                          //                           : 11)),
                          //           const WidgetSpan(
                          //             child: SizedBox(width: 4),
                          //           ),
                          //           TextSpan(
                          //             text: avgAch,
                          //             style: TextStyle(
                          //                 fontWeight: FontWeight.w600,
                          //                 fontSize:
                          //                     GlobalVariables.deviceWidth > 599
                          //                         ? 16.5
                          //                         : 13),
                          //           )
                          //         ])))),
                          // Visibility(
                          //     visible: mustDoActionUI.incentivePoints != null &&
                          //         isFeatureEnabled("incentive"),
                          //     child: Container(
                          //         margin: ConfigurationDictionary
                          //                     .orderConfiguration
                          //                     .mustDoActionL7Visibility !=
                          //                 "true"
                          //             ? const EdgeInsets.only(top: 15)
                          //             : const EdgeInsets.only(top: 0),
                          //         child: Row(
                          //             // width: GlobalVariables.deviceWidth * 0.47,
                          //             children: [
                          //               Text.rich(TextSpan(children: [
                          //                 TextSpan(
                          //                     text: "Incentive Opportunity",
                          //                     style: TextStyle(
                          //                         fontWeight: FontWeight.normal,
                          //                         fontSize: GlobalVariables
                          //                                     .deviceWidth >
                          //                                 599
                          //                             ? 16
                          //                             : 11))
                          //               ])),
                          //               SizedBox(width: 8),
                          //               IncentiveStarWidget(
                          //                   incentivePoints: mustDoActionUI
                          //                           .incentivePoints ??
                          //                       0)
                          //             ]))),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.only(right: 2, top: 15),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: CircularPercentIndicator(
                              radius:
                                  GlobalVariables.deviceWidth > 599 ? 68 : 48.0,
                              lineWidth: GlobalVariables.deviceWidth > 599
                                  ? 15.0
                                  : 10.0,
                              percent: max(
                                  0.01,
                                  min(
                                      1.0,
                                      mustDoActionUI.ach /
                                          (mustDoActionUI.target == 0
                                              ? 1
                                              : mustDoActionUI.target))),
                              backgroundColor: HexColor("#e7ecf2"),
                              progressColor: HexColor(mustDoActionUI.color),
                              center: SizedBox(
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text.rich(TextSpan(children: [
                                      TextSpan(
                                          text: target,
                                          style: const TextStyle(
                                              fontSize: 23.5,
                                              fontWeight: FontWeight.w500)),
                                      valuePrefix != null
                                          ? TextSpan(
                                              text: valuePrefix,
                                              style: const TextStyle(
                                                  fontSize: 11.5,
                                                  fontWeight: FontWeight.w500))
                                          : const TextSpan()
                                    ])),
                                    Text(
                                      mustDoActionUI.unit,
                                      style: const TextStyle(
                                          fontSize: 11.5,
                                          fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: CircleAvatar(
                              radius:
                                  GlobalVariables.deviceWidth > 599 ? 20 : 8,
                              backgroundColor: HexColor("#ECF0F3"),
                              child: Icon(
                                key: const Key('mustDoActionsArrow'),
                                Icons.navigate_next,
                                color: HexColor("#202125"),
                                size:
                                    GlobalVariables.deviceWidth > 599 ? 25 : 15,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      );
  }
}
