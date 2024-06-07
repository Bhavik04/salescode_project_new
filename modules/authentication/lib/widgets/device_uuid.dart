// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:salescode_sdk/salescode_sdk.dart';

class DeviceUUID extends StatefulWidget {
  const DeviceUUID({super.key});

  @override
  State<DeviceUUID> createState() => _DeviceUUIDState();
}

class _DeviceUUIDState extends State<DeviceUUID> {
  String uid = "";
  getUid() async {
    uid = "Dummy UID";
    if (uid.isNotEmpty) {
      await showAlertDialog(
          context, "Your Device UID is - $uid", "Continue", false);
    } else {
      await showAlertDialog(context, "No Uid Found", "continue", false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: getUid,
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                    color: GlobalVariables.themeColor,
                    fontWeight: FontWeight.w500,
                    fontFamily: GlobalVariables.fontFamily,
                    fontSize: 12),
                text: 'Please click here to get your device ',
                children: [
                  TextSpan(
                    text: 'UUID',
                    style: TextStyle(
                      color: GlobalVariables.themeColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const TextSpan(
                      text:
                          " "), // do not remove, it stops gesture detection tap from nearby blank space
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
