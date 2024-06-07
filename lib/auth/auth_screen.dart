import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:salescode_project/home/home_screen.dart';
import 'package:salescode_sdk/salescode_sdk.dart';

import 'custom_formfield.dart';
import '../loading_screen.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName = 'auth';

  const AuthScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late TextEditingController _outledIdController;
  late TextEditingController _outletPasswordController;

  AuthService authService = AuthService();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _outledIdController = TextEditingController();
    _outletPasswordController = TextEditingController();
  }

  void handleLogin() async {
    setState(() {
      isLoading = true;
    });

    String loginSuccessful = "false";

    try {
      loginSuccessful = await authService.signInUser(
        email: _outledIdController.text,
        password: _outletPasswordController.text,
      );
    } finally {
      setState(() {
        isLoading = false;
      });
      if (loginSuccessful == "true") {
        if (mounted) {
          context.goNamed(LoadingScreen.routeName);
          // context.goNamed(HomeScreen.routeName);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * .04),
            child: CustomFormField2(
                labelText: "Outlet ID",
                obsecureText: false,
                controller: _outledIdController,
                maxLines: 1,
                textInputAction: TextInputAction.done),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * .04,
                vertical: screenSize.height * .01),
            child: CustomFormField2(
              completeFunction: () async => isLoading ? () {} : handleLogin(),
              labelText: "Password",
              obsecureText: true,
              controller: _outletPasswordController,
              maxLines: 2,
              textInputAction: TextInputAction.done,
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(
                  horizontal: screenSize.width * .04,
                  vertical: screenSize.height * .01),
              width: double.maxFinite,
              child: ElevatedButton(
                key: const Key('lbutton'),
                onPressed: () async => isLoading ? () {} : handleLogin(),
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  minimumSize: const Size(100, 50),
                  backgroundColor: GlobalVariables.themeColor,
                  padding: const EdgeInsets.symmetric(
                    vertical: 2,
                  ),
                ),
                child: isLoading
                    ? const SpinKitFadingCircle(
                        color: Colors.white,
                        size: 25,
                      )
                    : const Text(
                        "LOGIN",
                        style: TextStyle(color: Colors.white),
                      ),
              )),
        ],
      ),
    );
  }
}
