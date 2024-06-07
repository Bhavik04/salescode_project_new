import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:salescode_sdk/constants/global_variables.dart';
import 'package:url_launcher/url_launcher.dart';


class ContactSupport extends StatefulWidget {
  const ContactSupport({
    super.key,
    required this.supportNumber,
  });

  final String? supportNumber;

  @override
  State<ContactSupport> createState() => _ContactSupportState();
}

class _ContactSupportState extends State<ContactSupport> {

  @override
  Widget build(BuildContext context) {
    String supportTemplate = "";

    return Visibility(
      visible: widget.supportNumber != null &&
          widget.supportNumber!.isNotEmpty &&
          widget.supportNumber != "null",
      child: Center(
        child: supportTemplate == "template2"
            ? GestureDetector(
              onTap: () async {
                  var supportCallUrl = Uri.parse("tel:${widget.supportNumber}");
                  if (await canLaunchUrl(supportCallUrl)) {
                    await launchUrl(supportCallUrl);
                  } else {
                    throw 'Could not launch $supportCallUrl';
                  }
                },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.call_rounded,
                      color: GlobalVariables.primaryColor,
                    ),
                    RichText(
                        text: TextSpan(
                      style: TextStyle(
                          color: GlobalVariables.themeColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          fontFamily: GlobalVariables.fontFamily),
                      text: "support",
                      children: [
                        TextSpan(
                            text: widget.supportNumber,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                             ),
                      ],
                    )),
                  ],
                ),
            )
            : RichText(
                text: TextSpan(
                style: TextStyle(
                    color: GlobalVariables.themeColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    fontFamily: GlobalVariables.fontFamily),
                text: "for support call us at",
                children: [
                  TextSpan(
                      text: widget.supportNumber,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          var supportCallUrl =
                              Uri.parse("tel:${widget.supportNumber}");
                          if (await canLaunchUrl(supportCallUrl)) {
                            await launchUrl(supportCallUrl);
                          } else {
                            throw 'Could not launch $supportCallUrl';
                          }
                        }),
                ],
              )),
      ),
    );
  }
}
