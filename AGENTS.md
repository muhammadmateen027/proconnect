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
- **widgets/**: Feature-specific UI components. (Note: ALWAYS use Classes, NEVER functions)

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

## 5. UI & Theming - **CRITICAL DESIGN RULES**

### 5.1 Theme System (Material 3)
- **Theme Files Location**: `lib/core/theme/`
  - `app_theme.dart` - Main theme configuration (FlexColorScheme + Material 3)
  - `app_colors.dart` - Color palette and semantic colors
  - `app_spacing.dart` - Spacing constants and gap widgets
  - `app_text_styles.dart` - Custom text styles
  - `app_decorations.dart` - Reusable box decorations
  - `theme.dart` - Barrel file for easy imports

### 5.2 Color Usage - **MANDATORY**
- ❌ **NEVER** use hardcoded colors (e.g., `Colors.blue`, `Color(0xFF...)`)
- ✅ **ALWAYS** use theme colors:
  ```dart
  // From theme
  Theme.of(context).colorScheme.primary
  Theme.of(context).colorScheme.secondary
  Theme.of(context).colorScheme.surface
  Theme.of(context).colorScheme.error
  
  // From AppColors (for semantic/status colors)
  AppColors.success
  AppColors.warning
  AppColors.error
  AppColors.getStatusColor('occupied')
  ```

### 5.3 Spacing - **MANDATORY**
- ❌ **NEVER** use `SizedBox(height: X)` or `SizedBox(width: X)` for spacing
- ✅ **ALWAYS** use `AppSpacing` gaps:
  ```dart
  // Vertical spacing
  AppSpacing.gapH4   // 4px height
  AppSpacing.gapH8   // 8px height
  AppSpacing.gapH12  // 12px height
  AppSpacing.gapH16  // 16px height
  AppSpacing.gapH20  // 20px height
  AppSpacing.gapH24  // 24px height
  AppSpacing.gapH32  // 32px height
  AppSpacing.gapH48  // 48px height
  
  // Horizontal spacing
  AppSpacing.gapW4   // 4px width
  AppSpacing.gapW8   // 8px width
  AppSpacing.gapW12  // 12px width
  AppSpacing.gapW16  // 16px width
  AppSpacing.gapW20  // 20px width
  AppSpacing.gapW24  // 24px width
  AppSpacing.gapW32  // 32px width
  AppSpacing.gapW48  // 48px width
  
  // Padding values
  EdgeInsets.all(AppSpacing.p16)
  EdgeInsets.symmetric(horizontal: AppSpacing.p20, vertical: AppSpacing.p12)
  ```

### 5.4 Typography
- ❌ **NEVER** create inline `TextStyle` with hardcoded values
- ✅ **ALWAYS** use theme text styles:
  ```dart
  // From theme
  Theme.of(context).textTheme.headlineLarge
  Theme.of(context).textTheme.headlineMedium
  Theme.of(context).textTheme.headlineSmall
  Theme.of(context).textTheme.titleLarge
  Theme.of(context).textTheme.titleMedium
  Theme.of(context).textTheme.bodyLarge
  Theme.of(context).textTheme.bodyMedium
  Theme.of(context).textTheme.labelLarge
  
  // From AppTextStyles (for specialized use)
  AppTextStyles.currency()
  AppTextStyles.unitNumber()
  AppTextStyles.statusLabel()
  AppTextStyles.cardTitle()
  ```

### 5.5 Decorations
- ✅ **USE** `AppDecorations` for consistent styling:
  ```dart
  Container(
    decoration: AppDecorations.cardLight(),
    // or
    decoration: AppDecorations.elevatedCardLight(),
    // or
    decoration: AppDecorations.statusBadge(color: AppColors.success),
  )
  ```

### 5.6 Font Family
- Use Google Fonts (Poppins) defined in the global `ThemeData`
- Font is automatically applied through theme - no need to specify manually

## 6. Widget Creation - **CRITICAL RULE**

### 6.1 Widget Classes vs Functions
- ❌ **NEVER** create widget-building functions:
  ```dart
  // WRONG - DO NOT DO THIS
  Widget _buildCard(BuildContext context, String title) {
    return Card(child: Text(title));
  }
  ```

- ✅ **ALWAYS** create widget classes:
  ```dart
  // CORRECT - ALWAYS DO THIS
  class CustomCard extends StatelessWidget {
    const CustomCard({
      required this.title,
      super.key,
    });
    
    final String title;
    
    @override
    Widget build(BuildContext context) {
      return Card(child: Text(title));
    }
  }
  ```

### 6.2 Why Widget Classes?
- **Performance**: Flutter can optimize widget rebuilds
- **Const Constructors**: Enable better performance with `const`
- **DevTools**: Proper widget tree inspection
- **Best Practice**: Recommended by Flutter team
- **Type Safety**: Better compile-time checking

### 6.3 Widget Organization
- Extract widgets into separate classes when:
  - Widget is used multiple times
  - Widget has complex logic (>50 lines)
  - Widget improves code readability
- Place feature-specific widgets in `[feature]/widgets/` directory
- Use descriptive class names (e.g., `TenantAssignmentSheet`, `UnitDetailRow`)

## 7. Dependency Injection
- Use `Kiwi` for service location.
- Register all DataSources, Repositories, and UseCases in `lib/core/services/dependency_injector.dart`.

## 8. Multi-Tenant Role Logic
- User roles: `super_admin`, `agency_admin`, `guard`, `owner`, `tenant`.
- Every document in Firestore must include `condominiumId` (Condo ID) and `agencyId` (Agency ID) where applicable.
- All queries must filter by these IDs to ensure data isolation.

## 9. Reusable Components

### 9.1 Buttons - **MANDATORY**
- **ALWAYS** use `AppButton` from `core/widgets/app_button.dart` for all buttons.
  - See `.agent/APP_BUTTON_GUIDE.md` for usage patterns and examples.
  - DO NOT create inline `FilledButton`, `OutlinedButton`, or `TextButton` instances.
  - Use appropriate button types: `filled` (primary), `outlined` (secondary), `text` (tertiary).

### 9.2 Form Components
- **Form Sections**: Extract reusable form section widgets into `[feature]/widgets/` directory.
- **Validation**: Use centralized validators from `core/utils/validators.dart`.
  - DO NOT create inline regex patterns or validation logic.
  - Reuse existing validators for email, phone, year, etc.

### 9.3 Custom Widgets
- Create reusable widget classes in `core/widgets/` for app-wide components
- Create feature-specific widget classes in `[feature]/widgets/`
- Always use proper constructors with named parameters
- Use `const` constructors when possible

## 10. Code Organization

### 10.1 File Structure
- **Widget Extraction**: If a file exceeds 300 lines, extract widgets into separate files.
- **Single Responsibility**: Each widget should have one clear purpose.
- **Widget Classes**: Always create widget classes, NEVER widget-returning functions.
- **Documentation**: Keep implementation docs updated in `.agent/` directory.

### 10.2 Import Organization
```dart
// 1. Flutter SDK imports
import 'package:flutter/material.dart';

// 2. Third-party package imports
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// 3. Local imports - Theme first
import 'package:proconnect/core/theme/theme.dart';
import 'package:proconnect/domain/models/unit.dart';
import 'package:proconnect/pages/owner/bloc/unit/unit_bloc.dart';
```

## 11. Routing & Navigation (GoRouter)
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

## 12. Error Handling & Validation
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

## 13. Performance & Optimization

### 13.1 Widget Rebuilds
- **Const Constructors**: Use `const` constructors wherever possible.
  ```dart
  const CustomCard(title: 'Hello')  // Good
  CustomCard(title: 'Hello')        // Avoid if possible
  ```
- **BLoC Optimization**:
  - Use `BlocBuilder` with specific state types to minimize rebuilds
  - Use `BlocListener` for side effects (navigation, snackbars)
  - Use `BlocConsumer` when you need both listener and builder
- **Widget Classes**: Always use widget classes (not functions) for better optimization

### 13.2 List Performance
- Use `ListView.builder` for long lists (not `ListView` with children).
- Implement pagination for large datasets.
- Use `const` for list item widgets when possible.

### 13.3 Image Optimization
- Use `CachedNetworkImage` for remote images.
- Specify image dimensions to avoid layout shifts.

### 13.4 Async Operations
- Use `async`/`await` for asynchronous operations.
- Show loading indicators during async operations.
- Handle timeouts appropriately.

## 14. Code Quality & Best Practices

### 14.1 Naming Conventions
- **Classes**: `PascalCase` (e.g., `CondoManagementPage`, `UnitDetailRow`)
- **Variables/Functions**: `camelCase` (e.g., `loadCondos`, `isLoading`)
- **Constants**: `camelCase` with `const` or `static const` (e.g., `AppRoutes.createCondo`)
- **Private members**: prefix with `_` (e.g., `_handleSubmit`)
- **Files**: `snake_case` matching class names (e.g., `condo_management_page.dart`)

### 14.2 File Organization
- One widget class per file (exceptions for small helper classes).
- File names should match class names in snake_case.
- Group imports: Flutter SDK, third-party packages, local imports (theme first).

### 14.3 Comments & Documentation
- Add doc comments (`///`) for public APIs.
- Explain complex logic with inline comments.
- Keep comments up-to-date with code changes.

### 14.4 Code Formatting
- Use `dart format` for consistent formatting.
- Follow Flutter style guide.
- Max line length: 80 characters (flexible for readability).

## 15. Material 3 Design System

### 15.1 Theme Configuration
- **FlexColorScheme**: Using Blue Whale scheme
- **Material 3**: Enabled with `useMaterial3: true`
- **Typography**: Material 3 typography with `useMaterial3Typography: true`
- **Components**: Comprehensive component themes configured

### 15.2 Component Theming
All components are themed consistently:
- **Buttons**: Rounded corners (12px), proper elevation
- **Cards**: Consistent elevation and border radius
- **Inputs**: Filled style with outline borders
- **Chips**: Tertiary container background (subtle, eye-friendly)
- **Dialogs**: Proper elevation and border radius
- **Bottom Sheets**: Rounded top corners
- **Navigation**: Consistent indicator and label styling

### 15.3 Color Scheme
- **Primary**: Main brand color
- **Secondary**: Supporting color
- **Tertiary**: Accent color
- **Surface**: Background surfaces
- **Error/Warning/Success**: Semantic colors from `AppColors`

## 16. Testing (Future Implementation)
- **Unit Tests**: Test business logic in BLoCs, UseCases, and Repositories.
- **Widget Tests**: Test UI components in isolation.
- **Integration Tests**: Test complete user flows.
- **Test Coverage**: Aim for >80% code coverage for critical features.

## 17. Documentation & Guides
- **Implementation Guides**: Store feature implementation docs in `.agent/` directory.
- **Component Guides**: Reference `.agent/APP_BUTTON_GUIDE.md` for button usage.
- **Theme Documentation**: See `lib/core/theme/README.md` for theme system details.
- **Keep Updated**: Update relevant `.agent/*.md` files when making significant changes.
- **Code Examples**: Provide usage examples for reusable components.

## 18. Security Best Practices
- **Firestore Rules**: Ensure proper security rules are in place.
- **Data Validation**: Validate all user inputs on both client and server.
- **Sensitive Data**: Never hardcode API keys, credentials, or secrets.
- **User Permissions**: Implement role-based access control (RBAC).
- **Multi-Tenancy**: Always filter queries by `condominiumId` and `agencyId`.

## 19. Shell Scripts & Build
- You do not need to run build_runner or any command. I am handling on my side. This command is always running side by side `dart run build_runner watch --delete-conflicting-outputs`

---

## 🎯 Quick Checklist for Every Code Change

Before submitting any code, verify:

- [ ] ✅ No hardcoded colors - using theme colors or `AppColors`
- [ ] ✅ No hardcoded spacing - using `AppSpacing` gaps
- [ ] ✅ No widget functions - only widget classes
- [ ] ✅ Using `AppButton` for all buttons
- [ ] ✅ No hardcoded strings - using localization
- [ ] ✅ Using theme text styles - no inline `TextStyle`
- [ ] ✅ Proper imports organization (Flutter, packages, local)
- [ ] ✅ Theme import first in local imports
- [ ] ✅ Const constructors where possible
- [ ] ✅ Proper error handling in BLoC
- [ ] ✅ Multi-tenant filtering (condominiumId, agencyId)
- [ ] ✅ Following naming conventions
- [ ] ✅ Documentation updated if needed

---

## 📖 Example: Perfect Widget Implementation

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:proconnect/core/theme/theme.dart';
import 'package:proconnect/domain/models/unit.dart';
import 'package:proconnect/pages/owner/bloc/unit/unit_bloc.dart';

class UnitDetailRow extends StatelessWidget {
  const UnitDetailRow({
    required this.icon,
    required this.label,
    required this.value,
    super.key,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.p8),
      child: Row(
        children: [
          Icon(
            icon,
            color: theme.colorScheme.primary,
            size: 20,
          ),
          AppSpacing.gapW16,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: theme.textTheme.bodySmall),
                Text(value, style: theme.textTheme.titleMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

This example demonstrates:
- ✅ Widget class (not function)
- ✅ Const constructor
- ✅ Theme colors and text styles
- ✅ AppSpacing for gaps and padding
- ✅ Proper imports organization
- ✅ Named parameters with required/optional
- ✅ Clean, readable code structure
