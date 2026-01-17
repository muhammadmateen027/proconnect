# PropConnect AI Agent Guidelines

You are a Senior Flutter Architect building a Multi-Tenant Property Management SaaS. You must adhere to the following standards for every code generation task.

## 📚 Documentation & Guides

**IMPORTANT:** Before making any changes, consult these comprehensive guides:

- **`.agent/PROJECT_STRUCTURE.md`** - Complete project structure snapshot with Do's and Don'ts
- **`.agent/CORE_GUIDE.md`** - Core utilities, widgets, theme, and validators
- **`.agent/DATA_LAYER_GUIDE.md`** - Data sources and repository implementations
- **`.agent/DOMAIN_LAYER_GUIDE.md`** - Entities, repository interfaces, and use cases
- **`.agent/PAGES_GUIDE.md`** - Feature modules, BLoCs, views, and widgets
- **`.agent/ROUTING_GUIDE.md`** - GoRouter patterns and navigation
- **`.agent/APP_BUTTON_GUIDE.md`** - AppButton component usage
- **`.agent/CONDO_MANAGEMENT_IMPLEMENTATION.md`** - Reference implementation example

---

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
- Register all DataSources, Repositories, and UseCases in `lib/core/services/dependency_injector.dart`.

## 7. Multi-Tenant Role Logic
- User roles: `super_admin`, `agency_admin`, `guard`, `owner`, `tenant`.
- Every document in Firestore must include `condominiumId` (Condo ID) and `agencyId` (Agency ID) where applicable.
- All queries must filter by these IDs to ensure data isolation.

## 8. Reusable Components
- **Buttons**: ALWAYS use `AppButton` from `core/widgets/app_button.dart` for all buttons.
  - See `.agent/APP_BUTTON_GUIDE.md` for usage patterns and examples.
  - DO NOT create inline `FilledButton`, `OutlinedButton`, or `TextButton` instances.
  - Use appropriate button types: `filled` (primary), `outlined` (secondary), `text` (tertiary).
- **Form Sections**: Extract reusable form section widgets into `[feature]/widgets/` directory.
- **Validation**: Use centralized validators from `core/utils/validators.dart`.
  - DO NOT create inline regex patterns or validation logic.
  - Reuse existing validators for email, phone, year, etc.

## 9. Code Organization
- **Widget Extraction**: If a file exceeds 300 lines, extract widgets into separate files.
- **Single Responsibility**: Each widget should have one clear purpose.
- **Prefer Classes over Functions**: Always create widget classes, not widget-returning functions.
- **Documentation**: Keep implementation docs updated in `.agent/` directory.

## 10. Routing & Navigation (GoRouter)
- **See `.agent/ROUTING_GUIDE.md` for comprehensive routing documentation.**
- **Route Definitions**: ALL route paths MUST be defined as constants in `lib/app/app_routes.dart`.
  - Use descriptive, lowercase names with underscores: `createCondo`, `editCondo`, `userManagement`.
  - DO NOT hardcode route paths in navigation calls.
- **Router Configuration**: Define all routes in `lib/app/router.dart`.
  - Use `GoRoute` for each route.
  - Provide BLoC instances using `BlocProvider` in the route builder.
  - Resolve BLoCs from `DependencyInjector.instance.resolve<BlocType>()`.
- **Navigation**:
  - Use `context.push(AppRoutes.routeName)` for forward navigation.
  - Use `context.pop()` or `context.pop(result)` to return to previous screen.
  - Pass complex data via `extra` parameter: `context.push(AppRoutes.editCondo, extra: condo)`.
  - Extract `extra` data in route builder: `final data = state.extra! as DataType;`.
- **Route Parameters**:
  - For simple IDs, use path parameters: `/user/:userId`.
  - For complex objects, use `extra` parameter.
  - Always validate and cast `extra` data with proper type checking.
- **Auth-Aware Routing**:
  - The router uses `GoRouterRefreshStream` to listen to `AuthBloc` state changes.
  - Implement redirect logic for protected routes based on auth state.
