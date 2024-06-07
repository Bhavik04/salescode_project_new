// ignore_for_file: always_specify_types, avoid_redundant_argument_values

import 'dart:convert';
import 'dart:core';

import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class UnavailableProductUIV1 {
  // Each "Entity" needs a unique integer ID property.
  // Add `@Id()` annotation if its name isn't "id" (case insensitive).
  @Id()
  int id = 0;
  @Property(type: PropertyType.date) // Store as int in milliseconds
  DateTime lastModified;
  DateTime manufacturingDateV1;
  //
  // @Transient() // Make this field ignored, not stored in the database.
  // int? notPersisted;
  //
  // // An empty default constructor is needed but you can use optional args.
  // Product({this.text, DateTime? date}) : date = date ?? DateTime.now();
  // Note: just for logs in the examples below(), not needed by ObjectBox.
  @Index()
  @Unique(onConflict: ConflictStrategy.replace)
  final String name;
  String batchCode;
  String description;
  final List<String> images;
  String category;
  final double price;
  final double casePrice;
  final double caseToPieceQty;
  final int caseMrp;
  final int mrp;
  final int pieceSize;
  final String buttonDescriptionV1;

  @Backlink()
  UnavailableProductUIV1({
    this.id = 0,
    required this.name,
    required this.batchCode,
    required this.description,
    required this.images,
    required this.category,
    required this.price,
    required this.casePrice,
    required this.caseToPieceQty,
    required this.caseMrp,
    required this.mrp,
    required this.pieceSize,
    required this.lastModified,
    required this.manufacturingDateV1,
    required this.buttonDescriptionV1,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'batchCode': batchCode,
      'description': description,
      'images': images,
      'category': category,
      'price': price,
      'casePrice': casePrice,
      'caseToPieceQty': caseToPieceQty,
      'caseMrp': caseMrp,
      'mrp': mrp,
      'pieceSize': pieceSize,
      'lastModified': lastModified.toIso8601String(),
      'manufacturingDateV1': manufacturingDateV1,
      'buttonDescriptionV1': buttonDescriptionV1,
    };
  }
}
