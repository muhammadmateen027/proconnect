import 'dart:async';
import 'package:proconnect/domain/models/apartment.dart' as ap;
import 'package:proconnect/domain/models/unit.dart';
import 'package:proconnect/domain/repositories/apartment_repository.dart';
import 'package:proconnect/domain/unit/repository/unit_repository.dart';

class GetUnitsUseCase {
  GetUnitsUseCase(this._unitRepository, this._apartmentRepository);
  final UnitRepository _unitRepository;
  final ApartmentRepository _apartmentRepository;

  Stream<List<Unit>> call(String ownerId) {
    final unitStream = _unitRepository.getUnits(ownerId);
    final apartmentStream = _apartmentRepository.watchApartmentsByOwner(
      ownerId,
    );

    List<Unit>? latestUnits;
    List<ap.Apartment>? latestApartments;

    final controller = StreamController<List<Unit>>();

    void emitMerged() {
      final units = latestUnits ?? [];
      final apartments = latestApartments ?? [];

      final mappedApartments = apartments
          .map(
            (a) => Unit(
              id: a.id,
              unitNo: a.apartmentNumber,
              condoName: a.condoName ?? 'Managed Condominium',
              ownerId: a.ownerId ?? '',
              tenantName: a.tenantName,
              tenantPhone: a.tenantPhone,
              tenantEmail: a.tenantEmail,
              monthlyRent: a.monthlyRent,
              leaseStartDate: a.leaseStartDate,
              leaseEndDate: a.leaseEndDate,
              rentDueDate: a.rentDueDay,
              securityDeposit: a.securityDeposit,
              utilitiesIncluded: a.utilitiesIncluded,
              bedrooms: a.totalBedrooms,
              bathrooms: a.totalBathrooms,
              squareFeet: a.totalSizeSquareFeet.toInt(),
              furnishing: _mapFurnishing(a.furnishing),
              isAssigned: true,
            ),
          )
          .toList();

      controller.add([...units, ...mappedApartments]);
    }

    final sub1 = unitStream.listen(
      (units) {
        latestUnits = units;
        emitMerged();
      },
      onError: controller.addError,
    );

    final sub2 = apartmentStream.listen(
      (apartments) {
        latestApartments = apartments;
        emitMerged();
      },
      onError: controller.addError,
    );

    controller.onCancel = () {
      sub1.cancel();
      sub2.cancel();
    };

    return controller.stream;
  }

  FurnishingStatus _mapFurnishing(ap.FurnishingStatus status) {
    switch (status) {
      case ap.FurnishingStatus.unfurnished:
        return FurnishingStatus.none;
      case ap.FurnishingStatus.partiallyFurnished:
        return FurnishingStatus.partial;
      case ap.FurnishingStatus.fullyFurnished:
        return FurnishingStatus.full;
    }
  }
}
