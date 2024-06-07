import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:salescode_sdk/salescode_sdk.dart';

class OrderBasketHeader extends StatefulWidget {
  String title;
  String desc;
  String? displayImageBlobKey = "";
  double basketTitleSize;
  String basketTitleIconBlobKey = "";
  String titleColor;
  String subTitleColor;
  OrderBasketHeader(
      {super.key,
      required this.title,
      required this.desc,
      this.displayImageBlobKey,
      required this.basketTitleSize,
      required this.basketTitleIconBlobKey,
      required this.titleColor,
      required this.subTitleColor});

  @override
  State<OrderBasketHeader> createState() => _OrderBasketHeaderState();
}

class _OrderBasketHeaderState extends State<OrderBasketHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right: 10, top: 15.0),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: widget.basketTitleIconBlobKey != "",
            child: Expanded(
              flex: 2,
              child: CachedNetworkImage(
                  imageUrl: widget.basketTitleIconBlobKey,
                  width: widget.basketTitleSize,
                  height: widget.basketTitleSize,
                  imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            onError: (exception, stackTrace) {
                              // unawaited(SlackAlertService()
                              //     .alert(exception.toString()));
                            },
                            image: imageProvider,
                            fit: BoxFit.contain,
                          ),
                        ),
                      )),
            ),
          ),
          Expanded(
            flex: (widget.displayImageBlobKey != null &&
                    widget.displayImageBlobKey != "")
                ? 6
                : 8,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3.0),
                    child: Text(
                      key: const Key('HotSellingTitle'),
                      widget.title,
                      style: TextStyle(
                          fontSize: 15.0,
                          decoration: TextDecoration.none,
                          color: HexColor(widget.titleColor != ""
                              ? widget.titleColor
                              : "#000000"),
                          fontWeight: FontWeight.w600,
                          fontFamily: GlobalVariables.fontFamily),
                      textAlign: TextAlign.left,
                      maxLines: 2,
                    ),
                  ),
                  Visibility(
                    visible: widget.desc != "",
                    child: Text(
                      widget.desc,
                      style: TextStyle(
                          fontSize: 13.0,
                          decoration: TextDecoration.none,
                          color: HexColor(widget.subTitleColor != ""
                              ? widget.subTitleColor
                              : "#000000"),
                          fontFamily: GlobalVariables.fontFamily,
                          fontWeight: FontWeight.w300),
                      maxLines: 2,
                    ),
                  )
                ],
              ),
            ),
          ),
          Visibility(
            visible: widget.displayImageBlobKey != null &&
                widget.displayImageBlobKey != "",
            child: Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: widget.displayImageBlobKey != null
                    ? widget.displayImageBlobKey!
                    : "",
                width: 70,
              ),
            ),
          )
        ],
      ),
    );
  }
}
