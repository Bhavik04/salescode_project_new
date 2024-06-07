import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BannerImageSkeletonLoader extends StatefulWidget {
  double height;
  BorderRadius? borderRadius = BorderRadius.circular(20.0);
  BannerImageSkeletonLoader({Key? key, required this.height, this.borderRadius})
      : super(key: key);

  @override
  State<BannerImageSkeletonLoader> createState() =>
      _BannerImageSkeletonLoaderState();
}

class _BannerImageSkeletonLoaderState extends State<BannerImageSkeletonLoader> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(vertical: widget.height / 2 - 2),
        width: double.infinity,
      ),
    );
  }
}
