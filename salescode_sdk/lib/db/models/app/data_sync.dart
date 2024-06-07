import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class DataSyncV1 {
  // Each "Entity" needs a unique integer ID property.
  // Add `@Id()` annotation if its name isn't "id" (case insensitive).
  @Id()
  int id = 0;

  //
  // @Transient() // Make this field ignored, not stored in the database.
  // int? notPersisted;
  //
  // // An empty default constructor is needed but you can use optional args.
  // Product({this.text, DateTime? date}) : date = date ?? DateTime.now();
  // Note: just for logs in the examples below(), not needed by ObjectBox.
  @Index()
  String name;
  String description;
  @Property(type: PropertyType.date) // Store as int in milliseconds
  DateTime startTime;
  @Property(type: PropertyType.date) // Store as int in milliseconds
  DateTime endTime;
  @Index()
  String status;
  @Index()
  String syncType = "full";
  double size;
  double records;
  int syncTime; //seconds
  DateTime expiryTime;

  DataSyncV1(
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
      'startTime': startTime,
      'endTime': endTime,
      'status': status,
      'syncType': syncType,
      'size': size,
      'records': records,
      'syncTime': syncTime,
      'expiryTime': expiryTime,
    };
  }

  factory DataSyncV1.fromMap(Map<String, dynamic> map) {
    return DataSyncV1(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      startTime: DateTime.parse(map['startTime'] as String),
      endTime: DateTime.parse(map['endTime'] as String),
      status: map['status'] as String,
      syncType: map['syncType'] as String,
      size: map['size'] as double,
      records: map['records'] as double,
      syncTime: map['syncTime'] as int,
      expiryTime: DateTime.parse(map['expiryTime'] as String),
    );
  }
} // find() returns List<Person>
