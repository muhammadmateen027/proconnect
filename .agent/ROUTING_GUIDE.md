# Routing & Navigation Guide

## Overview
ProConnect uses **GoRouter** for declarative routing and navigation. This guide covers all routing patterns, best practices, and examples used in the application.

## Architecture

### File Structure
```
lib/app/
├── app_routes.dart          # Route path constants
├── router.dart              # GoRouter configuration
└── view/
    └── home_screen_wrapper.dart  # Main navigation wrapper
```

## Route Definitions

### AppRoutes Class (`app/app_routes.dart`)
All route paths MUST be defined as static constants in this class.

```dart
class AppRoutes {
  // Auth routes
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  
  // Feature routes
  static const String settings = '/settings';
  static const String condoManagement = '/condo_management';
  static const String createCondo = '/create_condo';
  static const String editCondo = '/edit_condo';
  
  // Admin routes
  static const String superAdminDashboard = '/super_admin_dashboard';
  static const String userManagement = '/user_management';
  static const String createUser = '/create_user';
  
  // Owner routes
  static const String addUnit = '/add_unit';
  static const String unitDetail = '/unit_detail';
}
```

### Naming Conventions
- Use descriptive, lowercase names with underscores
- Group related routes together (auth, admin, owner, etc.)
- Prefix with feature name for clarity (e.g., `createCondo`, `editCondo`)

## Router Configuration

### Basic Route Setup (`app/router.dart`)

```dart
GoRouter createRouter(BuildContext context) {
  final authBloc = context.read<AuthBloc>();

  return GoRouter(
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
    routes: [
      // Simple route
      GoRoute(
        path: AppRoutes.settings,
        builder: (context, state) => const SettingsScreen(),
      ),
      
      // Route with BLoC provider
      GoRoute(
        path: AppRoutes.condoManagement,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              DependencyInjector.instance.resolve<CondoManagementBloc>(),
          child: const CondoManagementPage(),
        ),
      ),
    ],
  );
}
```

### Route with Data Passing

```dart
GoRoute(
  path: AppRoutes.editCondo,
  builder: (context, state) {
    // Extract data from extra parameter
    final condo = state.extra! as Condo;
    
    return BlocProvider(
      create: (context) =>
          DependencyInjector.instance.resolve<CondoManagementBloc>(),
      child: CreateEditCondoPage(condo: condo),
    );
  },
),
```

### Route with Path Parameters

```dart
GoRoute(
  path: '/user/:userId',
  builder: (context, state) {
    final userId = state.pathParameters['userId']!;
    
    return UserDetailPage(userId: userId);
  },
),
```

## Navigation Patterns

### 1. Simple Navigation (Push)

```dart
// Navigate to a new screen
context.push(AppRoutes.settings);

// Navigate and wait for result
final result = await context.push(AppRoutes.createCondo);
if (result == true) {
  // Refresh list or perform action
  _loadCondos();
}
```

### 2. Navigation with Data (Extra Parameter)

```dart
// Pass complex object
context.push(
  AppRoutes.editCondo,
  extra: condo,  // Pass the entire Condo object
);

// Pass multiple values (use a Map or custom class)
context.push(
  AppRoutes.someRoute,
  extra: {
    'id': condoId,
    'name': condoName,
    'data': someData,
  },
);
```

### 3. Pop/Return to Previous Screen

```dart
// Simple pop
context.pop();

// Pop with result
context.pop(true);  // Return success
context.pop(false); // Return failure

// Pop with data
context.pop(updatedCondo);
```

### 4. Replace Current Route

```dart
// Replace current route (can't go back)
context.pushReplacement(AppRoutes.login);
```

### 5. Navigate to Root

```dart
// Go to root and clear stack
context.go(AppRoutes.home);
```

## Auth-Aware Routing

### GoRouterRefreshStream
The router listens to AuthBloc state changes and can redirect based on auth state.

```dart
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
```

### Redirect Logic (Example)

```dart
GoRouter(
  refreshListenable: GoRouterRefreshStream(authBloc.stream),
  redirect: (context, state) {
    final isLoggedIn = authBloc.state is AuthAuthenticated;
    final isLoginRoute = state.location == AppRoutes.login;
    
    // Redirect to login if not authenticated
    if (!isLoggedIn && !isLoginRoute) {
      return AppRoutes.login;
    }
    
    // Redirect to home if already logged in and trying to access login
    if (isLoggedIn && isLoginRoute) {
      return AppRoutes.home;
    }
    
    return null; // No redirect needed
  },
  routes: [...],
);
```

## BLoC Integration

### Providing BLoCs in Routes

**Always create a new BLoC instance for each route:**

```dart
GoRoute(
  path: AppRoutes.condoManagement,
  builder: (context, state) => BlocProvider(
    create: (context) =>
        DependencyInjector.instance.resolve<CondoManagementBloc>(),
    child: const CondoManagementPage(),
  ),
),
```

