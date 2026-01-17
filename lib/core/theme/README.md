# ProConnect Theme System

This directory contains the complete theme configuration for the ProConnect application.

## Files Overview

### `app_theme.dart`
Main theme configuration using FlexColorScheme for Material 3 design.
- **Light Theme**: Optimized for daytime use with high contrast
- **Dark Theme**: Optimized for low-light environments
- **Features**:
  - Material 3 design system
  - Custom typography using Poppins font
  - Comprehensive component themes (buttons, inputs, cards, etc.)
  - Fixed deprecated `useTextTheme` → `useMaterial3Typography`

### `app_colors.dart`
Centralized color palette with semantic color definitions.
- **Primary Colors**: Blue Whale scheme (light & dark variants)
- **Semantic Colors**: Success, warning, error, info
- **Status Colors**: Occupied, vacant, maintenance, reserved
- **Neutral Colors**: Complete grey scale (50-900)
- **Helper Methods**: `getStatusColor()`, `getSemanticColor()`

### `app_spacing.dart`
Consistent spacing and gap definitions.
- **Padding Values**: p4, p8, p12, p16, p20, p24, p32, p48
- **Height Gaps**: gapH4, gapH8, gapH12, gapH16, gapH20, gapH24, gapH32, gapH48
- **Width Gaps**: gapW4, gapW8, gapW12, gapW16, gapW20, gapW24, gapW32, gapW48

### `app_text_styles.dart`
Custom text styles beyond the standard Material theme.
- **Material 3 Typography**: Display, headline, title, body, label styles
- **Custom Styles**: Button, caption, overline
- **Specialized Styles**:
  - Currency display (large & small)
  - Unit numbers
  - Status labels
  - Card titles/subtitles
  - Section headers
  - Input fields
  - Links and tabs

### `app_decorations.dart`
Reusable box decorations for consistent UI elements.
- **Border Radius**: Small (8), medium (12), large (16), XL (20), round (999)
- **Card Decorations**: Standard and elevated variants
- **Input Decorations**: Customizable with labels, hints, icons
- **Status Badges**: Filled and outlined variants
- **Bottom Sheets & Dialogs**: With proper shadows and radius
- **Special Decorations**: Chips, dividers, image containers, shimmer effects

### `theme.dart`
Barrel file for convenient imports.

## Usage Examples

### Basic Import
```dart
// Import everything
import 'package:proconnect/core/theme/theme.dart';

// Or import specific files
import 'package:proconnect/core/theme/app_colors.dart';
import 'package:proconnect/core/theme/app_spacing.dart';
```

### Using Colors
```dart
Container(
  color: AppColors.primaryLight,
  child: Text(
    'Status',
    style: TextStyle(color: AppColors.getStatusColor('occupied')),
  ),
)
```

### Using Spacing
```dart
Column(
  children: [
    Text('Title'),
    AppSpacing.gapH16,
    Text('Content'),
  ],
)

// Or use padding values
Padding(
  padding: EdgeInsets.all(AppSpacing.p16),
  child: child,
)
```

### Using Text Styles
```dart
Text(
  'RM 1,500.00',
  style: AppTextStyles.currency(color: AppColors.success),
)

Text(
  'A-12-03',
  style: AppTextStyles.unitNumber(),
)
```

### Using Decorations
```dart
Container(
  decoration: AppDecorations.cardLight(),
  child: child,
)

Container(
  decoration: AppDecorations.statusBadge(
    color: AppColors.success,
    isOutlined: true,
  ),
  child: Text('Occupied'),
)
```

### Using Theme in Widgets
```dart
@override
Widget build(BuildContext context) {
  final theme = Theme.of(context);
  
  return Text(
    'Hello',
    style: theme.textTheme.headlineSmall,
  );
}
```

## Theme Configuration

### Material 3 Features
- ✅ Material 3 design system enabled
- ✅ Material 3 typography (`useMaterial3Typography: true`)
- ✅ Comprehensive component themes
- ✅ Proper elevation and shadows
- ✅ Consistent border radius across components

### Typography
- **Font Family**: Poppins (via Google Fonts)
- **Font Weights**: 400 (regular), 500 (medium), 600 (semibold), 700 (bold)
- **Letter Spacing**: Optimized for readability

### Color Scheme
- **Primary**: Blue Whale scheme
- **Surface Mode**: High scaffold, low surface
- **Blend Levels**: Light (7), Dark (13)

## Best Practices

1. **Always use theme constants** instead of hardcoded values
2. **Use semantic colors** (success, error, warning) for better maintainability
3. **Leverage AppSpacing** for consistent spacing throughout the app
4. **Use AppTextStyles** for specialized text (currency, unit numbers, etc.)
5. **Apply AppDecorations** for consistent visual styling

## Migration Notes

### Deprecated Properties Fixed
- ❌ `useTextTheme: true` (deprecated)
- ✅ `useMaterial3Typography: true` (replacement)

This ensures compatibility with future versions of FlexColorScheme and Flutter.

## Customization

To customize the theme:

1. **Colors**: Modify `app_colors.dart`
2. **Spacing**: Adjust values in `app_spacing.dart`
3. **Typography**: Update `app_text_styles.dart`
4. **Decorations**: Modify `app_decorations.dart`
5. **Theme Settings**: Update `app_theme.dart`

All changes will automatically propagate throughout the app.
