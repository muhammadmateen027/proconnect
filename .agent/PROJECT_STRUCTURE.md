# ProConnect Project Structure

## Overview
ProConnect follows a **Feature-First Clean Architecture** pattern with clear separation of concerns. This document provides a complete snapshot of the project structure and the purpose of each directory.

## Root Structure

```
proconnect/
├── .agent/                    # AI Agent documentation and guides
├── lib/                       # Main application code
│   ├── app/                   # App-level configuration
│   ├── core/                  # Shared utilities and components
│   ├── data/                  # Data layer (repositories, data sources)
│   ├── domain/                # Domain layer (entities, use cases, interfaces)
│   ├── l10n/                  # Localization files
│   └── pages/                 # Feature modules (UI layer)
├── test/                      # Test files
├── assets/                    # Static assets (images, fonts, etc.)
└── pubspec.yaml              # Dependencies and project configuration
```

## Detailed Directory Structure

### `.agent/` - AI Agent Documentation
**Purpose:** Documentation and guides for AI agents and developers.

```
.agent/
├── APP_BUTTON_GUIDE.md              # AppButton component usage guide
├── CONDO_MANAGEMENT_IMPLEMENTATION.md  # Condo feature implementation
├── ROUTING_GUIDE.md                 # Routing and navigation guide
├── CORE_GUIDE.md                    # Core utilities and components
├── DATA_LAYER_GUIDE.md              # Data layer patterns
├── DOMAIN_LAYER_GUIDE.md            # Domain layer patterns
└── PAGES_GUIDE.md                   # Feature pages structure
```

**✅ DO:**
- Keep all implementation guides here
- Update guides when making significant changes
- Reference these guides in code reviews

**❌ DON'T:**
- Put code files in this directory
- Leave guides outdated

---

### `lib/app/` - Application Configuration
**Purpose:** App-level setup, routing, and configuration.

```
lib/app/
├── app_routes.dart           # Route path constants
├── router.dart               # GoRouter configuration
└── view/
    ├── app.dart              # Root app widget
    └── home_screen_wrapper.dart  # Main navigation wrapper
```

**✅ DO:**
- Define all routes in `app_routes.dart`
- Configure GoRouter in `router.dart`
- Keep app-level configuration here

**❌ DON'T:**
- Put feature-specific code here
- Hardcode route paths

---

### `lib/core/` - Shared Core Components
**Purpose:** Reusable utilities, widgets, themes, and services used across the entire app.

```
lib/core/
├── config/                   # App configuration
├── services/                 # Dependency injection, etc.
│   └── dependency_injector.dart
├── theme/                    # Theme configuration
│   ├── app_colors.dart
│   ├── app_decorations.dart
│   ├── app_spacing.dart
│   ├── app_text_styles.dart
│   └── app_theme.dart
├── utils/                    # Utility functions
│   └── validators.dart       # Centralized validators
└── widgets/                  # Reusable widgets
    ├── app_button.dart       # Universal button component
    ├── auth_background.dart
    ├── auth_header.dart
    ├── custom_auth_button.dart
    ├── custom_text_field.dart
    └── unit_card.dart
```

**✅ DO:**
- Put reusable components here
- Use centralized validators
- Use AppButton for all buttons
- Follow theme constants

**❌ DON'T:**
- Put feature-specific widgets here
- Create inline validators
- Hardcode colors or spacing

**See:** `.agent/CORE_GUIDE.md` for detailed usage

---

### `lib/data/` - Data Layer
**Purpose:** Implementation of repositories and data sources (Firebase, API, local storage).

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
└── unit/
    ├── datasource/
    │   └── unit_remote_data_source.dart
    └── repository/
        └── unit_repository_impl.dart
```

**Structure per entity:**
- `datasource/` - Direct data access (Firestore, API)
- `repository/` - Repository implementations

**✅ DO:**
- Implement repository interfaces from domain layer
- Handle data transformation (DTO ↔ Entity)
- Manage Firebase/API calls
- Handle errors and exceptions

**❌ DON'T:**
- Put business logic here
- Expose Firebase models directly
- Skip error handling

**See:** `.agent/DATA_LAYER_GUIDE.md` for patterns

---

### `lib/domain/` - Domain Layer
**Purpose:** Business logic, entities, repository interfaces, and use cases.

```
lib/domain/
├── admin/                    # Admin-related domain logic
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
│       └── ...
├── condo/                    # Condo domain logic
│   └── repository/
│       └── condo_repository.dart
├── models/                   # Domain entities (Freezed)
│   ├── condo.dart
│   ├── unit.dart
│   ├── user.dart
│   └── ...
└── unit/                     # Unit domain logic
    ├── repository/
    │   └── unit_repository.dart
    └── usecase/
        └── ...
