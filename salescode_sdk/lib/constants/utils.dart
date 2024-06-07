import 'dart:convert';
import 'dart:ui';

import 'package:intl/intl.dart';

import 'global_variables.dart';

dynamic jsonDecodeSafely(body) {
  try {
    return jsonDecode(body);
  } catch (e) {
    return body;
  }
}

String getModifiedData(num data) {
  List<String> values = data.toString().split('.');
  if (values.length == 2 && values[1].length < 2) {
    return "${values[0]}.${values[1]}00";
  } else if (values.length == 1) {
    return "${values[0]}.0000";
  }
  return data.toString();
}

String toFixed2DecimalPlaces(num data, {int decimalPlaces = 2}) {
  String modifiedData = getModifiedData(data);
  List<String> values = modifiedData.toString().split('.');
  if (values.length == 2 &&
      values[1].length >= decimalPlaces &&
      decimalPlaces > 0) {
    return '${values[0]}.${values[1].substring(0, decimalPlaces)}';
  } else {
    return data.toString();
  }
}

int removeDecimal(double value) => value.toInt();

String convertToKString(double value) {
  int number = removeDecimal(value);
  if (number < 1000) {
    return number.round().toString();
  } else {
    double dividedNumber = number / 1000;
    return '${dividedNumber.toStringAsFixed(1)}K';
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  static String getTransparentHexColor(String hexColor) {
    // Ensure the hex color is valid
    RegExp hexColorRegExp = RegExp(r'^#?([a-fA-F0-9]{6})$');
    if (!hexColorRegExp.hasMatch(hexColor)) {
      throw FormatException('Invalid hex color format');
    }

    // Remove the # if it exists
    hexColor = hexColor.replaceAll('#', '');

    // Add 50% opacity (80 in hex)
    return '#1A$hexColor';
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

String getDaySuffix(int day) {
  if (day >= 11 && day <= 13) {
    return 'th';
  }
  switch (day % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}

String formatTodayDate(
    {bool v2 = false, bool v3 = false, bool v4 = false, bool v5 = false}) {
  final DateTime now = DateTime.now();
  String languageCode = GlobalVariables.languageCode;
  if (languageCode == "es") {
    return formatDateAccordingToLang();
  } else if (v2) {
    return "${DateFormat('d').format(now)}"
        "${getDaySuffix(int.parse(DateFormat('d').format(now)))} "
        "${DateFormat('MMMM').format(now)} "
        "${DateFormat('yy').format(now)}";
  } else if (v3) {
    return "${DateFormat('d').format(now)}"
        "${getDaySuffix(int.parse(DateFormat('d').format(now)))} "
        "${DateFormat('MMM').format(now)}' "
        "${DateFormat('yyyy').format(now)}";
  } else if (v4) {
    return "${DateFormat('d').format(now)}"
        "${getDaySuffix(int.parse(DateFormat('d').format(now)))} "
        "${DateFormat('MMM').format(now)}' "
        "${DateFormat('yy').format(now)}";
  } else if (v5) {
    return "${DateFormat('d').format(now)} "
        "${DateFormat('MMMM').format(now)} "
        "${DateFormat('yyyy').format(now)}";
  }

  return DateFormat("MMMM d'${getDaySuffix(now.day)},' yyyy").format(now);
}

String formatDateAccordingToLang({String paramDate = ""}) {
  String languageCode = GlobalVariables.languageCode;
  late String pattern;
  final DateTime now =
      paramDate.isEmpty ? DateTime.now() : DateTime.parse(paramDate);

  Map<String, String> languagePatterns = {
    'es': "d 'de' MMMM, yyyy",
    // Add more language patterns as needed
  };

  pattern = languagePatterns.containsKey(languageCode)
      ? languagePatterns[languageCode]!
      : languagePatterns['en']!;

  return DateFormat(pattern, languageCode).format(now);
}
