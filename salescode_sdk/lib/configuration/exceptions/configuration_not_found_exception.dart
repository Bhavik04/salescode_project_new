class ConfigurationNotFoundException implements Exception {
  String? message;
  String? reason;
  ConfigurationNotFoundException({this.message, this.reason});
}
