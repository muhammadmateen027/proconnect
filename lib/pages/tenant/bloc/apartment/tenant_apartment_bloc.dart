import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proconnect/domain/tenant/usecase/get_tenant_apartments_use_case.dart';
import 'package:proconnect/pages/tenant/bloc/apartment/tenant_apartment_event.dart';
import 'package:proconnect/pages/tenant/bloc/apartment/tenant_apartment_state.dart';

class TenantApartmentBloc
    extends Bloc<TenantApartmentEvent, TenantApartmentState> {
  TenantApartmentBloc(this._getTenantApartmentsUseCase)
    : super(const TenantApartmentState.initial()) {
    on<TenantApartmentEvent>((event, emit) async {
      await event.when(
        load: (tenantId) => _onLoad(tenantId, emit),
      );
    });
  }

  final GetTenantApartmentsUseCase _getTenantApartmentsUseCase;

  Future<void> _onLoad(
    String tenantId,
    Emitter<TenantApartmentState> emit,
  ) async {
    emit(const TenantApartmentState.loading());
    await emit.forEach(
      _getTenantApartmentsUseCase(tenantId),
      onData: (apartments) => TenantApartmentState.loaded(apartments),
      onError: (error, stackTrace) =>
          TenantApartmentState.error(error.toString()),
    );
  }
}
