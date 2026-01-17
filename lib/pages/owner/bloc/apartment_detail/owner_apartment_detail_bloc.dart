import 'package:bloc/bloc.dart';
import 'package:proconnect/domain/models/apartment.dart';
import 'package:proconnect/domain/repositories/apartment_repository.dart';

import 'owner_apartment_detail_event.dart';
import 'owner_apartment_detail_state.dart';

export 'owner_apartment_detail_event.dart';
export 'owner_apartment_detail_state.dart';

/// BLoC for managing apartment details from owner perspective
class OwnerApartmentDetailBloc
    extends Bloc<OwnerApartmentDetailEvent, OwnerApartmentDetailState> {
  OwnerApartmentDetailBloc(this._apartmentRepository)
    : super(const OwnerApartmentDetailState.initial()) {
    on<OwnerApartmentDetailEvent>((event, emit) async {
      await event.map(
        loadApartment: (e) => _onLoadApartment(e.apartmentId, emit),
        updateApartmentDetails: (e) =>
            _onUpdateApartmentDetails(e.apartmentId, e.updates, emit),
        assignTenant: (e) => _onAssignTenant(
          e.apartmentId,
          e.tenantName,
          e.tenantEmail,
          e.tenantPhone,
          emit,
        ),
        removeTenant: (e) => _onRemoveTenant(e.apartmentId, emit),
        startLease: (e) => _onStartLease(
          e.apartmentId,
          e.leaseStartDate,
          e.leaseEndDate,
          e.monthlyRent,
          e.securityDeposit,
          e.rentDueDay,
          emit,
        ),
        endLease: (e) => _onEndLease(e.apartmentId, emit),
        updateRentalPrice: (e) => _onUpdateRentalPrice(
          e.apartmentId,
          e.monthlyRent,
          e.securityDeposit,
          emit,
        ),
      );
    });
  }

  final ApartmentRepository _apartmentRepository;

  Future<void> _onLoadApartment(
    String apartmentId,
    Emitter<OwnerApartmentDetailState> emit,
  ) async {
    emit(const OwnerApartmentDetailState.loading());
    try {
      final apartment = await _apartmentRepository.getApartmentById(
        apartmentId,
      );
      if (apartment == null) {
        emit(const OwnerApartmentDetailState.error('Apartment not found'));
        return;
      }
      emit(OwnerApartmentDetailState.loaded(apartment));
    } catch (e) {
      emit(OwnerApartmentDetailState.error(e.toString()));
    }
  }

  Future<void> _onUpdateApartmentDetails(
    String apartmentId,
    Map<String, dynamic> updates,
    Emitter<OwnerApartmentDetailState> emit,
  ) async {
    emit(const OwnerApartmentDetailState.updating());
    try {
      final currentApartment = await _apartmentRepository.getApartmentById(
        apartmentId,
      );
      if (currentApartment == null) {
        emit(const OwnerApartmentDetailState.error('Apartment not found'));
        return;
      }

      // Create updated apartment with changes
      final updatedApartment = currentApartment.copyWith(
        totalBedrooms:
            updates['totalBedrooms'] as int? ?? currentApartment.totalBedrooms,
        totalBathrooms:
            updates['totalBathrooms'] as int? ??
            currentApartment.totalBathrooms,
        totalSizeSquareFeet:
            updates['totalSizeSquareFeet'] as double? ??
            currentApartment.totalSizeSquareFeet,
        furnishing:
            updates['furnishing'] as FurnishingStatus? ??
            currentApartment.furnishing,
        description:
            updates['description'] as String? ?? currentApartment.description,
        notes: updates['notes'] as String? ?? currentApartment.notes,
        updatedAt: DateTime.now(),
      );

      await _apartmentRepository.updateApartment(updatedApartment);
      emit(
        const OwnerApartmentDetailState.success(
          'Apartment updated successfully',
        ),
      );
      emit(OwnerApartmentDetailState.loaded(updatedApartment));
    } catch (e) {
      emit(OwnerApartmentDetailState.error(e.toString()));
    }
  }

  Future<void> _onAssignTenant(
    String apartmentId,
    String tenantName,
    String tenantEmail,
    String tenantPhone,
    Emitter<OwnerApartmentDetailState> emit,
  ) async {
    emit(const OwnerApartmentDetailState.updating());
    try {
      final currentApartment = await _apartmentRepository.getApartmentById(
        apartmentId,
      );
      if (currentApartment == null) {
        emit(const OwnerApartmentDetailState.error('Apartment not found'));
        return;
      }

      final updatedApartment = currentApartment.copyWith(
        tenantName: tenantName,
        tenantEmail: tenantEmail,
        tenantPhone: tenantPhone,
        status: ApartmentStatus.occupied,
        updatedAt: DateTime.now(),
      );

      await _apartmentRepository.updateApartment(updatedApartment);
      emit(
        const OwnerApartmentDetailState.success('Tenant assigned successfully'),
      );
      emit(OwnerApartmentDetailState.loaded(updatedApartment));
    } catch (e) {
      emit(OwnerApartmentDetailState.error(e.toString()));
    }
  }

  Future<void> _onRemoveTenant(
    String apartmentId,
    Emitter<OwnerApartmentDetailState> emit,
  ) async {
    emit(const OwnerApartmentDetailState.updating());
    try {
      final currentApartment = await _apartmentRepository.getApartmentById(
        apartmentId,
      );
      if (currentApartment == null) {
        emit(const OwnerApartmentDetailState.error('Apartment not found'));
        return;
      }

      final updatedApartment = currentApartment.copyWith(
        tenantName: null,
        tenantEmail: null,
        tenantPhone: null,
        tenantId: null,
        status: ApartmentStatus.vacant,
        leaseStartDate: null,
        leaseEndDate: null,
        updatedAt: DateTime.now(),
      );

      await _apartmentRepository.updateApartment(updatedApartment);
      emit(
        const OwnerApartmentDetailState.success('Tenant removed successfully'),
      );
      emit(OwnerApartmentDetailState.loaded(updatedApartment));
    } catch (e) {
      emit(OwnerApartmentDetailState.error(e.toString()));
    }
  }

  Future<void> _onStartLease(
    String apartmentId,
    DateTime leaseStartDate,
    DateTime leaseEndDate,
    double monthlyRent,
    double securityDeposit,
    int rentDueDay,
    Emitter<OwnerApartmentDetailState> emit,
  ) async {
    emit(const OwnerApartmentDetailState.updating());
    try {
      final currentApartment = await _apartmentRepository.getApartmentById(
        apartmentId,
      );
      if (currentApartment == null) {
        emit(const OwnerApartmentDetailState.error('Apartment not found'));
        return;
      }

      final updatedApartment = currentApartment.copyWith(
        leaseStartDate: leaseStartDate,
        leaseEndDate: leaseEndDate,
        monthlyRent: monthlyRent,
        securityDeposit: securityDeposit,
        rentDueDay: rentDueDay,
        status: ApartmentStatus.occupied,
        updatedAt: DateTime.now(),
      );

      await _apartmentRepository.updateApartment(updatedApartment);
      emit(
        const OwnerApartmentDetailState.success('Lease started successfully'),
      );
      emit(OwnerApartmentDetailState.loaded(updatedApartment));
    } catch (e) {
      emit(OwnerApartmentDetailState.error(e.toString()));
    }
  }

  Future<void> _onEndLease(
    String apartmentId,
    Emitter<OwnerApartmentDetailState> emit,
  ) async {
    emit(const OwnerApartmentDetailState.updating());
    try {
      final currentApartment = await _apartmentRepository.getApartmentById(
        apartmentId,
      );
      if (currentApartment == null) {
        emit(const OwnerApartmentDetailState.error('Apartment not found'));
        return;
      }

      final updatedApartment = currentApartment.copyWith(
        leaseStartDate: null,
        leaseEndDate: null,
        status: ApartmentStatus.vacant,
        updatedAt: DateTime.now(),
      );

      await _apartmentRepository.updateApartment(updatedApartment);
      emit(const OwnerApartmentDetailState.success('Lease ended successfully'));
      emit(OwnerApartmentDetailState.loaded(updatedApartment));
    } catch (e) {
      emit(OwnerApartmentDetailState.error(e.toString()));
    }
  }

  Future<void> _onUpdateRentalPrice(
    String apartmentId,
    double monthlyRent,
    double securityDeposit,
    Emitter<OwnerApartmentDetailState> emit,
  ) async {
    emit(const OwnerApartmentDetailState.updating());
    try {
      final currentApartment = await _apartmentRepository.getApartmentById(
        apartmentId,
      );
      if (currentApartment == null) {
        emit(const OwnerApartmentDetailState.error('Apartment not found'));
        return;
      }

      final updatedApartment = currentApartment.copyWith(
        monthlyRent: monthlyRent,
        securityDeposit: securityDeposit,
        updatedAt: DateTime.now(),
      );

      await _apartmentRepository.updateApartment(updatedApartment);
      emit(
        const OwnerApartmentDetailState.success(
          'Rental price updated successfully',
        ),
      );
      emit(OwnerApartmentDetailState.loaded(updatedApartment));
    } catch (e) {
      emit(OwnerApartmentDetailState.error(e.toString()));
    }
  }
}
