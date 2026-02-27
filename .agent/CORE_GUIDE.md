# Core Layer Guide

## Overview
The `lib/core/` directory contains shared utilities, widgets, themes, and services used across the entire application. This layer is framework-agnostic and reusable.

## Directory Structure

```
lib/core/
├── config/                   # App configuration
├── services/                 # App-wide services
├── theme/                    # Theme and styling
├── utils/                    # Utility functions
└── widgets/                  # Reusable widgets
```

---

## 1. Config (`core/config/`)

**Purpose:** Application-wide configuration constants.

### Example:
```dart
class AppConfig {
  static const String appName = 'ProConnect';
  static const int timeoutDuration = 30; // seconds
  static const int maxRetries = 3;
}
```

**✅ DO:**
- Define app-wide constants
- Use for environment-specific config
- Keep values that rarely change

**❌ DON'T:**
- Put feature-specific config here
- Store sensitive data (use env variables)

---

## 2. Services (`core/services/`)

**Purpose:** App-wide services like dependency injection, logging, etc.

### Dependency Injection (`dependency_injector.dart`)

```dart
class DependencyInjector {
  static final DependencyInjector instance = DependencyInjector._();
  
  DependencyInjector._();
  
  final KiwiContainer _container = KiwiContainer();
  
  void setup() {
    // Register data sources
    _container.registerSingleton((c) => AuthRemoteDataSource());
    
    // Register repositories
    _container.registerSingleton<AuthRepository>(
      (c) => AuthRepositoryImpl(c.resolve()),
    );
    
    // Register use cases
    _container.registerFactory((c) => LoginUseCase(c.resolve()));
    
    // Register BLoCs
    _container.registerFactory((c) => AuthBloc(c.resolve(), c.resolve()));
  }
  
  T resolve<T>() => _container.resolve<T>();
}
```

**✅ DO:**
- Register all dependencies here
- Use singletons for data sources and repositories
- Use factories for BLoCs and use cases
- Call `setup()` in `main.dart`

**❌ DON'T:**
- Create dependencies manually in widgets
- Register UI components

---

## 3. Theme (`core/theme/`)

**Purpose:** Centralized theme configuration for consistent styling.

### Files:
- `app_theme.dart` - Main theme configuration
- `app_colors.dart` - Color constants
- `app_spacing.dart` - Spacing constants
- `app_text_styles.dart` - Text style constants
- `app_decorations.dart` - Decoration constants

### App Spacing (`app_spacing.dart`)

```dart
class AppSpacing {
  // Padding values
  static const double p4 = 4.0;
  static const double p8 = 8.0;
  static const double p12 = 12.0;
  static const double p16 = 16.0;
  static const double p24 = 24.0;
  static const double p32 = 32.0;
  
  // Gap widgets
  static const SizedBox gapH4 = SizedBox(height: p4);
  static const SizedBox gapH8 = SizedBox(height: p8);
  static const SizedBox gapH16 = SizedBox(height: p16);
  static const SizedBox gapH24 = SizedBox(height: p24);
  
  static const SizedBox gapW8 = SizedBox(width: p8);
  static const SizedBox gapW16 = SizedBox(width: p16);
}
```

**Usage:**
```dart
Padding(
  padding: const EdgeInsets.all(AppSpacing.p16),
  child: Column(
    children: [
      Text('Title'),
      AppSpacing.gapH16,
      Text('Content'),
    ],
  ),
)
```

**✅ DO:**
- Use `AppSpacing` constants for all spacing
- Use `Theme.of(context).colorScheme.*` for colors
- Use `Theme.of(context).textTheme.*` for text styles
- Define new constants if needed

**❌ DON'T:**
- Hardcode spacing values (e.g., `16.0`)
- Hardcode colors (e.g., `Colors.blue`)
- Use magic numbers

---

## 4. Utils (`core/utils/`)

**Purpose:** Utility functions and helpers.

### Validators (`validators.dart`)

