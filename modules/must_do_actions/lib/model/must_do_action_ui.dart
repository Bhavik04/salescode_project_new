class MustDoActionUI {
  String id;
  double target;
  double ach;
  double achPer;
  double avgAch;
  String heading;
  String subHeading;
  String avgValueLabel;
  String unit;
  String color;
  int? incentivePoints;
  String actionTag;

  MustDoActionUI(
      {this.id = '',
      this.target = 0.0,
      this.ach = 0.0,
      this.avgAch = 0.0,
      this.achPer = 0.0,
      this.heading = '',
      this.subHeading = '',
      this.avgValueLabel = '',
      this.unit = '',
      this.color = '',
      this.incentivePoints,
      this.actionTag = ''});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'color': color,
      'target': target,
      'ach': ach,
      'avgAch': avgAch,
      'achPer': achPer,
      'heading': heading,
      'subHeading': subHeading,
      'avgValueLabel': avgValueLabel,
      'unit': unit,
      'incentivePoints': incentivePoints,
      'actionTag': actionTag
    };
  }

  factory MustDoActionUI.fromMap(Map<String, dynamic> map) {
    return MustDoActionUI(
        id: map['id'] ?? '',
        target: map['value1'] ?? 0.0,
        avgAch: double.tryParse(map['avgAch'] ?? "0.0") ?? 0.0,
        color: map['color'] ?? '#000000',
        ach: map['ach'] ?? 0.0,
        achPer: map['achPer'] ?? 0.0,
        heading: map['heading'] ?? '',
        subHeading: map['subHeading'] ?? '',
        avgValueLabel: map['avgValueLabel'] ?? '',
        unit: map['unit'] ?? '',
        incentivePoints: map['incentivePoints'],
        actionTag: map['actionTag'] ?? '');
  }
}
