# Domain Layer Guide

## Overview
The `lib/domain/` directory contains the business logic layer. This layer is independent of frameworks, UI, and data sources. It defines entities, repository interfaces, and use cases.

## Architecture Principle

**Domain layer should:**
- ✅ Be framework-independent (no Flutter imports)
- ✅ Define business rules
- ✅ Define repository interfaces
- ✅ Contain use cases (business logic)
- ✅ Use domain entities (Freezed models)

**Domain layer should NOT:**
- ❌ Import Flutter widgets
- ❌ Import data layer implementations
- ❌ Contain UI logic
- ❌ Access external data sources directly

## Directory Structure

```
lib/domain/
├── admin/                    # Admin domain logic
│   └── usecase/
│       ├── create_condo_use_case.dart
│       ├── create_user_use_case.dart
│       └── ...
├── auth/                     # Auth domain logic
│   ├── repository/
│   │   └── auth_repository.dart
│   └── usecase/
│       ├── login_use_case.dart
│       ├── logout_use_case.dart
│       └── register_use_case.dart
├── condo/                    # Condo domain logic
│   └── repository/
│       └── condo_repository.dart
├── models/                   # Domain entities
│   ├── condo.dart
│   ├── unit.dart
│   ├── user.dart
│   └── ...
└── [entity]/
    ├── repository/
    │   └── [entity]_repository.dart
    └── usecase/
        └── ...
```

---

## 1. Models (`domain/models/`)

**Purpose:** Define domain entities using Freezed for immutability and JSON serialization.

### Entity Structure

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'condo.freezed.dart';
part 'condo.g.dart';

@freezed
class Condo with _$Condo {
  const factory Condo({
    required String id,
    required String name,
    required String address,
    int? totalUnits,
    int? totalFloors,
    int? yearBuilt,
    String? description,
    String? contactEmail,
    String? contactPhone,
    @Default([]) List<String> amenities,
  }) = _Condo;

  factory Condo.fromJson(Map<String, dynamic> json) => _$CondoFromJson(json);
}
```

### Best Practices

**✅ DO:**
- Use `@freezed` annotation
- Make required fields non-nullable
- Make optional fields nullable
- Use `@Default()` for default values
- Generate `fromJson` and `toJson`
- Use descriptive field names
- Add documentation comments

**❌ DON'T:**
- Use mutable classes
- Skip JSON serialization
- Use primitive obsession (wrap primitives in value objects if needed)
- Add business logic to entities

### Running Code Generation

```bash
# Already running in your project
dart run build_runner watch --delete-conflicting-outputs
```

---

## 2. Repository Interfaces (`domain/[entity]/repository/`)

**Purpose:** Define contracts for data operations. Implemented by data layer.

### Repository Structure

```dart
import 'package:proconnect/domain/models/condo.dart';

abstract class CondoRepository {
  /// Get all condominiums
  Future<List<Condo>> getCondos();

  /// Create a new condominium
  Future<Condo> createCondo({
    required String name,
    required String address,
    int? totalUnits,
    int? totalFloors,
    int? yearBuilt,
    String? description,
    String? contactEmail,
    String? contactPhone,
    List<String> amenities = const [],
  });

  /// Update an existing condominium
  Future<void> updateCondo(Condo condo);

  /// Delete a condominium by ID
  Future<void> deleteCondo(String id);
}
```

### Best Practices

**✅ DO:**
- Define abstract classes
- Use domain entities as parameters/return types
- Add documentation comments
- Use descriptive method names
- Return `Future` for async operations
- Define all CRUD operations

**❌ DON'T:**
- Implement logic here (only interfaces)
- Use data layer types
- Return null (use exceptions or Optional)
- Add UI-specific methods

---

## 3. Use Cases (`domain/[entity]/usecase/`)

**Purpose:** Encapsulate business logic for specific operations.

### Use Case Structure

```dart
import 'package:proconnect/domain/condo/repository/condo_repository.dart';
import 'package:proconnect/domain/models/condo.dart';

class CreateCondoUseCase {
  final CondoRepository _repository;

  CreateCondoUseCase(this._repository);

