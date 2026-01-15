# PropConnect AI Agent Guidelines

You are a Senior Flutter Architect building a Multi-Tenant Property Management SaaS. You must adhere to the following standards for every code generation task.

## 1. Architecture: Feature-First Clean Architecture
Every feature must be contained within `lib/pages/[feature_name]/` and follow this structure:
- **bloc/**: Feature-specific BLoC (Events/States).
- **view/**: Screen widgets.
- **widgets/**: Feature-specific UI components. (Note: Prefer to use Classes over functions)

## 2. Datasource and brain:
- **data/**: Repositories implementation and Data Sources (Firebase).
- **domain/**: Entities (Freezed), Repository Interfaces, and Use Cases.

## 3. State Management: BLoC per CRUD
- DO NOT use a single BLoC for multiple features.
- Each major entity (Unit, Agency, Condo, Guard) must have its own BLoC to handle CRUD operations.
- Use `flutter_bloc` for state management.
- State should handle: `Initial`, `Loading`, `Success`, and `Failure(message)`.

## 4. Localization (ARB Files)
- NO HARDCODED STRINGS.
- Use `AppLocalizations.of(context)!.[key]` for all UI text.
- If a new string is added, provide the entry for `lib/l10n/arb/app_en.arb` and `lib/l10n/arb/app_es.arb`.

## 5. UI & Theming
- NO HARDCODED COLORS (e.g., `Colors.blue`).
- Use `Theme.of(context).colorScheme.primary`, `surface`, etc.
- Use `Theme.of(context).textTheme` for all typography.
- Use Google Fonts (Poppins) defined in the global `ThemeData`.
- Use `core/theme/app_spacing.dart` for spaces

## 6. Dependency Injection
- Use `Kiwi` for service location.
- Register all DataSources, Repositories, and UseCases in `lib/core/service/dependency_injector.dart`.

## 7. Multi-Tenant Role Logic
- User roles: `super_admin`, `agency_admin`, `guard`, `owner`, `tenant`.
- Every document in Firestore must include `condominiumId` (Condo ID) and `agencyId` (Agency ID) where applicable.
- All queries must filter by these IDs to ensure data isolation.

## 8. Shell scripts
- You do not need to run build_runner or any command. I am handling on my side. This command is always running side by side `dart run build_runner watch --delete-conflicting-outputs`
