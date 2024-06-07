import 'package:banner/models/banner_ui.dart';
import 'package:salescode_sdk/salescode_sdk.dart';

abstract class BannerService {

  // late CatalogueServices catalogueServices;
  // late NotificationsService notificationsService;
  // late DatabaseService databaseService;
  // late OffersService offersService;
  // late BannerRepository bannerRepository;
  // late ConfigurationService configurationService;

  // BannerService(
  //     this.catalogueServices,
  //     this.notificationsService,
  //     this.databaseService,
  //     this.offersService,
  //     this.bannerRepository,
  //     this.configurationService);

  // -----------------------Product Catalogue--------------------------

  // this converts the modified naming covention to original one
  // String convertNewKeysToOld(String? key) {
  //   switch (key) {
  //     case "cat_mediaNameone":
  //     case "cat_mediaNametwo":
  //     case "cat_mediaNamethree":
  //     case "cat_mediaNamefour":
  //     case "cat_mediaNamefive":
  //       return "category";
  //     case "skuCode_mediaNameone":
  //     case "skuCode_mediaNametwo":
  //     case "skuCode_mediaNamethree":
  //     case "skuCode_mediaNamefour":
  //     case "skuCode_mediaNamefive":
  //       if (catalogueList.isNotEmpty) {
  //         if (catalogueList[0].marketSkuCode != "") {
  //           return "marketSkuCode";
  //         } else {
  //           return "skuCode";
  //         }
  //       } else {
  //         return "";
  //       }
  //     case "subCat_mediaNameone":
  //     case "subCat_mediaNametwo":
  //     case "subCat_mediaNamethree":
  //     case "subCat_mediaNamefour":
  //     case "subCat_mediaNamefive":
  //       return "subCategoryCode";
  //     case "pieceSize_mediaNameone":
  //     case "pieceSize_mediaNametwo":
  //     case "pieceSize_mediaNamethree":
  //     case "pieceSize_mediaNamefour":
  //     case "pieceSize_mediaNamefive":
  //       return "pieceSize";
  //     case "brand_mediaNameone":
  //     case "brand_mediaNametwo":
  //     case "brand_mediaNamethree":
  //     case "brand_mediaNamefour":
  //     case "brand_mediaNamefive":
  //       return "brand";
  //     default:
  //       return "";
  //   }
  // }

  String templateBannerMapping(String templateId) {
    switch (templateId) {
      case 'template1':
        return 'Communication Banner';
      case 'template2':
        return 'OneClick Banner';
      case 'template3':
        return 'TopScheme Banner';
      case 'template9':
        return 'App Scheme Banner';
      case 'template28':
        return 'App Scheme Banner';
      case 'template19':
        return 'Offer Banner';
      case 'template20':
        return 'Tv Adds';
      case 'template21':
        return 'Scanner Banner';
      case 'template22':
        return 'Basket Banner';
      case 'template32':
        return 'Basket Banner';
      case 'template27':
        return 'All Catalogue';
      case 'template30':
        return 'Custom Products Banner';
      case 'template31':
        return 'Festive Banner';
      case 'template26':
        return 'Order Tracking';
      case 'template33':
        return 'Outlet Visit Banner';
      case 'template36':
        return 'Consumer Connect Banner';
      case 'template35':
        return 'Merchandising Banner';
      case 'template34':
        return 'Promo Banner';
      case 'template38':
        return 'Communication Banner';
      default:
        return '';
    }
  }


  Future<List<BannerUI>> getBannerData(String bannerTemplate,
      [bool productMappingCheck = true, String? bannerType]);

