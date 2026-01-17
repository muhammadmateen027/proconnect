import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proconnect/domain/repositories/apartment_repository.dart';
import 'package:proconnect/pages/apartment_management/bloc/apartment/apartment_event.dart';
import 'package:proconnect/pages/apartment_management/bloc/apartment/apartment_state.dart';

/// BLoC for managing Apartment operations
class ApartmentBloc extends Bloc<ApartmentEvent, ApartmentState> {
  ApartmentBloc({
    required ApartmentRepository apartmentRepository,
  }) : _apartmentRepository = apartmentRepository,
       super(const ApartmentState.initial()) {
    on<LoadApartments>(_onLoadApartments);
    on<LoadApartmentsByFloor>(_onLoadApartmentsByFloor);
    on<CreateApartment>(_onCreateApartment);
    on<UpdateApartment>(_onUpdateApartment);
    on<DeleteApartment>(_onDeleteApartment);
    on<AssignOwner>(_onAssignOwner);
    on<UpdateStatus>(_onUpdateStatus);
  }

  final ApartmentRepository _apartmentRepository;

  Future<void> _onLoadApartments(
    LoadApartments event,
    Emitter<ApartmentState> emit,
  ) async {
    emit(const ApartmentState.loading());
    try {
      final apartments = await _apartmentRepository.getApartmentsByCondominium(
        event.condominiumId,
      );
      emit(ApartmentState.loaded(apartments: apartments));
    } catch (e) {
      emit(ApartmentState.failure(message: 'Failed to load apartments: $e'));
    }
  }

  Future<void> _onLoadApartmentsByFloor(
    LoadApartmentsByFloor event,
    Emitter<ApartmentState> emit,
  ) async {
    emit(const ApartmentState.loading());
    try {
      final apartments = await _apartmentRepository.getApartmentsByFloor(
        event.floorId,
      );
      emit(ApartmentState.loaded(apartments: apartments));
    } catch (e) {
      emit(ApartmentState.failure(message: 'Failed to load apartments: $e'));
    }
  }

  Future<void> _onCreateApartment(
    CreateApartment event,
    Emitter<ApartmentState> emit,
  ) async {
    emit(const ApartmentState.loading());
    try {
      await _apartmentRepository.createApartment(event.apartment);
      emit(
        const ApartmentState.success(message: 'Apartment created successfully'),
      );

      // Reload apartments
      add(LoadApartments(condominiumId: event.apartment.condominiumId));
    } catch (e) {
      emit(ApartmentState.failure(message: 'Failed to create apartment: $e'));
    }
  }

  Future<void> _onUpdateApartment(
    UpdateApartment event,
    Emitter<ApartmentState> emit,
  ) async {
    emit(const ApartmentState.loading());
    try {
      await _apartmentRepository.updateApartment(event.apartment);
      emit(
        const ApartmentState.success(message: 'Apartment updated successfully'),
      );

      // Reload apartments
      add(LoadApartments(condominiumId: event.apartment.condominiumId));
    } catch (e) {
      emit(ApartmentState.failure(message: 'Failed to update apartment: $e'));
    }
  }

  Future<void> _onDeleteApartment(
    DeleteApartment event,
    Emitter<ApartmentState> emit,
  ) async {
    emit(const ApartmentState.loading());
    try {
      await _apartmentRepository.deleteApartment(event.apartmentId);
      emit(
        const ApartmentState.success(message: 'Apartment deleted successfully'),
      );
    } catch (e) {
      emit(ApartmentState.failure(message: 'Failed to delete apartment: $e'));
    }
  }

  Future<void> _onAssignOwner(
    AssignOwner event,
    Emitter<ApartmentState> emit,
  ) async {
    emit(const ApartmentState.loading());
    try {
      await _apartmentRepository.assignOwner(
        apartmentId: event.apartmentId,
        ownerId: event.ownerId,
        ownerName: event.ownerName,
        ownerEmail: event.ownerEmail,
        ownerPhone: event.ownerPhone,
      );
      emit(
        const ApartmentState.success(message: 'Owner assigned successfully'),
      );
    } catch (e) {
      emit(ApartmentState.failure(message: 'Failed to assign owner: $e'));
    }
  }

  Future<void> _onUpdateStatus(
    UpdateStatus event,
    Emitter<ApartmentState> emit,
  ) async {
    emit(const ApartmentState.loading());
    try {
      await _apartmentRepository.updateApartmentStatus(
        apartmentId: event.apartmentId,
        status: event.status,
        vacantFrom: event.vacantFrom,
        availableFrom: event.availableFrom,
      );
      emit(
        const ApartmentState.success(message: 'Status updated successfully'),
      );
    } catch (e) {
      emit(ApartmentState.failure(message: 'Failed to update status: $e'));
    }
  }
}
