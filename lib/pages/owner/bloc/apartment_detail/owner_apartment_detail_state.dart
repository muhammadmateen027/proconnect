import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proconnect/domain/models/apartment.dart';

part 'owner_apartment_detail_state.freezed.dart';

@freezed
class OwnerApartmentDetailState with _$OwnerApartmentDetailState {
  const factory OwnerApartmentDetailState.initial() = _Initial;
  const factory OwnerApartmentDetailState.loading() = _Loading;
  const factory OwnerApartmentDetailState.loaded(Apartment apartment) = _Loaded;
  const factory OwnerApartmentDetailState.updating() = _Updating;
  const factory OwnerApartmentDetailState.success(String message) = _Success;
  const factory OwnerApartmentDetailState.error(String message) = _Error;
}