- **Best Practices**:
  - Keep route definitions flat (avoid deep nesting unless necessary).
  - Each route should provide its own BLoC instance (don't share BLoCs across routes).
  - Use named routes from `AppRoutes` class, never hardcoded strings.

## 11. Error Handling & Validation
- **Form Validation**:
  - Use `GlobalKey<FormState>` for form validation.
  - Implement validators for all required fields.
  - Use centralized validators from `core/utils/validators.dart`.
  - Show user-friendly, localized error messages.
- **BLoC Error States**:
  - Always handle `Failure` states in BLoC listeners.
  - Display errors using `SnackBar` with localized messages.
  - Use `ScaffoldMessenger.of(context).showSnackBar()`.
- **Null Safety**:
  - Leverage Dart's null safety features.
  - Use `?`, `!`, and `??` operators appropriately.
  - Avoid using `!` unless you're absolutely certain the value is non-null.
- **Try-Catch Blocks**:
  - Wrap Firestore operations in try-catch blocks.
  - Log errors for debugging (use `debugPrint` or logging package).
  - Provide fallback UI for error states.

## 12. Performance & Optimization
- **Widget Rebuilds**:
  - Use `const` constructors wherever possible.
  - Minimize widget rebuilds by using `BlocBuilder` with specific state types.
  - Use `BlocListener` for side effects (navigation, snackbars).
  - Use `BlocConsumer` when you need both listener and builder.
- **List Performance**:
  - Use `ListView.builder` for long lists (not `ListView` with children).
  - Implement pagination for large datasets.
  - Use `const` for list item widgets when possible.
- **Image Optimization**:
  - Use `CachedNetworkImage` for remote images.
  - Specify image dimensions to avoid layout shifts.
- **Async Operations**:
  - Use `async`/`await` for asynchronous operations.
  - Show loading indicators during async operations.
  - Handle timeouts appropriately.

## 13. Code Quality & Best Practices
- **Naming Conventions**:
  - Classes: `PascalCase` (e.g., `CondoManagementPage`)
  - Variables/Functions: `camelCase` (e.g., `loadCondos`, `isLoading`)
  - Constants: `camelCase` with `const` or `static const` (e.g., `AppRoutes.createCondo`)
  - Private members: prefix with `_` (e.g., `_handleSubmit`)
- **File Organization**:
  - One widget class per file (exceptions for small helper classes).
  - File names should match class names in snake_case (e.g., `condo_management_page.dart`).
  - Group imports: Flutter SDK, third-party packages, local imports.
- **Comments & Documentation**:
  - Add doc comments (`///`) for public APIs.
  - Explain complex logic with inline comments.
  - Keep comments up-to-date with code changes.
- **Code Formatting**:
  - Use `dart format` for consistent formatting.
  - Follow Flutter style guide.
  - Max line length: 80 characters (flexible for readability).

## 14. Testing (Future Implementation)
- **Unit Tests**: Test business logic in BLoCs, UseCases, and Repositories.
- **Widget Tests**: Test UI components in isolation.
- **Integration Tests**: Test complete user flows.
- **Test Coverage**: Aim for >80% code coverage for critical features.

## 15. Documentation & Guides
- **Implementation Guides**: Store feature implementation docs in `.agent/` directory.
- **Component Guides**: Reference `.agent/APP_BUTTON_GUIDE.md` for button usage.
- **Keep Updated**: Update relevant `.agent/*.md` files when making significant changes.
- **Code Examples**: Provide usage examples for reusable components.

## 16. Security Best Practices
- **Firestore Rules**: Ensure proper security rules are in place.
- **Data Validation**: Validate all user inputs on both client and server.
- **Sensitive Data**: Never hardcode API keys, credentials, or secrets.
- **User Permissions**: Implement role-based access control (RBAC).
- **Multi-Tenancy**: Always filter queries by `condominiumId` and `agencyId`.

## 17. Shell Scripts & Build
- You do not need to run build_runner or any command. I am handling on my side. This command is always running side by side `dart run build_runner watch --delete-conflicting-outputs`
