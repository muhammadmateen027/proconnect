# Pages (Features) Layer Guide

## Overview
The `lib/pages/` directory contains all feature modules following a feature-first architecture. Each feature is self-contained with its own BLoC, views, and widgets.

## Feature-First Architecture

**Principle:** Group code by feature, not by type.

**✅ Good (Feature-First):**
```
pages/
├── condo_management/
│   ├── bloc/
│   ├── view/
│   └── widgets/
└── user_management/
    ├── bloc/
    ├── view/
    └── widgets/
```

**❌ Bad (Layer-First):**
```
blocs/
├── condo_management_bloc.dart
└── user_management_bloc.dart
views/
├── condo_management_page.dart
└── user_management_page.dart
```

## Directory Structure

```
lib/pages/
├── agency_admin/            # Agency admin features
├── auth/                    # Authentication
│   ├── bloc/
│   │   ├── auth_bloc.dart
│   │   ├── auth_event.dart
│   │   └── auth_state.dart
│   └── view/
│       ├── login_screen.dart
│       └── registration_screen.dart
├── condo_management/        # Condo CRUD
│   ├── bloc/
│   ├── view/
│   └── widgets/
├── guard/                   # Guard features
├── owner/                   # Owner features
├── settings/                # Settings
├── super_admin/             # Super admin features
└── tenant/                  # Tenant features
```

---

## 1. Feature Structure

Each feature MUST follow this structure:

```
[feature_name]/
├── bloc/                    # State management
│   ├── [feature]_bloc.dart
│   ├── [feature]_event.dart
│   └── [feature]_state.dart
├── view/                    # Screens/Pages
│   ├── [feature]_page.dart
│   └── [sub_page].dart
└── widgets/                 # Feature-specific widgets
    ├── [widget_1].dart
    └── [widget_2].dart
```

---

## 2. BLoC Layer (`bloc/`)

**Purpose:** State management for the feature using BLoC pattern.

### Event (`[feature]_event.dart`)

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proconnect/domain/models/condo.dart';

part 'condo_management_event.freezed.dart';

@freezed
class CondoManagementEvent with _$CondoManagementEvent {
  const factory CondoManagementEvent.loadCondos() = LoadCondos;
  
  const factory CondoManagementEvent.createCondo({
    required String name,
    required String address,
    int? totalUnits,
    int? totalFloors,
    int? yearBuilt,
    String? description,
    String? contactEmail,
    String? contactPhone,
    @Default([]) List<String> amenities,
  }) = CreateCondo;
  
  const factory CondoManagementEvent.updateCondo({
    required Condo condo,
  }) = UpdateCondo;
  
  const factory CondoManagementEvent.deleteCondo(String id) = DeleteCondo;
}
```

### State (`[feature]_state.dart`)

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proconnect/domain/models/condo.dart';

part 'condo_management_state.freezed.dart';

@freezed
class CondoManagementState with _$CondoManagementState {
  const factory CondoManagementState.initial() = CondoManagementInitial;
  
  const factory CondoManagementState.loading() = CondoManagementLoading;
  
  const factory CondoManagementState.loaded(List<Condo> condos) = CondoManagementLoaded;
  
  const factory CondoManagementState.failure(String message) = CondoManagementFailure;
}
```

### BLoC (`[feature]_bloc.dart`)

