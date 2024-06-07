class DataSyncUI {
  int id = 0;
  String name;
  String description;
  DateTime startTime;
  DateTime endTime;
  String status;
  String syncType = "full";
  double size;
  double records;
  int syncTime;
  DateTime expiryTime; //seconds
  DataSyncUI(
      {this.id = 0,
      required this.syncTime,
      required this.syncType,
      this.records = 0,
      this.size = 0,
      required this.name,
      this.description = "",
      required this.startTime,
      required this.endTime,
      required this.status,
      required this.expiryTime});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'status': status,
      'syncType': syncType,
      'size': size,
      'records': records,
      'syncTime': syncTime,
      'expiryTime': expiryTime.toIso8601String(),
    };
  }

  factory DataSyncUI.fromMap(Map<String, dynamic> map) {
    return DataSyncUI(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      startTime: map['startTime'],
      endTime: map['endTime'],
      status: map['status'] as String,
      syncType: map['syncType'] as String,
      size: map['size'] as double,
      records: map['records'] as double,
      syncTime: map['syncTime'] as int,
      expiryTime: map['expiryTime'],
    );
  }
}
