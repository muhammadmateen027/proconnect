import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit.freezed.dart';
part 'unit.g.dart';

enum RentStatus { occupied, vacant }

@freezed
class Unit with _$Unit {
  const factory Unit({
    required String id,
    required String unitNo,
    required String condoName,
    required RentStatus rentStatus,
    required String ownerId,
  }) = _Unit;

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);
}
