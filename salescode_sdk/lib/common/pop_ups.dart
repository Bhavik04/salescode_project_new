

import 'package:flutter/material.dart';
import 'package:salescode_sdk/constants/global_variables.dart';

BuildContext? dialogContext;

Future showAlertDialog(BuildContext context, String content,
    String buttonString, bool redirectHome,
    [bool dismiss = false]) {
  Widget continueButton = Center(
      child: ElevatedButton(
          key: const Key('oidContinuebtn'),
          onPressed: () {
            // redirectHome
                // ignore: unnecessary_statements
                // ? {
                //     Navigator.of(context, rootNavigator: true).pop(true),
                //     context.goNamed(BottomBar.routeName,
                //         queryParameters: {'feature': 'home'})
                //   }
                // : dismissDialog();
                Navigator.of(dialogContext!).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: GlobalVariables.themeColor,
            shadowColor: Colors.grey,
            elevation: 3,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55.0),
            child: Text(
              key: const Key('TestContinueBtn'),
              buttonString,
              style: const TextStyle(color: Colors.white),
            ),
          )));

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.white,
    icon: Icon(
      Icons.info,
      size: 65,
      color: GlobalVariables.themeColor,
    ),
    iconPadding: const EdgeInsets.only(top: 7),
    content: Text(
      content,
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),
    ),
    contentPadding: const EdgeInsets.fromLTRB(20, 25, 20, 40),
    insetPadding:
        EdgeInsets.symmetric(horizontal: 0.07 * GlobalVariables.deviceWidth),
    actions: [
      continueButton,
    ],
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
  );

  // show the dialog
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      dialogContext = context;
      return Theme(
          data: ThemeData(
            fontFamily: GlobalVariables.fontFamily,
            scaffoldBackgroundColor: GlobalVariables.backgroundColor,
            colorScheme: const ColorScheme.light(primary: Colors.white),
            appBarTheme: const AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
            ),
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              },
            ),
            useMaterial3: true, // can remove this line
            textSelectionTheme: const TextSelectionThemeData(
              selectionColor: Color.fromARGB(255, 120, 201, 238),
              selectionHandleColor: Colors.black,
            ),
          ),
          child: alert);
    },
  );
}