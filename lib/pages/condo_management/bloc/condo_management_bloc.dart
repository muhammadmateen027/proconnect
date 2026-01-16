import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proconnect/domain/admin/usecase/create_condo_use_case.dart';
import 'package:proconnect/domain/admin/usecase/delete_condo_use_case.dart';
import 'package:proconnect/domain/admin/usecase/load_condos_use_case.dart';
import 'package:proconnect/domain/admin/usecase/update_condo_use_case.dart';
import 'package:proconnect/domain/models/condo.dart';

part 'condo_management_bloc.freezed.dart';
part 'condo_management_state.dart';
part 'condo_management_event.dart';

class CondoManagementBloc
    extends Bloc<CondoManagementEvent, CondoManagementState> {
  CondoManagementBloc({
    required LoadCondosUseCase loadCondosUseCase,
    required CreateCondoUseCase createCondoUseCase,
    required UpdateCondoUseCase updateCondoUseCase,
    required DeleteCondoUseCase deleteCondoUseCase,
  }) : _loadCondosUseCase = loadCondosUseCase,
       _createCondoUseCase = createCondoUseCase,
       _updateCondoUseCase = updateCondoUseCase,
       _deleteCondoUseCase = deleteCondoUseCase,
       super(const CondoManagementState.initial()) {
    on<_LoadCondos>(_onLoadCondos);
    on<_CreateCondo>(_onCreateCondo);
    on<_UpdateCondo>(_onUpdateCondo);
    on<_DeleteCondo>(_onDeleteCondo);
  }

  final LoadCondosUseCase _loadCondosUseCase;
  final CreateCondoUseCase _createCondoUseCase;
  final UpdateCondoUseCase _updateCondoUseCase;
  final DeleteCondoUseCase _deleteCondoUseCase;

  Future<void> _onLoadCondos(
    _LoadCondos event,
    Emitter<CondoManagementState> emit,
  ) async {
    emit(const CondoManagementState.loading());
    try {
      final condos = await _loadCondosUseCase();
      emit(CondoManagementState.loaded(condos: condos));
    } catch (e) {
      emit(
        const CondoManagementState.failure(
          errorKey: 'loadCondosFailed',
        ),
      );
    }
  }

  Future<void> _onCreateCondo(
    _CreateCondo event,
    Emitter<CondoManagementState> emit,
  ) async {
    emit(const CondoManagementState.loading());
    try {
      await _createCondoUseCase(
        name: event.name,
        address: event.address,
      );
      emit(const CondoManagementState.success());
    } catch (e) {
      emit(
        const CondoManagementState.failure(
          errorKey: 'createCondoFailed',
        ),
      );
    }
  }

  Future<void> _onUpdateCondo(
    _UpdateCondo event,
    Emitter<CondoManagementState> emit,
  ) async {
    emit(const CondoManagementState.loading());
    try {
      await _updateCondoUseCase(
        condo: event.condo,
      );
      emit(const CondoManagementState.success());
    } catch (e) {
      emit(
        const CondoManagementState.failure(
          errorKey: 'updateCondoFailed',
        ),
      );
    }
  }

  Future<void> _onDeleteCondo(
    _DeleteCondo event,
    Emitter<CondoManagementState> emit,
  ) async {
    emit(const CondoManagementState.loading());
    try {
      await _deleteCondoUseCase(
        id: event.id,
      );
      emit(const CondoManagementState.success());
    } catch (e) {
      emit(
        const CondoManagementState.failure(
          errorKey: 'deleteCondoFailed',
        ),
      );
    }
  }
}
