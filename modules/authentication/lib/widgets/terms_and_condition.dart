// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:salescode_sdk/constants/global_variables.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({
    super.key,
    required this.privacyPolicy,
    required this.tncLink,
  });

  final String? privacyPolicy;
  final String? tncLink;
  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      key: const Key('tncWidget'),
      text: TextSpan(
        style:  TextStyle(
            color: Color.fromRGBO(96, 96, 96, 1),
            fontWeight: FontWeight.w500,
            fontFamily: GlobalVariables.fontFamily,
            fontSize: 10),
        text: 'I have read and understood the ',
        children: [
          TextSpan(
              text: 'T&C\'s',
              style: TextStyle(
                color: GlobalVariables.themeColor,
                fontWeight: FontWeight.w700,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  if (widget.tncLink!.isNotEmpty) {
                    var tncLinkUrl = Uri.parse(widget.tncLink!);
                    if (kIsWeb) {
                      if (await canLaunchUrl(tncLinkUrl)) {
                        await launchUrl(tncLinkUrl,
                            mode: LaunchMode.externalApplication);
                      }
                    } else {
                      // await Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => PdfViewerPage(
                      //       pdfUrl: widget.tncLink!,
                      //       headerName: 'Terms and Conditions',
                      //     ),
                      //   ),
                      // );
                    }
                  } else {
                    const CircularProgressIndicator();
                  }
                }),
          TextSpan(
            text: ' and ',
          ),
          TextSpan(
              text: 'Privacy Policy ',
              style: TextStyle(
                color: GlobalVariables.themeColor,
                fontWeight: FontWeight.w700,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  if (widget.privacyPolicy!.isNotEmpty) {
                    Uri privacyPolicyUrl = Uri.parse(widget.privacyPolicy!);
                    if (kIsWeb) {
                      if (await canLaunchUrl(privacyPolicyUrl)) {
                        await launchUrl(privacyPolicyUrl,
                            mode: LaunchMode.externalApplication);
                      }
                    } else {
                      if (widget.privacyPolicy!.contains("pdf")) {
                        if (!kIsWeb) {
                          // await Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //       builder: (context) => PdfViewerPage(
                          //           pdfUrl: widget.privacyPolicy!,
                          //           headerName: 'Privacy Policy')),
                          // );
                        } else {
                          var linkUrl = Uri.parse(
                            widget.privacyPolicy!,
                          );
                          await launchUrl(linkUrl);
                        }
                      } else {
                        await FlutterWebBrowser.openWebPage(
                          url: widget.privacyPolicy!,
                        );
                      }
                    }
                  } else {
                    const CircularProgressIndicator();
                  }
                }),
          const TextSpan(
              text:
                  " "), // do not remove, it stops gesture detection tap from nearby blank space
        ],
      ),
    );
  }
}
