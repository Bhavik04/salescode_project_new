import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:salescode_project/db/loader_registry.dart';

class SyncController extends ChangeNotifier {
  bool _isLoading = false;
  bool get loading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> sync() async {
    _setLoading(true);
    LoaderRegistry loaderRegistry = LoaderRegistry();
    // await Future.wait(loaderRegistry.returnLoaders().map((loader) => loader()));
    List<Future<void> Function()> loaders = loaderRegistry.returnLoaders();
    for (Future<void> Function() loader in loaders) {
      await loader();
    }
    _setLoading(false);
  }
}
