// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apartment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApartmentImpl _$$ApartmentImplFromJson(Map<String, dynamic> json) =>
    _$ApartmentImpl(
      id: json['id'] as String,
      condominiumId: json['condominiumId'] as String,
      agencyId: json['agencyId'] as String,
      floorId: json['floorId'] as String,
      apartmentNumber: json['apartmentNumber'] as String,
      totalSizeSquareFeet: (json['totalSizeSquareFeet'] as num).toDouble(),
      condoName: json['condoName'] as String?,
      ownerId: json['ownerId'] as String?,
      ownerName: json['ownerName'] as String?,
      ownerEmail: json['ownerEmail'] as String?,
      ownerPhone: json['ownerPhone'] as String?,
      tenantId: json['tenantId'] as String?,
      tenantName: json['tenantName'] as String?,
      tenantEmail: json['tenantEmail'] as String?,
      tenantPhone: json['tenantPhone'] as String?,
      rooms:
          (json['rooms'] as List<dynamic>?)
              ?.map((e) => Room.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalBedrooms: (json['totalBedrooms'] as num?)?.toInt() ?? 0,
      totalBathrooms: (json['totalBathrooms'] as num?)?.toInt() ?? 0,
      furnishing:
          $enumDecodeNullable(_$FurnishingStatusEnumMap, json['furnishing']) ??
          FurnishingStatus.unfurnished,
      status:
          $enumDecodeNullable(_$ApartmentStatusEnumMap, json['status']) ??
          ApartmentStatus.vacant,
      vacantFrom: json['vacantFrom'] == null
          ? null
          : DateTime.parse(json['vacantFrom'] as String),
      availableFrom: json['availableFrom'] == null
          ? null
          : DateTime.parse(json['availableFrom'] as String),
      monthlyRent: (json['monthlyRent'] as num?)?.toDouble(),
      securityDeposit: (json['securityDeposit'] as num?)?.toDouble(),
      utilitiesIncluded:
          (json['utilitiesIncluded'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      leaseStartDate: json['leaseStartDate'] == null
          ? null
          : DateTime.parse(json['leaseStartDate'] as String),
      leaseEndDate: json['leaseEndDate'] == null
          ? null
          : DateTime.parse(json['leaseEndDate'] as String),
      rentDueDay: (json['rentDueDay'] as num?)?.toInt(),
      parkingSpaces:
          (json['parkingSpaces'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      amenities:
          (json['amenities'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      description: json['description'] as String?,
      notes: json['notes'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ApartmentImplToJson(_$ApartmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'condominiumId': instance.condominiumId,
      'agencyId': instance.agencyId,
      'floorId': instance.floorId,
      'apartmentNumber': instance.apartmentNumber,
      'totalSizeSquareFeet': instance.totalSizeSquareFeet,
      'condoName': instance.condoName,
      'ownerId': instance.ownerId,
      'ownerName': instance.ownerName,
      'ownerEmail': instance.ownerEmail,
      'ownerPhone': instance.ownerPhone,
      'tenantId': instance.tenantId,
      'tenantName': instance.tenantName,
      'tenantEmail': instance.tenantEmail,
      'tenantPhone': instance.tenantPhone,
      'rooms': instance.rooms,
      'totalBedrooms': instance.totalBedrooms,
      'totalBathrooms': instance.totalBathrooms,
      'furnishing': _$FurnishingStatusEnumMap[instance.furnishing]!,
      'status': _$ApartmentStatusEnumMap[instance.status]!,
      'vacantFrom': instance.vacantFrom?.toIso8601String(),
      'availableFrom': instance.availableFrom?.toIso8601String(),
      'monthlyRent': instance.monthlyRent,
      'securityDeposit': instance.securityDeposit,
      'utilitiesIncluded': instance.utilitiesIncluded,
      'leaseStartDate': instance.leaseStartDate?.toIso8601String(),
      'leaseEndDate': instance.leaseEndDate?.toIso8601String(),
      'rentDueDay': instance.rentDueDay,
      'parkingSpaces': instance.parkingSpaces,
      'amenities': instance.amenities,
      'description': instance.description,
      'notes': instance.notes,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$FurnishingStatusEnumMap = {
  FurnishingStatus.unfurnished: 'unfurnished',
  FurnishingStatus.partiallyFurnished: 'partiallyFurnished',
  FurnishingStatus.fullyFurnished: 'fullyFurnished',
};

const _$ApartmentStatusEnumMap = {
  ApartmentStatus.vacant: 'vacant',
  ApartmentStatus.occupied: 'occupied',
  ApartmentStatus.maintenance: 'maintenance',
  ApartmentStatus.reserved: 'reserved',
};
