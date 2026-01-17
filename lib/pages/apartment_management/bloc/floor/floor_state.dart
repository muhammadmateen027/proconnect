import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proconnect/domain/models/floor.dart';

part 'floor_state.freezed.dart';

/// States for Floor management
@freezed
class FloorState with _$FloorState {
  /// Initial state
  const factory FloorState.initial() = Initial;

  /// Loading state
  const factory FloorState.loading() = Loading;

  /// Floors loaded successfully
  const factory FloorState.loaded({
    required List<Floor> floors,
  }) = Loaded;

  /// Operation successful (create, update, delete)
  const factory FloorState.success({
    String? message,
  }) = Success;

  /// Operation failed
  const factory FloorState.failure({
    required String message,
  }) = Failure;
}