  Future<Condo> call({
    required String name,
    required String address,
    int? totalUnits,
    int? totalFloors,
    int? yearBuilt,
    String? description,
    String? contactEmail,
    String? contactPhone,
    List<String> amenities = const [],
  }) async {
    // Business logic/validation
    if (name.trim().isEmpty) {
      throw ArgumentError('Name cannot be empty');
    }

    if (address.trim().isEmpty) {
      throw ArgumentError('Address cannot be empty');
    }

    // Call repository
    return await _repository.createCondo(
      name: name.trim(),
      address: address.trim(),
      totalUnits: totalUnits,
      totalFloors: totalFloors,
      yearBuilt: yearBuilt,
      description: description?.trim(),
      contactEmail: contactEmail?.trim(),
      contactPhone: contactPhone?.trim(),
      amenities: amenities,
    );
  }
}
```

### Complex Use Case Example

```dart
class GetCondosForUserUseCase {
  final CondoRepository _condoRepository;
  final AuthRepository _authRepository;

  GetCondosForUserUseCase(this._condoRepository, this._authRepository);

  Future<List<Condo>> call() async {
    // Get current user
    final user = await _authRepository.getCurrentUser();

    if (user == null) {
      throw Exception('User not authenticated');
    }

    // Business logic based on user role
    if (user.role == 'super_admin') {
      // Super admin sees all condos
      return await _condoRepository.getCondos();
    } else if (user.role == 'agency_admin') {
      // Agency admin sees only their agency's condos
      return await _condoRepository.getCondosByAgency(user.agencyId!);
    } else {
      // Regular users see only their condo
      final condo = await _condoRepository.getCondoById(user.condominiumId!);
      return [condo];
    }
  }
}
```

### Best Practices

**✅ DO:**
- One use case per business operation
- Name use cases with action verbs (Create, Update, Delete, Get)
- Add business logic and validation
- Use `call()` method for execution
- Inject repositories via constructor
- Handle errors appropriately
- Add documentation

**❌ DON'T:**
- Put UI logic in use cases
- Access data sources directly
- Create god use cases (too many responsibilities)
- Skip validation
- Return UI-specific types

---

## 4. Use Case Patterns

### Pattern 1: Simple CRUD

```dart
class DeleteCondoUseCase {
  final CondoRepository _repository;

  DeleteCondoUseCase(this._repository);

  Future<void> call(String id) async {
    if (id.isEmpty) {
      throw ArgumentError('ID cannot be empty');
    }

    await _repository.deleteCondo(id);
  }
}
```

### Pattern 2: With Validation

```dart
class UpdateCondoUseCase {
  final CondoRepository _repository;

  UpdateCondoUseCase(this._repository);

  Future<void> call(Condo condo) async {
    // Validate
    if (condo.name.trim().isEmpty) {
      throw ArgumentError('Name cannot be empty');
    }

    if (condo.address.trim().isEmpty) {
      throw ArgumentError('Address cannot be empty');
    }

    if (condo.yearBuilt != null) {
      final currentYear = DateTime.now().year;
      if (condo.yearBuilt! < 1900 || condo.yearBuilt! > currentYear + 5) {
        throw ArgumentError('Invalid year');
      }
    }

    // Update
    await _repository.updateCondo(condo);
  }
}
```

### Pattern 3: Combining Multiple Repositories

```dart
class CreateCondoWithUnitsUseCase {
  final CondoRepository _condoRepository;
  final UnitRepository _unitRepository;

  CreateCondoWithUnitsUseCase(
    this._condoRepository,
    this._unitRepository,
  );

  Future<Condo> call({
    required String name,
    required String address,
    required int numberOfUnits,
  }) async {
    // Create condo
    final condo = await _condoRepository.createCondo(
      name: name,
      address: address,
      totalUnits: numberOfUnits,
    );

    // Create units
    for (int i = 1; i <= numberOfUnits; i++) {
      await _unitRepository.createUnit(
        condoId: condo.id,
        unitNumber: i.toString(),
      );
    }

    return condo;
  }
}
```

### Pattern 4: With Business Rules

```dart
class AssignUnitToOwnerUseCase {
  final UnitRepository _unitRepository;
  final UserRepository _userRepository;

