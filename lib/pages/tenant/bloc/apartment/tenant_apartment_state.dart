import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proconnect/domain/models/apartment.dart';

part 'tenant_apartment_state.freezed.dart';

@freezed
class TenantApartmentState with _$TenantApartmentState {
  const factory TenantApartmentState.initial() = _Initial;
  const factory TenantApartmentState.loading() = _Loading;
  const factory TenantApartmentState.loaded(List<Apartment> apartments) =
      _Loaded;
  const factory TenantApartmentState.error(String message) = _Error;
}
