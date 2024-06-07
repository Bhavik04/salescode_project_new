import 'configuration_ui.dart';

class AppOptionsConfiguration {
  final Map<String, dynamic> _configMap = {
    "noVisitOptions": "null",
    "noOrderOptions": "null",
    "competitorOption": "null",
    "activityOption": "null",
    "merchandisingOption": "null",
    "attendanceStatusOption": "null",
    "priorityOption": "null",
    "complaintOption": "null",
    "merchandisingSampleImages": "null",
    "bankListForHelpDesk": "null",
    "mobileNumberChangeInstructions": "null",
    "coolerRemarksOptions": "null",
    "customerServiceOptions": "null"
  };

  String get noVisitOptions => _configMap["noVisitOptions"];
  String get noOrderOptions => _configMap["noOrderOptions"];
  String get competitorOption => _configMap["competitorOption"];
  String get activityOption => _configMap["activityOption"];
  String get merchandisingOption => _configMap["merchandisingOption"];
  String get attendanceStatusOption => _configMap["attendanceStatusOption"];
  String get priorityOption => _configMap["priorityOption"];
  String get complaintOption => _configMap["complaintOption"];
  String get merchandisingSampleImages =>
      _configMap["merchandisingSampleImages"];
  String get bankListForHelpDesk => _configMap["bankListForHelpDesk"];
  String get mobileNumberChangeInstructions =>
      _configMap["mobileNumberChangeInstructions"];
  String get coolerRemarksOptions => _configMap["coolerRemarksOptions"];
  String get customerServiceOptions => _configMap["customerServiceOptions"];

  AppOptionsConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
