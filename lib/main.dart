import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salescode_project/db/data_sync_controller.dart';
import 'package:salescode_project/go_router.dart';
import 'package:salescode_sdk/salescode_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DatabaseServiceApp databaseService = DatabaseServiceApp();
  ConfigurationServiceApp configurationService = ConfigurationServiceApp();
  await databaseService.init();
  int status = await configurationService.getClientConfig();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<SyncController>(create: (_) => SyncController())],
      child: MaterialApp.router(
        theme: ThemeData(
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
          useMaterial3: true, // can remove this line
          textSelectionTheme: const TextSelectionThemeData(
            selectionColor: Color.fromARGB(255, 120, 201, 238),
            selectionHandleColor: Colors.black,
          ),
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