  List<Map<String, dynamic>> bannerReelToRealMapping = [
    {
      "bannerType": "App Scheme Banner",
      "bannerValues": {
        "image": "products",
      }
    },
    {
      "bannerType": "Communication Banner",
      "bannerValues": {
        "image": "image",
        "youtube": "youtube",
        "google": "google",
        "communication": "communication",
        "image with products": "products",
        "survey": "survey",
        "consumerpromo": "consumerpromo",
      }
    },
    {
      "bannerType": "Communication Banner v2",
      "bannerValues": {
        "image": "image",
        "youtube": "youtube",
        "google": "google",
        "communication": "communication",
        "image with products": "products",
        "survey": "survey",
        "consumerpromo": "consumerpromo",
        "redirecttopage": "redirecttopage",
      }
    },
    {
      "bannerType": "OneClick Banner",
      "bannerValues": {
        "image": "image",
      }
    },
    {
      "bannerType": "TopScheme Banner",
      "bannerValues": {
        "image": "image",
        "youtube": "youtube",
        "google": "google",
        "communication": "communication",
      }
    },
    {
      "bannerType": "Need based basket banner",
      "bannerValues": {
        "image": "products",
      }
    },
    {
      "bannerType": "offer Banner",
      "bannerValues": {
        "image": "image",
      }
    },
    {
      "bannerType": "Tv Adds",
      "bannerValues": {
        "youtubelink": "image",
        "youtube": "youtube"
      }
    },
    {
      "bannerType": "Scanner Banner",
      "bannerValues": {
        "image": "image",
      }
    },
    {
      "bannerType": "Basket Banner",
      "bannerValues": {
        "imagewithbasketid": "image",
      }
    },
    {
      "bannerType": "Order Tracking",
      "bannerValues": {
        "image": "image",
      }
    },
    {
      "bannerType": "All Catalogue",
      "bannerValues": {
        "image": "allcatalogue",
      }
    },
    {
      "bannerType": "Custom Products Banner",
      "bannerValues": {
        "image": "image",
      }
    },
    {
      "bannerType": "Festive Banner",
      "bannerValues": {
        "image": "image",
        "gif": "image"
      }
    },
    {
      "bannerType": "Outlet Visit Banner",
      "bannerValues": {
        "image": "image",
      }
    },
    {
      "bannerType": "Consumer Connect Banner",
      "bannerValues": {
        "image": "image",
      }
    },
    {
      "bannerType": "Merchandising Banner",
      "bannerValues": {
        "image": "image",
      }
    },
    {
      "bannerType": "Promo Banner",
      "bannerValues": {
        "image": "image",
        "youtube": "youtube",
        "google": "google",
        "communication": "communication",
        "image with products": "products",
        "survey": "survey"
      }
    },
  ];

  Future<List<BannerUI>> multiPurposeBannerFilter(
      List<BannerUI> bannerList, String bannerName) async {
    int i = 0;
    dynamic bannerRealMapping = {};
    for (int j = 0; j < bannerReelToRealMapping.length; j++) {
      if (bannerReelToRealMapping[j]["bannerType"].toLowerCase() ==
          bannerName.toLowerCase()) {
        bannerRealMapping = bannerReelToRealMapping[j]['bannerValues'];
      }
    }
    while (i < bannerList.length) {
      BannerUI currBanner = bannerList[i];
      String mediaName = currBanner.mediaName.toLowerCase();
      String currBannerRealMediaName =
          bannerRealMapping[mediaName]?.toLowerCase() ?? "";

      if (currBannerRealMediaName == "image" || currBannerRealMediaName == "gif") {
        i++;
        // left for additional validations
      } else if (currBannerRealMediaName == "youtube") {
        i++;
      } else if (currBannerRealMediaName == "consumerpromo") {
        i++;
      } else if (currBannerRealMediaName == "products") {
        // if (configurationService.getConfigByName("productCheckForBanners") ==
        //     "true") {
        //   List<ProductUI> arr = getDataFromBannerObj(currBanner);
        //   if (arr.isEmpty) {
        //     bannerList.removeAt(i);
        //   } else {
        //     i++;
        //   }
        // } else {
          i++;
        // }
      } else if (currBannerRealMediaName == "survey") {
        i++;
      } else if (currBannerRealMediaName == "google") {
        i++;
      } else if (currBannerRealMediaName == "communication") {
        i++;
      } else if (currBannerRealMediaName == "allcatalogue") {
        // List<ProductUI> arr = getDataFromBannerObj(currBanner);
        // if (catalogueList.isEmpty) {
        //   bannerList.removeAt(i);
        // } else {
          i++;
        // }
      } else if (mediaName == MediaNameConstants.youtubeLink.toLowerCase()) {
        i++;
      } else if (mediaName == "redirecttopage") {
        i++;
      }
    }

    return bannerList;
  }
}
