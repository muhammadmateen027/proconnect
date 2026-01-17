# Data Layer Guide

## Overview
The `lib/data/` directory contains the implementation of repositories and data sources. This layer handles all data operations including Firebase, API calls, and local storage.

## Architecture

```
Domain Layer (Interfaces)
        ↓
Data Layer (Implementations)
        ↓
External Data Sources (Firebase, API, etc.)
```

## Directory Structure

```
lib/data/
├── auth/
│   ├── datasource/
│   │   └── auth_remote_data_source.dart
│   └── repository/
│       └── auth_repository_impl.dart
├── condo/
│   ├── datasource/
│   │   └── condo_remote_data_source.dart
│   └── repository/
│       └── condo_repository_impl.dart
└── [entity]/
    ├── datasource/
    │   └── [entity]_remote_data_source.dart
    └── repository/
        └── [entity]_repository_impl.dart
```

---

## 1. Data Sources (`datasource/`)

**Purpose:** Direct interaction with external data sources (Firebase, REST API, local DB).

### Structure

```dart
// Interface
abstract class CondoRemoteDataSource {
  Future<List<Condo>> getCondos();
  Future<Condo> createCondo({
    required String name,
    required String address,
    // ... other parameters
  });
  Future<void> updateCondo(Condo condo);
  Future<void> deleteCondo(String id);
}

// Implementation
class CondoRemoteDataSourceImpl implements CondoRemoteDataSource {
  final FirebaseFirestore _firestore;

  CondoRemoteDataSourceImpl(this._firestore);

  @override
  Future<List<Condo>> getCondos() async {
    try {
      final snapshot = await _firestore
          .collection('condominiums')
          .get();

      return snapshot.docs
          .map((doc) => Condo.fromJson({
                'id': doc.id,
                ...doc.data(),
              }))
          .toList();
    } catch (e) {
      throw Exception('Failed to load condos: $e');
    }
  }

  @override
  Future<Condo> createCondo({
    required String name,
    required String address,
    int? totalUnits,
    // ... other parameters
  }) async {
    try {
      final docRef = _firestore.collection('condominiums').doc();

      final condo = Condo(
        id: docRef.id,
        name: name,
        address: address,
        totalUnits: totalUnits,
        // ... other fields
      );

      await docRef.set(condo.toJson());
      return condo;
    } catch (e) {
      throw Exception('Failed to create condo: $e');
    }
  }

  @override
  Future<void> updateCondo(Condo condo) async {
    try {
      await _firestore
          .collection('condominiums')
          .doc(condo.id)
          .update(condo.toJson());
    } catch (e) {
      throw Exception('Failed to update condo: $e');
    }
  }

  @override
  Future<void> deleteCondo(String id) async {
    try {
      await _firestore
          .collection('condominiums')
          .doc(id)
          .delete();
    } catch (e) {
      throw Exception('Failed to delete condo: $e');
    }
  }
}
```

### Best Practices

**✅ DO:**
- Define interface and implementation
- Handle all errors with try-catch
- Throw descriptive exceptions
- Use domain entities (not DTOs)
- Transform data to/from JSON
- Add timeout handling for network calls
- Log errors for debugging

**❌ DON'T:**
- Expose Firebase models directly
- Put business logic here
- Return null (use exceptions)
- Forget error handling
- Hardcode collection names

---

## 2. Repositories (`repository/`)

**Purpose:** Implement repository interfaces from domain layer. Act as a bridge between data sources and use cases.

### Structure

```dart
// Domain interface (in lib/domain/)
abstract class CondoRepository {
  Future<List<Condo>> getCondos();
  Future<Condo> createCondo({
    required String name,
    required String address,
    int? totalUnits,
    // ... other parameters
  });
  Future<void> updateCondo(Condo condo);
  Future<void> deleteCondo(String id);
}

// Data implementation (in lib/data/)
class CondoRepositoryImpl implements CondoRepository {
  final CondoRemoteDataSource _remoteDataSource;

  CondoRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<Condo>> getCondos() async {
    return await _remoteDataSource.getCondos();
  }

  @override
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
  }) async {
    return await _remoteDataSource.createCondo(
      name: name,
      address: address,
      totalUnits: totalUnits,
      totalFloors: totalFloors,
      yearBuilt: yearBuilt,
      description: description,
      contactEmail: contactEmail,
      contactPhone: contactPhone,
      amenities: amenities,
    );
  }

  @override
  Future<void> updateCondo(Condo condo) async {
    await _remoteDataSource.updateCondo(condo);
  }

  @override
  Future<void> deleteCondo(String id) async {
    await _remoteDataSource.deleteCondo(id);
  }
}
```

### Best Practices

**✅ DO:**
- Implement domain repository interface
- Delegate to data sources
- Handle data transformation if needed
- Combine multiple data sources if necessary
- Add caching logic here (if needed)
- Handle offline scenarios

**❌ DON'T:**
- Put business logic here
- Directly access Firebase/API
- Return different types than interface
- Skip error propagation

---

