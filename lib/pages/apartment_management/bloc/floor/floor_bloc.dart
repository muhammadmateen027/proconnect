import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proconnect/domain/models/floor.dart';
import 'package:proconnect/domain/repositories/apartment_repository.dart';
import 'package:proconnect/domain/repositories/floor_repository.dart';
import 'package:proconnect/pages/apartment_management/bloc/floor/floor_event.dart';
import 'package:proconnect/pages/apartment_management/bloc/floor/floor_state.dart';

/// BLoC for managing Floor operations
class FloorBloc extends Bloc<FloorEvent, FloorState> {
  FloorBloc({
    required FloorRepository floorRepository,
    required ApartmentRepository apartmentRepository,
  }) : _floorRepository = floorRepository,
       _apartmentRepository = apartmentRepository,
       super(const FloorState.initial()) {
    on<LoadFloors>(_onLoadFloors);
    on<CreateFloor>(_onCreateFloor);
    on<UpdateFloor>(_onUpdateFloor);
    on<DeleteFloor>(_onDeleteFloor);
  }

  final FloorRepository _floorRepository;
  final ApartmentRepository _apartmentRepository;

  Future<void> _onLoadFloors(
    LoadFloors event,
    Emitter<FloorState> emit,
  ) async {
    emit(const FloorState.loading());
    try {
      final floors = await _floorRepository.getFloorsByCondominium(
        event.condominiumId,
      );
      emit(FloorState.loaded(floors: floors));
    } catch (e) {
      emit(FloorState.failure(message: 'Failed to load floors: $e'));
    }
  }

  Future<void> _onCreateFloor(
    CreateFloor event,
    Emitter<FloorState> emit,
  ) async {
    emit(const FloorState.loading());
    try {
      final floor = Floor(
        id: '', // Will be set by repository
        condominiumId: event.condominiumId,
        agencyId: event.agencyId,
        floorNumber: event.floorNumber,
        floorName: event.floorName,
        totalApartments: event.totalApartments,
        description: event.description,
        amenities: event.amenities ?? [],
      );

      await _floorRepository.createFloor(floor);
      emit(const FloorState.success(message: 'Floor created successfully'));

      // Reload floors
      add(LoadFloors(condominiumId: event.condominiumId));
    } catch (e) {
      emit(FloorState.failure(message: 'Failed to create floor: $e'));
    }
  }

  Future<void> _onUpdateFloor(
    UpdateFloor event,
    Emitter<FloorState> emit,
  ) async {
    emit(const FloorState.loading());
    try {
      await _floorRepository.updateFloor(event.floor);
      emit(const FloorState.success(message: 'Floor updated successfully'));

      // Reload floors
      add(LoadFloors(condominiumId: event.floor.condominiumId));
    } catch (e) {
      emit(FloorState.failure(message: 'Failed to update floor: $e'));
    }
  }

  Future<void> _onDeleteFloor(
    DeleteFloor event,
    Emitter<FloorState> emit,
  ) async {
    emit(const FloorState.loading());
    try {
      // 1. Delete all apartments on this floor (cascade delete using batch)
      await _apartmentRepository.deleteApartmentsByFloor(
        event.floorId,
        condominiumId: event.condominiumId,
      );

      // 2. Delete the floor itself
      await _floorRepository.deleteFloor(event.floorId);

      emit(
        const FloorState.success(
          message: 'Floor and its apartments deleted successfully',
        ),
      );

      // 4. Reload floors
      add(LoadFloors(condominiumId: event.condominiumId));
    } catch (e) {
      emit(FloorState.failure(message: 'Failed to delete floor: $e'));
    }
  }
}
