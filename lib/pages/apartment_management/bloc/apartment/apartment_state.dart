import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proconnect/domain/models/apartment.dart';

part 'apartment_state.freezed.dart';

/// States for Apartment management
@freezed
class ApartmentState with _$ApartmentState {
  /// Initial state
  const factory ApartmentState.initial() = Initial;

  /// Loading state
  const factory ApartmentState.loading() = Loading;

  /// Apartments loaded successfully
  const factory ApartmentState.loaded({
    required List<Apartment> apartments,
  }) = Loaded;

  /// Operation successful (create, update, delete, assign owner, update status)
  const factory ApartmentState.success({
    String? message,
  }) = Success;

  /// Operation failed
  const factory ApartmentState.failure({
    required String message,
  }) = Failure;
}
