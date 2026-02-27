import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proconnect/domain/models/apartment.dart';

part 'tenant_apartment_event.freezed.dart';

@freezed
class TenantApartmentEvent with _$TenantApartmentEvent {
  const factory TenantApartmentEvent.load(String tenantId) = _Load;
}
