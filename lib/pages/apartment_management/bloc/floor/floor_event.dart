import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proconnect/domain/models/floor.dart';

part 'floor_event.freezed.dart';

/// Events for Floor management
@freezed
class FloorEvent with _$FloorEvent {
  /// Load all floors for a condominium
  const factory FloorEvent.loadFloors({
    required String condominiumId,
  }) = LoadFloors;

  /// Create a new floor
  const factory FloorEvent.createFloor({
    required String condominiumId,
    required String agencyId,
    required int floorNumber,
    String? floorName,
    int? totalApartments,
    String? description,
    List<String>? amenities,
  }) = CreateFloor;

  /// Update an existing floor
  const factory FloorEvent.updateFloor({
    required Floor floor,
  }) = UpdateFloor;

  /// Delete a floor
  const factory FloorEvent.deleteFloor({
    required String condominiumId,
    required String floorId,
  }) = DeleteFloor;
}