```

**✅ DO:**
- Define entities using Freezed
- Create repository interfaces
- Implement use cases for business logic
- Keep domain layer independent

**❌ DON'T:**
- Import Flutter widgets
- Import data layer implementations
- Put UI logic here

**See:** `.agent/DOMAIN_LAYER_GUIDE.md` for patterns

---

### `lib/l10n/` - Localization
**Purpose:** Internationalization and localization files.

```
lib/l10n/
├── arb/
│   ├── app_en.arb           # English translations
│   └── app_es.arb           # Spanish translations
└── l10n.dart                # Generated localization code
```

**✅ DO:**
- Add all strings to both `app_en.arb` and `app_es.arb`
- Use `context.l10n.keyName` for all UI text
- Run build_runner to regenerate

**❌ DON'T:**
- Hardcode strings in UI
- Forget to add Spanish translations

---

### `lib/pages/` - Feature Modules (UI Layer)
**Purpose:** Feature-specific UI, BLoCs, and widgets.

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
│   │   ├── condo_management_bloc.dart
│   │   ├── condo_management_event.dart
│   │   └── condo_management_state.dart
│   ├── view/
│   │   ├── condo_management_page.dart
│   │   └── create_edit_condo_page.dart
│   └── widgets/
│       ├── amenities_selection_section.dart
│       ├── basic_information_section.dart
│       ├── building_specifications_section.dart
│       ├── condo_card_widget.dart
│       ├── contact_information_section.dart
│       ├── description_section.dart
│       └── form_section_card.dart
├── guard/                   # Guard features
├── owner/                   # Owner features
├── settings/                # Settings
├── super_admin/             # Super admin features
│   ├── bloc/
│   ├── view/
│   └── widgets/
└── tenant/                  # Tenant features
```

**Feature Structure:**
- `bloc/` - BLoC for state management
- `view/` - Screen/page widgets
- `widgets/` - Feature-specific reusable widgets

**✅ DO:**
- Follow feature-first structure
- Create separate BLoC per feature
- Extract widgets when file > 300 lines
- Use widget classes, not functions

**❌ DON'T:**
- Share BLoCs between features
- Put business logic in widgets
- Create monolithic page files

**See:** `.agent/PAGES_GUIDE.md` for patterns

---

## File Naming Conventions

| Type | Convention | Example |
|------|------------|---------|
| Dart files | snake_case | `condo_management_page.dart` |
| Classes | PascalCase | `CondoManagementPage` |
| Variables | camelCase | `isLoading`, `condoList` |
| Constants | camelCase | `AppRoutes.createCondo` |
| Private | prefix `_` | `_handleSubmit` |

---

## Import Organization

Always organize imports in this order:

```dart
// 1. Dart SDK imports
import 'dart:async';

// 2. Flutter SDK imports
import 'package:flutter/material.dart';

// 3. Third-party package imports
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// 4. Local imports (grouped by layer)
import 'package:proconnect/core/theme/app_spacing.dart';
import 'package:proconnect/domain/models/condo.dart';
import 'package:proconnect/pages/condo_management/bloc/condo_management_bloc.dart';
```

---

## Quick Reference

### Where to put...

| What | Where |
|------|-------|
| Reusable button | `core/widgets/app_button.dart` |
| Validators | `core/utils/validators.dart` |
| Theme colors | `core/theme/app_colors.dart` |
| Route paths | `app/app_routes.dart` |
| Entity models | `domain/models/` |
| Repository interfaces | `domain/[entity]/repository/` |
| Use cases | `domain/[entity]/usecase/` |
| Repository implementations | `data/[entity]/repository/` |
| Data sources | `data/[entity]/datasource/` |
| Feature BLoC | `pages/[feature]/bloc/` |
| Feature screens | `pages/[feature]/view/` |
| Feature widgets | `pages/[feature]/widgets/` |
| Localization strings | `l10n/arb/app_en.arb` & `app_es.arb` |
| Documentation | `.agent/` |

---

## Summary

✅ **Follow the structure strictly**
✅ **Keep layers separated**
✅ **Use feature-first organization**
✅ **Reference the guides in `.agent/`**
✅ **Maintain consistent naming**

For detailed guides on each layer, see:
- `.agent/CORE_GUIDE.md`
- `.agent/DATA_LAYER_GUIDE.md`
- `.agent/DOMAIN_LAYER_GUIDE.md`
- `.agent/PAGES_GUIDE.md`
