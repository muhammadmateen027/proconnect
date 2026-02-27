import 'package:freezed_annotation/freezed_annotation.dart';

part 'floor.freezed.dart';
part 'floor.g.dart';

/// Represents a floor in a condominium building
@freezed
class Floor with _$Floor {
  const factory Floor({
    required String id,
    required String condominiumId,
    required String agencyId,
    required int floorNumber,
    String? floorName, // e.g., "Ground Floor", "Penthouse Level"
    int? totalApartments,
    String? description,
    @Default([]) List<String> amenities, // Floor-specific amenities
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Floor;

  factory Floor.fromJson(Map<String, dynamic> json) => _$FloorFromJson(json);
}
