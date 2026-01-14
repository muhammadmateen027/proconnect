part of 'unit_bloc.dart';

@freezed
abstract class UnitState with _$UnitState {
  const factory UnitState.initial() = _Initial;
  const factory UnitState.loading() = _Loading;
  const factory UnitState.loaded(List<Unit> units) = _Loaded;
  const factory UnitState.error(String message) = _Error;
}
