class MediaNameConstants {
  static const String image = "image";
  static const String youtube = "youtube";
  static const String google = "google";
  static const String communication = "communication";
  static const String categoryImage = "categoryImage";
  static const String imageWithBasketId = "imageWithBasketId";
  static const String imageWithProducts = "image with products";
  static const String survey = "survey";
  static const String youtubeLink = "youtubeLink";
}

class WeightedValue {
  String bannerType;
  String? discountId;
  String? productFilters;
  String blobKey;
  int weight;
  String? schemeDescription;
  String? mediaName;
  String? mediaUrl;

  WeightedValue({
    required this.bannerType,
    this.discountId,
    this.productFilters,
    required this.blobKey,
    required this.weight,
    this.schemeDescription,
    this.mediaName,
    this.mediaUrl
  });
}
