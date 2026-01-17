# Apartment Management Feature Implementation Plan

## Overview
This feature allows agency admins to manage floors and apartments within assigned condominiums, including owner assignment and rental management.

## Domain Models Created ✅

### 1. Floor Model (`lib/domain/models/floor.dart`)
- Floor number and name
- Condominium and agency association
- Total apartments count
- Floor-specific amenities
- Timestamps

### 2. Room Model (`lib/domain/models/room.dart`)
- Room type enum (bedroom, bathroom, kitchen, etc.)
- Size in square feet
- Features (window, balcony, attached bathroom)
- Custom name and description

### 3. Apartment Model (`lib/domain/models/apartment.dart`)
- Apartment number and location (floor, condominium)
- Owner information (one owner per apartment)
- Tenant information (managed by owner)
- Room details (list of rooms)
- Status (vacant, occupied, maintenance, reserved)
- Availability dates (vacantFrom, availableFrom)
- Rental information (rent, deposit, utilities)
- Lease information
- Parking spaces
- Helper methods for vacancy and availability checks

## Repository Interfaces Created ✅

### 1. FloorRepository (`lib/domain/repositories/floor_repository.dart`)
- CRUD operations for floors
- Get floors by condominium
- Get floors by agency

### 2. ApartmentRepository (`lib/domain/repositories/apartment_repository.dart`)
- CRUD operations for apartments
- Get apartments by floor/condominium/agency/owner
- Assign/remove owner
- Update apartment status
- Get vacant/available apartments

## Data Layer (To Be Created)

### 1. Floor Data Source
**File**: `lib/data/floor/datasource/floor_remote_data_source.dart`
- Firestore collection: `floors`
- Multi-tenant filtering by `condominiumId` and `agencyId`

### 2. Floor Repository Implementation
**File**: `lib/data/floor/repository/floor_repository_impl.dart`
- Implements FloorRepository interface
- Uses FloorRemoteDataSource

### 3. Apartment Data Source
**File**: `lib/data/apartment/datasource/apartment_remote_data_source.dart`
- Firestore collection: `apartments`
- Multi-tenant filtering
- Complex queries for status and availability

### 4. Apartment Repository Implementation
**File**: `lib/data/apartment/repository/apartment_repository_impl.dart`
- Implements ApartmentRepository interface
- Uses ApartmentRemoteDataSource

## BLoC Layer (To Be Created)

### 1. Floor BLoC
**Location**: `lib/pages/apartment_management/bloc/floor/`
- Events: LoadFloors, CreateFloor, UpdateFloor, DeleteFloor
- States: Initial, Loading, Success, Failure

### 2. Apartment BLoC
**Location**: `lib/pages/apartment_management/bloc/apartment/`
- Events: LoadApartments, CreateApartment, UpdateApartment, DeleteApartment, AssignOwner, UpdateStatus
- States: Initial, Loading, Success, Failure

## UI Layer (To Be Created)

### 1. Floor Management Page
**File**: `lib/pages/apartment_management/view/floor_management_page.dart`
- List all floors in a condominium
- Create new floor
- Edit/delete floor
- Navigate to apartments on floor

### 2. Floor Form Page
**File**: `lib/pages/apartment_management/view/floor_form_page.dart`
- Create/edit floor
- Form validation
- Floor number, name, amenities

### 3. Apartment Management Page
**File**: `lib/pages/apartment_management/view/apartment_management_page.dart`
- List all apartments (filterable by floor, status, owner)
- Create new apartment
- View apartment details
- Quick status updates

### 4. Apartment Form Page
**File**: `lib/pages/apartment_management/view/apartment_form_page.dart`
- Create/edit apartment
- Multi-step form:
  - Basic info (number, floor, size)
  - Rooms configuration
  - Rental details
  - Owner assignment
  - Availability settings

### 5. Apartment Detail Page
**File**: `lib/pages/apartment_management/view/apartment_detail_page.dart`
- View all apartment information
- Room breakdown
- Owner details
- Tenant details (if assigned)
- Status management
- Edit/delete actions

### 6. Owner Assignment Sheet
**File**: `lib/pages/apartment_management/widgets/owner_assignment_sheet.dart`
- Bottom sheet for assigning owner
- Search/select from existing owners
- Quick owner creation option

### 7. Room Configuration Widget
**File**: `lib/pages/apartment_management/widgets/room_configuration_widget.dart`
- Add/edit/remove rooms
- Room type selection
- Size input
- Features checkboxes

## Routing (To Be Added)

Add to `lib/app/app_routes.dart`:
```dart
static const String floorManagement = '/floor-management';
static const String createFloor = '/create-floor';
static const String editFloor = '/edit-floor';
static const String apartmentManagement = '/apartment-management';
static const String createApartment = '/create-apartment';
static const String editApartment = '/edit-apartment';
static const String apartmentDetail = '/apartment-detail';
```

## Localization Strings (To Be Added)

Add to `lib/l10n/arb/app_en.arb` and `app_es.arb`:
- Floor management labels
- Apartment management labels
- Room type labels
- Status labels
- Form labels and validation messages

## Dependency Injection (To Be Added)

Register in `lib/core/services/dependency_injector.dart`:
- FloorRemoteDataSource
- FloorRepository
- ApartmentRemoteDataSource
- ApartmentRepository
- FloorBloc
- ApartmentBloc

## Firestore Collections Structure

### floors
```
{
  id: string
  condominiumId: string
  agencyId: string
  floorNumber: number
  floorName: string?
  totalApartments: number?
  description: string?
  amenities: string[]
  createdAt: timestamp
  updatedAt: timestamp
}
```

### apartments
```
{
  id: string
  condominiumId: string
  agencyId: string
  floorId: string
  apartmentNumber: string
  
  ownerId: string?
  ownerName: string?
  ownerEmail: string?
  ownerPhone: string?
  
  tenantId: string?
  tenantName: string?
  tenantEmail: string?
  tenantPhone: string?
  
  totalSizeSquareFeet: number
  rooms: Room[]
  totalBedrooms: number
  totalBathrooms: number
  furnishing: string
  
  status: string
  vacantFrom: timestamp?
  availableFrom: timestamp?
  
  monthlyRent: number?
  securityDeposit: number?
  utilitiesIncluded: string[]
  
  leaseStartDate: timestamp?
  leaseEndDate: timestamp?
  rentDueDay: number?
  
  parkingSpaces: string[]
  amenities: string[]
  description: string?
  notes: string?
  
  createdAt: timestamp
  updatedAt: timestamp
}
```

## Implementation Priority

1. ✅ Domain models (Floor, Room, Apartment)
2. ✅ Repository interfaces
3. 🔄 Data layer (data sources + repository implementations)
4. 🔄 BLoC layer (Floor BLoC, Apartment BLoC)
5. 🔄 UI layer (pages and widgets)
6. 🔄 Routing configuration
7. 🔄 Localization strings
8. 🔄 Dependency injection setup

## Next Steps

Continue with data layer implementation, starting with Floor data source and repository.
