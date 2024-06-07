import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:salescode_project/db/data_sync_controller.dart';
import 'package:salescode_project/home/home_screen.dart';

class LoadingScreen extends StatelessWidget {
  static const String routeName = 'loading';

  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SyncController syncController = Provider.of<SyncController>(context, listen: false);

    syncController.sync();

    syncController.addListener(() {
      if (!syncController.loading) {
        context.goNamed(HomeScreen.routeName);
      }
    });

    return const Scaffold(
      body: Center(
        child: Text(
          "Loading...",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