```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proconnect/domain/admin/usecase/create_condo_use_case.dart';
import 'package:proconnect/domain/condo/repository/condo_repository.dart';
import 'package:proconnect/pages/condo_management/bloc/condo_management_event.dart';
import 'package:proconnect/pages/condo_management/bloc/condo_management_state.dart';

class CondoManagementBloc extends Bloc<CondoManagementEvent, CondoManagementState> {
  final CondoRepository _repository;
  final CreateCondoUseCase _createCondoUseCase;

  CondoManagementBloc(
    this._repository,
    this._createCondoUseCase,
  ) : super(const CondoManagementState.initial()) {
    on<LoadCondos>(_onLoadCondos);
    on<CreateCondo>(_onCreateCondo);
    on<UpdateCondo>(_onUpdateCondo);
    on<DeleteCondo>(_onDeleteCondo);
  }

  Future<void> _onLoadCondos(
    LoadCondos event,
    Emitter<CondoManagementState> emit,
  ) async {
    emit(const CondoManagementState.loading());
    
    try {
      final condos = await _repository.getCondos();
      emit(CondoManagementState.loaded(condos));
    } catch (e) {
      emit(CondoManagementState.failure(e.toString()));
    }
  }

  Future<void> _onCreateCondo(
    CreateCondo event,
    Emitter<CondoManagementState> emit,
  ) async {
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
      
      // Reload condos
      add(const CondoManagementEvent.loadCondos());
    } catch (e) {
      emit(CondoManagementState.failure(e.toString()));
    }
  }

  // ... other event handlers
}
```

### Best Practices

**✅ DO:**
- Use Freezed for events and states
- One BLoC per feature
- Inject use cases via constructor
- Handle all states (initial, loading, loaded, failure)
- Emit loading state before async operations
- Use descriptive event and state names
- Register BLoC in dependency injector

**❌ DON'T:**
- Share BLoCs between features
- Put UI logic in BLoC
- Access repositories directly (use use cases)
- Forget error handling
- Create god BLoCs (too many responsibilities)

---

## 3. View Layer (`view/`)

**Purpose:** UI screens and pages.

### Page Structure

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:proconnect/app/app_routes.dart';
import 'package:proconnect/core/theme/app_spacing.dart';
import 'package:proconnect/core/widgets/app_button.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/condo_management/bloc/condo_management_bloc.dart';
import 'package:proconnect/pages/condo_management/widgets/condo_card_widget.dart';

class CondoManagementPage extends StatefulWidget {
  const CondoManagementPage({super.key});

  @override
  State<CondoManagementPage> createState() => _CondoManagementPageState();
}

class _CondoManagementPageState extends State<CondoManagementPage> {
  @override
  void initState() {
    super.initState();
    _loadCondos();
  }

  void _loadCondos() {
    context.read<CondoManagementBloc>().add(
          const CondoManagementEvent.loadCondos(),
        );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.condoManagement),
      ),
      body: BlocConsumer<CondoManagementBloc, CondoManagementState>(
        listener: (context, state) {
          // Handle side effects
          if (state is CondoManagementFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('Initial')),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (condos) => _buildLoadedState(condos),
            failure: (message) => _buildErrorState(message),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await context.push(AppRoutes.createCondo);
          if (result == true && mounted) {
            _loadCondos();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildLoadedState(List<Condo> condos) {
    if (condos.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.p16),
      itemCount: condos.length,
      itemBuilder: (context, index) {
        return CondoCardWidget(
          condo: condos[index],
          onEdit: () => _navigateToEdit(condos[index]),
          onDelete: () => _handleDelete(condos[index]),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    final l10n = context.l10n;
    return Center(
      child: Text(l10n.noCondosFound),
    );
  }

  Widget _buildErrorState(String message) {
    final l10n = context.l10n;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          AppSpacing.gapH16,
          AppButton(
            onPressed: _loadCondos,
            label: l10n.retry,
            icon: Icons.refresh,
          ),
        ],
      ),
    );
  }

  void _navigateToEdit(Condo condo) async {
    final result = await context.push(
      AppRoutes.editCondo,
      extra: condo,
    );
    if (result == true && mounted) {
      _loadCondos();
    }
  }

  void _handleDelete(Condo condo) {
    context.read<CondoManagementBloc>().add(
          CondoManagementEvent.deleteCondo(condo.id),
        );
  }
}
```

### Best Practices

**✅ DO:**
- Use `BlocConsumer` for both listening and building
- Use `BlocListener` for side effects (navigation, snackbars)
- Use `BlocBuilder` for UI updates only
- Handle all states in `state.when()`
- Extract complex widgets to separate files
- Use localization for all text
- Check `mounted` before navigation
- Use `AppButton` for buttons
- Use `AppSpacing` for spacing

**❌ DON'T:**
- Put business logic in widgets
- Hardcode strings
- Hardcode colors
- Create widgets > 300 lines
- Forget to handle error states
- Skip loading states

---

## 4. Widgets Layer (`widgets/`)

**Purpose:** Feature-specific reusable widgets.

### Widget Structure

```dart
import 'package:flutter/material.dart';
import 'package:proconnect/core/theme/app_spacing.dart';
import 'package:proconnect/domain/models/condo.dart';
import 'package:proconnect/l10n/l10n.dart';

class CondoCardWidget extends StatelessWidget {
  const CondoCardWidget({
    required this.condo,
    required this.onEdit,
    required this.onDelete,
    super.key,
  });

  final Condo condo;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.p12),
      child: ListTile(
        leading: Icon(
          Icons.apartment,
          color: theme.colorScheme.primary,
        ),
        title: Text(condo.name),
        subtitle: Text(condo.address),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: onEdit,
              tooltip: l10n.edit,
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: onDelete,
              tooltip: l10n.delete,
            ),
          ],
        ),
        onTap: onEdit,
      ),
    );
  }
}
```

### When to Extract Widgets

**Extract when:**
1. Widget is used multiple times in the feature
2. File exceeds 300 lines
3. Widget has clear, single responsibility
4. Improves readability

**Don't extract when:**
1. Widget is used only once
2. Extraction doesn't improve readability
3. Widget is too simple (e.g., `SizedBox`)

---

## 5. Form Pages Pattern

### Create/Edit Page

```dart
class CreateEditCondoPage extends StatefulWidget {
  const CreateEditCondoPage({
    super.key,
    this.condo,
  });

