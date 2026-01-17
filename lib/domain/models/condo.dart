import 'package:freezed_annotation/freezed_annotation.dart';

part 'condo.freezed.dart';
part 'condo.g.dart';

@freezed
class Condo with _$Condo {
  const factory Condo({
    required String id,
    required String name,
    required String address,
    int? totalUnits,
    int? totalFloors,
    int? yearBuilt,
    String? description,
    String? contactEmail,
    String? contactPhone,
    @Default([]) List<String> amenities,
  }) = _Condo;

  factory Condo.fromJson(Map<String, dynamic> json) => _$CondoFromJson(json);
}
