import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proconnect/domain/models/unit.dart';
import 'package:proconnect/domain/unit/usecase/add_unit_use_case.dart';
import 'package:proconnect/domain/unit/usecase/delete_unit_use_case.dart';
import 'package:proconnect/domain/unit/usecase/get_units_use_case.dart';

part 'unit_bloc.freezed.dart';

part 'unit_event.dart';

part 'unit_state.dart';

class UnitBloc extends Bloc<UnitEvent, UnitState> {

  UnitBloc(
    this._getUnitsUseCase,
    this._addUnitUseCase,
    this._deleteUnitUseCase,
  ) : super(const UnitState.initial()) {
    on<_LoadUnits>(_onLoadUnits);
    on<_AddUnit>(_onAddUnit);
    on<_DeleteUnit>(_onDeleteUnit);
    on<_UnitsUpdated>(_onUnitsUpdated);
  }
  final GetUnitsUseCase _getUnitsUseCase;
  final AddUnitUseCase _addUnitUseCase;
  final DeleteUnitUseCase _deleteUnitUseCase;
  StreamSubscription<List<Unit>>? _unitSubscription;

  void _onLoadUnits(_LoadUnits event, Emitter<UnitState> emit) {
    emit(const UnitState.loading());
    _unitSubscription?.cancel();
    _unitSubscription = _getUnitsUseCase(event.ownerId).listen(
      (units) => add(UnitEvent.unitsUpdated(units)),
      onError: (error) => emit(UnitState.error(error.toString())),
    );
  }

  Future<void> _onAddUnit(_AddUnit event, Emitter<UnitState> emit) async {
    try {
      await _addUnitUseCase(event.unit);
      // The stream will automatically emit the updated list
    } catch (e) {
      emit(UnitState.error(e.toString()));
    }
  }

  Future<void> _onDeleteUnit(_DeleteUnit event, Emitter<UnitState> emit) async {
    try {
      await _deleteUnitUseCase(event.unitId);
      // The stream will automatically emit the updated list
    } catch (e) {
      emit(UnitState.error(e.toString()));
    }
  }

  void _onUnitsUpdated(_UnitsUpdated event, Emitter<UnitState> emit) {
    emit(UnitState.loaded(event.units));
  }

  @override
  Future<void> close() {
    _unitSubscription?.cancel();
    return super.close();
  }
}