## 3. Multi-Tenancy Pattern

### Filtering by Tenant

```dart
class CondoRemoteDataSourceImpl implements CondoRemoteDataSource {
  final FirebaseFirestore _firestore;
  final String _currentUserId;

  CondoRemoteDataSourceImpl(this._firestore, this._currentUserId);

  @override
  Future<List<Condo>> getCondos() async {
    // Get current user's agency/condo ID
    final userDoc = await _firestore
        .collection('users')
        .doc(_currentUserId)
        .get();

    final agencyId = userDoc.data()?['agencyId'] as String?;
    final condoId = userDoc.data()?['condominiumId'] as String?;

    // Filter by tenant
    Query query = _firestore.collection('condominiums');

    if (agencyId != null) {
      query = query.where('agencyId', isEqualTo: agencyId);
    }

    if (condoId != null) {
      query = query.where('id', isEqualTo: condoId);
    }

    final snapshot = await query.get();

    return snapshot.docs
        .map((doc) => Condo.fromJson({
              'id': doc.id,
              ...doc.data() as Map<String, dynamic>,
            }))
        .toList();
  }

  @override
  Future<Condo> createCondo({
    required String name,
    required String address,
    // ... other parameters
  }) async {
    // Get current user's agency ID
    final userDoc = await _firestore
        .collection('users')
        .doc(_currentUserId)
        .get();

    final agencyId = userDoc.data()?['agencyId'] as String;

    final docRef = _firestore.collection('condominiums').doc();

    final condo = Condo(
      id: docRef.id,
      name: name,
      address: address,
      // ... other fields
    );

    // Add tenant fields
    await docRef.set({
      ...condo.toJson(),
      'agencyId': agencyId,
      'createdBy': _currentUserId,
      'createdAt': FieldValue.serverTimestamp(),
    });

    return condo;
  }
}
```

**✅ DO:**
- Always filter by `agencyId` and/or `condominiumId`
- Add tenant fields on create
- Validate tenant access
- Use Firestore security rules

**❌ DON'T:**
- Skip tenant filtering
- Allow cross-tenant data access
- Trust client-side filtering only

---

## 4. Error Handling

### Custom Exceptions

```dart
class DataException implements Exception {
  final String message;
  final String? code;

  DataException(this.message, [this.code]);

  @override
  String toString() => 'DataException: $message${code != null ? ' ($code)' : ''}';
}

class NetworkException extends DataException {
  NetworkException(String message) : super(message, 'NETWORK_ERROR');
}

class AuthException extends DataException {
  AuthException(String message) : super(message, 'AUTH_ERROR');
}
```

### Usage

```dart
@override
Future<List<Condo>> getCondos() async {
  try {
    final snapshot = await _firestore
        .collection('condominiums')
        .get()
        .timeout(const Duration(seconds: 30));

    return snapshot.docs
        .map((doc) => Condo.fromJson({
              'id': doc.id,
              ...doc.data(),
            }))
        .toList();
  } on FirebaseException catch (e) {
    throw DataException('Firebase error: ${e.message}', e.code);
  } on TimeoutException {
    throw NetworkException('Request timed out');
  } catch (e) {
    throw DataException('Failed to load condos: $e');
  }
}
```

---

## 5. Dependency Registration

### In `dependency_injector.dart`

```dart
void setup() {
  final firestore = FirebaseFirestore.instance;

  // Register data sources
  _container.registerSingleton(
    (c) => CondoRemoteDataSourceImpl(firestore),
  );

  // Register repositories
  _container.registerSingleton<CondoRepository>(
    (c) => CondoRepositoryImpl(c.resolve<CondoRemoteDataSource>()),
  );

  // Register use cases
  _container.registerFactory(
    (c) => CreateCondoUseCase(c.resolve<CondoRepository>()),
  );
}
```

---

## 6. Testing Data Layer

### Mock Data Source

```dart
class MockCondoRemoteDataSource implements CondoRemoteDataSource {
  final List<Condo> _condos = [];

  @override
  Future<List<Condo>> getCondos() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return List.from(_condos);
  }

  @override
  Future<Condo> createCondo({
    required String name,
    required String address,
    // ... other parameters
  }) async {
    final condo = Condo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      address: address,
      // ... other fields
    );

    _condos.add(condo);
    return condo;
  }

  // ... other methods
}
```

---

## Summary

### Data Layer Responsibilities:
- ✅ Implement repository interfaces
- ✅ Handle data source operations (Firebase, API)
- ✅ Transform data (JSON ↔ Entity)
- ✅ Handle errors and exceptions
- ✅ Implement multi-tenancy filtering
- ✅ Manage caching (if needed)

### Remember:
- Data layer implements domain interfaces
- Always handle errors
- Filter by tenant (agencyId, condominiumId)
- Use dependency injection
- Keep business logic in domain layer
- Test with mocks

**See Also:**
- `.agent/DOMAIN_LAYER_GUIDE.md` - For repository interfaces
- `.agent/PROJECT_STRUCTURE.md` - For overall architecture
