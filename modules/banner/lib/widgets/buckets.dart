
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:salescode_sdk/salescode_sdk.dart';

import 'need_based_basket_banner_template.dart';

class Buckets extends StatefulWidget {
  final String bucketId;
  const Buckets({Key? key, required this.bucketId}) : super(key: key);

  @override
  State<Buckets> createState() => _BucketsState();
}

class _BucketsState extends State<Buckets> {
  List<dynamic> finalGridData = [];
  dynamic bucketConfig;
  String bucketType = "";
  bool _synced = true;

  @override
  void initState() {
    List<dynamic> currentBucketData = [];
    if (ConfigurationDictionary.bucketConfiguration.bucketConfiguration !=
        "null") {
      List<dynamic> allBuckets = jsonDecode(
          ConfigurationDictionary.bucketConfiguration.bucketConfiguration);
      currentBucketData = allBuckets
          .where((element) => element["id"] == widget.bucketId)
          .toList();
      if (currentBucketData.isNotEmpty) {
        bucketConfig = currentBucketData[0];
        if (bucketConfig.isNotEmpty) {
          bucketType = bucketConfig["bucketDesign"];
        }
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (bucketType.toLowerCase() == "need based basket banner") {
      return NeedBasedBasketBannerTemplate(bucketData: bucketConfig);
    } 
    else {
      return Visibility(visible: false, child: Container());
    }
  }
}