**Why?**
- Ensures clean state for each screen
- Prevents state pollution between routes
- Follows single responsibility principle

### Accessing BLoCs in Child Widgets

```dart
// In the page widget
final bloc = context.read<CondoManagementBloc>();
bloc.add(LoadCondos());

// Or use BlocBuilder
BlocBuilder<CondoManagementBloc, CondoManagementState>(
  builder: (context, state) {
    // Build UI based on state
  },
);
```

## Common Patterns

### Pattern 1: Create/Edit Flow

```dart
// Navigation
FloatingActionButton(
  onPressed: () async {
    final result = await context.push(AppRoutes.createCondo);
    if (result == true && mounted) {
      _loadCondos(); // Refresh list
    }
  },
  child: Icon(Icons.add),
)

// In create page
void _handleSubmit() async {
  // ... submit logic
  if (mounted) {
    context.pop(true); // Return success
  }
}
```

### Pattern 2: Edit with Data

```dart
// Navigation with data
void _navigateToEdit(Condo condo) async {
  final result = await context.push(
    AppRoutes.editCondo,
    extra: condo,
  );
  
  if (result == true && mounted) {
    _loadCondos(); // Refresh list
  }
}

// In edit page
@override
Widget build(BuildContext context) {
  final condo = widget.condo; // Passed via constructor
  // ... use condo data
}
```

### Pattern 3: Confirmation Dialog Before Navigation

```dart
Future<void> _handleDelete(Condo condo) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(l10n.deleteCondo),
      content: Text(l10n.deleteCondoConfirmation),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(l10n.cancel),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text(l10n.delete),
        ),
      ],
    ),
  );

  if ((confirmed ?? false) && mounted) {
    // Perform delete
    context.read<CondoManagementBloc>().add(DeleteCondo(condo.id));
  }
}
```

## Best Practices

### ✅ DO

1. **Always use AppRoutes constants**
   ```dart
   context.push(AppRoutes.createCondo); // ✅ Good
   ```

2. **Provide BLoCs in route builder**
   ```dart
   GoRoute(
     path: AppRoutes.somePage,
     builder: (context, state) => BlocProvider(
       create: (context) => DependencyInjector.instance.resolve<SomeBloc>(),
       child: SomePage(),
     ),
   );
   ```

3. **Check mounted before navigation**
   ```dart
   if (mounted) {
     context.pop(true);
   }
   ```

4. **Use extra for complex data**
   ```dart
   context.push(AppRoutes.editCondo, extra: condo);
   ```

5. **Return results from screens**
   ```dart
   context.pop(true); // Indicate success
   ```

### ❌ DON'T

1. **Don't hardcode route paths**
   ```dart
   context.push('/create_condo'); // ❌ Bad
   ```

2. **Don't share BLoC instances across routes**
   ```dart
   // ❌ Bad - reusing BLoC
   final bloc = context.read<SomeBloc>();
   context.push(AppRoutes.somePage); // BLoC is shared
   ```

3. **Don't forget to check mounted**
   ```dart
   // ❌ Bad - might cause errors
   await someAsyncOperation();
   context.pop(); // Widget might be disposed
   ```

4. **Don't use Navigator.push with GoRouter**
   ```dart
   Navigator.push(context, ...); // ❌ Bad - use context.push
   ```

## Debugging

### Enable GoRouter Logging

```dart
GoRouter(
  debugLogDiagnostics: true, // Enable logging
  routes: [...],
);
```

### Common Issues

**Issue:** "No GoRouter found in context"
- **Solution:** Ensure GoRouter is provided at the app level

**Issue:** "extra is null"
- **Solution:** Always pass data via extra parameter and validate in route builder

**Issue:** "BLoC not found"
- **Solution:** Ensure BlocProvider is in the route builder, not in the child widget

**Issue:** "Can't navigate after dispose"
- **Solution:** Always check `mounted` before navigation

## Migration from Navigator 1.0

If migrating from old Navigator:

| Old (Navigator 1.0) | New (GoRouter) |
|---------------------|----------------|
| `Navigator.push(context, MaterialPageRoute(...))` | `context.push(AppRoutes.routeName)` |
| `Navigator.pop(context)` | `context.pop()` |
| `Navigator.pushReplacement(...)` | `context.pushReplacement(AppRoutes.routeName)` |
| `Navigator.pushNamed(context, '/route')` | `context.push(AppRoutes.routeName)` |

## Summary

- ✅ Define all routes in `AppRoutes` class
- ✅ Configure routes in `router.dart`
- ✅ Use `context.push()` and `context.pop()`
- ✅ Pass complex data via `extra` parameter
- ✅ Provide BLoCs in route builders
- ✅ Check `mounted` before navigation
- ✅ Return results from screens
- ✅ Use auth-aware routing for protected routes

For more examples, see the existing routes in `lib/app/router.dart`.
