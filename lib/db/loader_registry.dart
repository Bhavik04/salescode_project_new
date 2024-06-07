import 'package:banner/loader/banner_loader.dart';
import 'package:salescode_sdk/db/loaders/configuration_loader.dart';
import 'package:salescode_sdk/salescode_sdk.dart';

import 'loaders/faq_loader.dart';

class LoaderRegistry {
  BannerLoaderService bannerLoader = BannerLoaderService();
  ConfigurationLoader configurationLoader = ConfigurationLoader();
  FaqService faqLoader = FaqService();

  late Iterable<Loader> loaderRegistry;

  LoaderRegistry() {
    loaderRegistry = List.unmodifiable([
      configurationLoader,
      bannerLoader,
      faqLoader
    ]);
  }

  List<Future<void> Function()> returnLoaders() {
    List<Future<void> Function()> loaders = [];
    for (Loader loader in loaderRegistry) {
      loaders.add(loader.load);
    }
    return loaders;
  }
}
