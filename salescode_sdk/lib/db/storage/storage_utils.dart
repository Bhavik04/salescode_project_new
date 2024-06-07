import 'dart:convert';

class StorageUtils {
  static bool? convertStringToBool(String? flag) {
    if (flag == null) {
      return null;
    }
    if (flag.toLowerCase() == 'true') {
      return true;
    } else if (flag.toLowerCase() == 'false') {
      return false;
    } else {
      // Handle the case where the input is neither 'true' nor 'false'
      return false;
    }
  }

  static List<String> getListFromString(String? input) {
    if (input == null) {
      return [];
    }
    List<String> output = [];
    var arr = jsonDecode(input);
    if (arr is List) {
      for (var value in arr) {
        output.add(value.toString());
      }
    }
    return output;
  }

  static int? getIntFromString(String? input) {
    if (input == null) {
      return null;
    }
    return int.tryParse(input);
  }

  static double? getDoubleFromString(String? input) {
    if (input == null) {
      return null;
    }
    return double.tryParse(input);
  }
}