  AssignUnitToOwnerUseCase(this._unitRepository, this._userRepository);

  Future<void> call({
    required String unitId,
    required String ownerId,
  }) async {
    // Get unit
    final unit = await _unitRepository.getUnitById(unitId);

    // Business rule: Unit must be vacant
    if (unit.ownerId != null) {
      throw Exception('Unit is already assigned');
    }

    // Get owner
    final owner = await _userRepository.getUserById(ownerId);

    // Business rule: User must have owner role
    if (owner.role != 'owner') {
      throw Exception('User must have owner role');
    }

    // Business rule: Owner must belong to same condo
    if (owner.condominiumId != unit.condominiumId) {
      throw Exception('Owner must belong to the same condominium');
    }

    // Assign
    await _unitRepository.assignOwner(unitId, ownerId);
  }
}
```

---

## 5. Dependency Registration

### In `dependency_injector.dart`

```dart
void setup() {
  // Register repositories (from data layer)
  _container.registerSingleton<CondoRepository>(
    (c) => CondoRepositoryImpl(c.resolve()),
  );

  // Register use cases (from domain layer)
  _container.registerFactory(
    (c) => CreateCondoUseCase(c.resolve<CondoRepository>()),
  );

  _container.registerFactory(
    (c) => UpdateCondoUseCase(c.resolve<CondoRepository>()),
  );

  _container.registerFactory(
    (c) => DeleteCondoUseCase(c.resolve<CondoRepository>()),
  );

  _container.registerFactory(
    (c) => GetCondosForUserUseCase(
      c.resolve<CondoRepository>(),
      c.resolve<AuthRepository>(),
    ),
  );
}
```

---

## 6. Testing Domain Layer

### Testing Entities

```dart
void main() {
  group('Condo', () {
    test('should create condo with required fields', () {
      final condo = Condo(
        id: '1',
        name: 'Test Condo',
        address: 'Test Address',
      );

      expect(condo.id, '1');
      expect(condo.name, 'Test Condo');
      expect(condo.address, 'Test Address');
      expect(condo.amenities, []);
    });

    test('should serialize to JSON', () {
      final condo = Condo(
        id: '1',
        name: 'Test Condo',
        address: 'Test Address',
      );

      final json = condo.toJson();

      expect(json['id'], '1');
      expect(json['name'], 'Test Condo');
    });
  });
}
```

### Testing Use Cases

```dart
class MockCondoRepository extends Mock implements CondoRepository {}

void main() {
  late CreateCondoUseCase useCase;
  late MockCondoRepository mockRepository;

  setUp(() {
    mockRepository = MockCondoRepository();
    useCase = CreateCondoUseCase(mockRepository);
  });

  group('CreateCondoUseCase', () {
    test('should create condo successfully', () async {
      // Arrange
      final expectedCondo = Condo(
        id: '1',
        name: 'Test Condo',
        address: 'Test Address',
      );

      when(() => mockRepository.createCondo(
            name: any(named: 'name'),
            address: any(named: 'address'),
          )).thenAnswer((_) async => expectedCondo);

      // Act
      final result = await useCase(
        name: 'Test Condo',
        address: 'Test Address',
      );

      // Assert
      expect(result, expectedCondo);
      verify(() => mockRepository.createCondo(
            name: 'Test Condo',
            address: 'Test Address',
          )).called(1);
    });

    test('should throw error when name is empty', () async {
      // Act & Assert
      expect(
        () => useCase(name: '', address: 'Test Address'),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}
```

---

## Summary

### Domain Layer Responsibilities:
- ✅ Define domain entities (Freezed models)
- ✅ Define repository interfaces
- ✅ Implement business logic (use cases)
- ✅ Validate business rules
- ✅ Stay framework-independent

### Remember:
- Domain layer is the core of your application
- No Flutter imports
- No data layer imports
- Use cases contain business logic
- Entities are immutable (Freezed)
- Repositories are interfaces only
- Test domain logic thoroughly

**See Also:**
- `.agent/DATA_LAYER_GUIDE.md` - For repository implementations
- `.agent/PAGES_GUIDE.md` - For using use cases in BLoCs
- `.agent/PROJECT_STRUCTURE.md` - For overall architecture
