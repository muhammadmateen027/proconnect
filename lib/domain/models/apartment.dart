import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proconnect/domain/models/room.dart';

part 'apartment.freezed.dart';
part 'apartment.g.dart';

/// Status of an apartment
enum ApartmentStatus {
  vacant, // Ready to move in, no tenant
  occupied, // Currently has a tenant
  maintenance, // Under maintenance/renovation
  reserved, // Reserved for a tenant (move-in pending)
}

/// Furnishing status of an apartment
enum FurnishingStatus {
  unfurnished,
  partiallyFurnished,
  fullyFurnished,
}

/// Represents an apartment/unit in a condominium
@freezed
class Apartment with _$Apartment {
  const factory Apartment({
    required String id,
    required String condominiumId,
    required String agencyId,
    required String floorId,
    required String apartmentNumber, // e.g., "A-12-03", "101", "2B"
    // Ownership
    String? ownerId, // Owner who manages this apartment
    String? ownerName,
    String? ownerEmail,
    String? ownerPhone,

    // Tenant Information (managed by owner)
    String? tenantId,
    String? tenantName,
    String? tenantEmail,
    String? tenantPhone,

    // Apartment Details
    required double totalSizeSquareFeet,
    @Default([]) List<Room> rooms,
    @Default(0) int totalBedrooms,
    @Default(0) int totalBathrooms,
    @Default(FurnishingStatus.unfurnished) FurnishingStatus furnishing,

    // Status and Availability
    @Default(ApartmentStatus.vacant) ApartmentStatus status,
    DateTime? vacantFrom, // When apartment became/will become vacant
    DateTime? availableFrom, // When apartment is ready to move in
    // Rental Information
    double? monthlyRent,
    double? securityDeposit,
    @Default([]) List<String> utilitiesIncluded,

    // Lease Information
    DateTime? leaseStartDate,
    DateTime? leaseEndDate,
    int? rentDueDay, // Day of month rent is due (1-31)
    // Parking
    @Default([]) List<String> parkingSpaces, // Assigned parking space numbers
    // Additional Features
    @Default([]) List<String> amenities, // Apartment-specific amenities
    String? description,
    String? notes,

    // Metadata
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Apartment;

  const Apartment._();

  factory Apartment.fromJson(Map<String, dynamic> json) =>
      _$ApartmentFromJson(json);

  /// Check if apartment is vacant
  bool get isVacant => status == ApartmentStatus.vacant;

  /// Check if apartment has an owner assigned
  bool get hasOwner => ownerId != null && ownerId!.isNotEmpty;

  /// Check if apartment has a tenant
  bool get hasTenant => tenantId != null && tenantId!.isNotEmpty;

  /// Check if apartment is available for rent
  bool get isAvailableForRent {
    if (!isVacant) return false;
    if (availableFrom == null) return true;
    return DateTime.now().isAfter(availableFrom!);
  }

  /// Get total number of rooms
  int get totalRooms => rooms.length;

  /// Get rooms by type
  List<Room> getRoomsByType(RoomType type) {
    return rooms.where((room) => room.type == type).toList();
  }
}
