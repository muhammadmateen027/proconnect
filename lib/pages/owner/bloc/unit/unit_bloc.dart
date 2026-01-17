import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proconnect/domain/models/unit.dart';
import 'package:proconnect/domain/unit/usecase/add_unit_use_case.dart';
import 'package:proconnect/domain/unit/usecase/delete_unit_use_case.dart';
import 'package:proconnect/domain/unit/usecase/get_units_use_case.dart';
import 'package:proconnect/domain/unit/usecase/update_unit_tenant_details_use_case.dart';

part 'unit_event.dart';
part 'unit_state.dart';
part 'unit_bloc.freezed.dart';

class UnitBloc extends Bloc<UnitEvent, UnitState> {
  UnitBloc(
    this._getUnitsUseCase,
    this._addUnitUseCase,
    this._deleteUnitUseCase,
    this._updateUnitTenantDetailsUseCase,
  ) : super(const UnitState.initial()) {
    on<_LoadUnits>(_onLoadUnits);
    on<_AddUnit>(_onAddUnit);
    on<UpdateTenantInfo>(_onUpdateTenantInfo);
    on<_DeleteUnit>(_onDeleteUnit);
    on<_UnitsUpdated>(_onUnitsUpdated);
    on<_Clear>(_onClear);
  }
  final GetUnitsUseCase _getUnitsUseCase;
  final AddUnitUseCase _addUnitUseCase;
  final DeleteUnitUseCase _deleteUnitUseCase;
  final UpdateUnitTenantDetailsUseCase _updateUnitTenantDetailsUseCase;
  StreamSubscription<List<Unit>>? _unitSubscription;

  Future<void> _onLoadUnits(_LoadUnits event, Emitter<UnitState> emit) async {
    emit(const UnitState.loading());

    await emit.forEach<List<Unit>>(
      _getUnitsUseCase(event.ownerId),
      onData: UnitState.loaded,
      onError: (error, stackTrace) => UnitState.error(error.toString()),
    );
  }

  Future<void> _onAddUnit(_AddUnit event, Emitter<UnitState> emit) async {
    try {
      await _addUnitUseCase(event.unit);
    } catch (e) {
      emit(UnitState.error(e.toString()));
    }
  }

  Future<void> _onUpdateTenantInfo(
    UpdateTenantInfo event,
    Emitter<UnitState> emit,
  ) async {
    emit(const UnitState.loading());
    try {
      await _updateUnitTenantDetailsUseCase(
        unitId: event.unitId,
        tenantName: event.tenantName,
        tenantPhone: event.tenantPhone,
        tenantEmail: event.tenantEmail,
        monthlyRent: event.monthlyRent,
      );
      emit(const UnitState.unitUpdateSuccess());
    } catch (e) {
      emit(UnitState.error(e.toString()));
    }
  }

  Future<void> _onDeleteUnit(_DeleteUnit event, Emitter<UnitState> emit) async {
    try {
      await _deleteUnitUseCase(event.unitId);
    } catch (e) {
      emit(UnitState.error(e.toString()));
    }
  }

  void _onUnitsUpdated(_UnitsUpdated event, Emitter<UnitState> emit) {
    emit(UnitState.loaded(event.units));
  }

  void _onClear(_Clear event, Emitter<UnitState> emit) {
    _unitSubscription?.cancel();
    _unitSubscription = null;
    emit(const UnitState.initial());
  }

  @override
  Future<void> close() {
    _unitSubscription?.cancel();
    return super.close();
  }
}
