import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proconnect/domain/admin/usecase/create_condo_use_case.dart';
import 'package:proconnect/domain/admin/usecase/delete_condo_use_case.dart';
import 'package:proconnect/domain/admin/usecase/load_condos_use_case.dart';
import 'package:proconnect/domain/admin/usecase/update_condo_use_case.dart';
import 'package:proconnect/domain/condo/repository/condo_repository.dart';
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
    required CondoRepository condoRepository,
  }) : _loadCondosUseCase = loadCondosUseCase,
       _createCondoUseCase = createCondoUseCase,
       _updateCondoUseCase = updateCondoUseCase,
       _deleteCondoUseCase = deleteCondoUseCase,
       _condoRepository = condoRepository,
       super(const CondoManagementState.initial()) {
    on<_LoadCondos>(_onLoadCondos);
    on<_CreateCondo>(_onCreateCondo);
    on<_UpdateCondo>(_onUpdateCondo);
    on<_DeleteCondo>(_onDeleteCondo);
    on<_AssignAgency>(_onAssignAgency);
  }

  final LoadCondosUseCase _loadCondosUseCase;
  final CreateCondoUseCase _createCondoUseCase;
  final UpdateCondoUseCase _updateCondoUseCase;
  final DeleteCondoUseCase _deleteCondoUseCase;
  final CondoRepository _condoRepository;

  Future<void> _onLoadCondos(
    _LoadCondos event,
    Emitter<CondoManagementState> emit,
  ) async {
    emit(const CondoManagementState.loading());
    try {
      final condos = await _loadCondosUseCase(agencyId: event.agencyId);
      emit(CondoManagementState.loaded(condos: condos));
    } catch (e, stack) {
      print('DEBUG: Error loading condos: $e');
      print('DEBUG: Stack trace: $stack');
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
        totalUnits: event.totalUnits,
        totalFloors: event.totalFloors,
        yearBuilt: event.yearBuilt,
        description: event.description,
        contactEmail: event.contactEmail,
        contactPhone: event.contactPhone,
        amenities: event.amenities,
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

  Future<void> _onAssignAgency(
    _AssignAgency event,
    Emitter<CondoManagementState> emit,
  ) async {
    try {
      await _condoRepository.assignAgency(
        condoId: event.condoId,
        agencyId: event.agencyId,
        agencyName: event.agencyName,
      );
      emit(const CondoManagementState.success());
      // Reload condos to reflect the change
      add(const CondoManagementEvent.loadCondos());
    } catch (e) {
      emit(
        const CondoManagementState.failure(
          errorKey: 'assignAgencyFailed',
        ),
      );
    }
  }
}