```dart
class Validators {
  Validators._();

  /// Email validation regex
  static final RegExp emailRegex = RegExp(
    r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  /// Phone validation regex (Malaysian format)
  static final RegExp phoneRegex = RegExp(
    r'^(\+?6?01)[0-46-9]-*[0-9]{7,8}$',
  );

  /// Validates email address
  static bool isValidEmail(String? email) {
    if (email == null || email.trim().isEmpty) return true;
    return emailRegex.hasMatch(email.trim());
  }

  /// Validates year (1900 to current year + 5)
  static bool isValidYear(int? year) {
    if (year == null) return true;
    final currentYear = DateTime.now().year;
    return year >= 1900 && year <= currentYear + 5;
  }

  /// Validates year string
  static bool isValidYearString(String? yearString) {
    if (yearString == null || yearString.trim().isEmpty) return true;
    final year = int.tryParse(yearString.trim());
    return year != null && isValidYear(year);
  }
}
```

**Usage:**
```dart
TextFormField(
  validator: (value) {
    if (!Validators.isValidEmail(value)) {
      return l10n.invalidEmail;
    }
    return null;
  },
)
```

**✅ DO:**
- Add new validators here
- Make validators reusable
- Return `true` for optional fields
- Use in form validation

**❌ DON'T:**
- Create inline regex patterns
- Duplicate validation logic
- Put validators in widgets

---

## 5. Widgets (`core/widgets/`)

**Purpose:** Reusable widgets used across multiple features.

### AppButton (`app_button.dart`)

**See:** `.agent/APP_BUTTON_GUIDE.md` for complete documentation.

```dart
// Primary action
AppButton(
  onPressed: _handleSubmit,
  label: l10n.submit,
  icon: Icons.check,
  isLoading: _isSubmitting,
  expand: true,
)

// Secondary action
AppButton(
  onPressed: () => context.pop(),
  label: l10n.cancel,
  type: AppButtonType.outlined,
)
```

### Custom Text Field (`custom_text_field.dart`)

```dart
CustomTextField(
  controller: _emailController,
  labelText: l10n.email,
  hintText: l10n.emailHint,
  keyboardType: TextInputType.emailAddress,
  validator: (value) {
    if (!Validators.isValidEmail(value)) {
      return l10n.invalidEmail;
    }
    return null;
  },
)
```

**✅ DO:**
- Create reusable widgets here
- Make widgets configurable
- Use theme constants
- Document widget usage
- Follow Material Design guidelines

**❌ DON'T:**
- Put feature-specific widgets here
- Hardcode values
- Create overly complex widgets
- Duplicate existing widgets

---

## Widget Creation Guidelines

### When to create a core widget:

1. **Used in 3+ features** - If a widget is used across multiple features
2. **Generic functionality** - Button, text field, card, etc.
3. **No feature-specific logic** - Pure UI component
4. **Highly reusable** - Can be configured for different use cases

### When NOT to create a core widget:

1. **Feature-specific** - Only used in one feature
2. **Business logic** - Contains feature-specific logic
3. **One-off use** - Unlikely to be reused

---

## Best Practices

### ✅ DO:

```dart
// Use AppButton for all buttons
AppButton(
  onPressed: _handleAction,
  label: l10n.actionLabel,
  icon: Icons.action,
)

// Use Validators for validation
validator: (value) {
  if (!Validators.isValidEmail(value)) {
    return l10n.invalidEmail;
  }
  return null;
}

// Use AppSpacing for spacing
padding: const EdgeInsets.all(AppSpacing.p16)

// Use theme colors
color: Theme.of(context).colorScheme.primary
```

### ❌ DON'T:

```dart
// Don't create inline buttons
FilledButton.icon(
  onPressed: _handleAction,
  icon: Icon(Icons.action),
  label: Text('Action'),
)

// Don't create inline validators
validator: (value) {
  final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!emailRegex.hasMatch(value)) {
    return 'Invalid email';
  }
  return null;
}

// Don't hardcode spacing
padding: const EdgeInsets.all(16.0)

// Don't hardcode colors
color: Colors.blue
```

---

## Summary

The core layer provides:
- ✅ Reusable widgets (AppButton, CustomTextField, etc.)
- ✅ Centralized validators
- ✅ Theme constants (colors, spacing, text styles)
- ✅ Dependency injection
- ✅ App-wide services

**Remember:**
- Core widgets should be generic and reusable
- Always use theme constants
- Always use centralized validators
- Keep core layer independent of features