  final Condo? condo;

  bool get isEditing => condo != null;

  @override
  State<CreateEditCondoPage> createState() => _CreateEditCondoPageState();
}

class _CreateEditCondoPageState extends State<CreateEditCondoPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _addressController;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.condo?.name);
    _addressController = TextEditingController(text: widget.condo?.address);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    final bloc = context.read<CondoManagementBloc>();

    if (widget.isEditing) {
      bloc.add(CondoManagementEvent.updateCondo(
        condo: widget.condo!.copyWith(
          name: _nameController.text.trim(),
          address: _addressController.text.trim(),
        ),
      ));
    } else {
      bloc.add(CondoManagementEvent.createCondo(
        name: _nameController.text.trim(),
        address: _addressController.text.trim(),
      ));
    }

    await Future.delayed(const Duration(milliseconds: 500));

    if (mounted) {
      setState(() {
        _isSubmitting = false;
      });
      context.pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEditing ? l10n.editCondo : l10n.addCondo),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.p16),
          children: [
            // Use extracted widget sections
            BasicInformationSection(
              nameController: _nameController,
              addressController: _addressController,
            ),
            AppSpacing.gapH24,
            AppButton(
              onPressed: _handleSubmit,
              label: widget.isEditing ? l10n.saveChanges : l10n.createCondo,
              icon: widget.isEditing ? Icons.save : Icons.add,
              isLoading: _isSubmitting,
              expand: true,
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## Summary

### Pages Layer Responsibilities:
- ✅ Feature-specific UI (screens, pages)
- ✅ BLoC state management
- ✅ Feature-specific widgets
- ✅ User interactions
- ✅ Navigation

### Remember:
- One BLoC per feature
- Extract widgets when file > 300 lines
- Use `BlocConsumer` for side effects + UI
- Always handle all states
- Use localization for all text
- Use core widgets (AppButton, etc.)
- Check `mounted` before navigation
- Validate forms properly

**See Also:**
- `.agent/CORE_GUIDE.md` - For reusable widgets
- `.agent/DOMAIN_LAYER_GUIDE.md` - For use cases
- `.agent/ROUTING_GUIDE.md` - For navigation
- `.agent/APP_BUTTON_GUIDE.md` - For button usage
