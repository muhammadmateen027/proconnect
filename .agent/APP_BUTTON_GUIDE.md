# AppButton Widget

A comprehensive, reusable button component for the ProConnect application.

## Overview

`AppButton` is a versatile button widget that provides a consistent interface for all button types throughout the application. It handles loading states, icons, different button styles, and more.

## Features

- ✅ **Multiple Button Types**: Filled, Outlined, Text, and Elevated
- ✅ **Loading State**: Built-in loading indicator
- ✅ **Icon Support**: Optional icon before label
- ✅ **Flexible Sizing**: Can expand to full width or fit content
- ✅ **Custom Padding**: Configurable padding
- ✅ **Disabled State**: Automatically handles null onPressed
- ✅ **Consistent Styling**: Uses theme colors and styles

## Usage

### Basic Button

```dart
AppButton(
  onPressed: () => print('Button pressed'),
  label: 'Submit',
)
```

### Button with Icon

```dart
AppButton(
  onPressed: () => _handleSave(),
  label: 'Save Changes',
  icon: Icons.save,
)
```

### Loading State

```dart
AppButton(
  onPressed: _handleSubmit,
  label: 'Processing...',
  icon: Icons.upload,
  isLoading: _isSubmitting,
)
```

### Outlined Button

```dart
AppButton(
  onPressed: () => Navigator.pop(context),
  label: 'Cancel',
  type: AppButtonType.outlined,
)
```

### Full Width Button

```dart
AppButton(
  onPressed: _handleLogin,
  label: 'Login',
  icon: Icons.login,
  expand: true,
)
```

### Text Button

```dart
AppButton(
  onPressed: () => _skipStep(),
  label: 'Skip',
  type: AppButtonType.text,
)
```

## Parameters

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `onPressed` | `VoidCallback?` | Yes | - | Callback when button is pressed. Null disables the button |
| `label` | `String` | Yes | - | Button label text |
| `icon` | `IconData?` | No | `null` | Optional icon to display before label |
| `isLoading` | `bool` | No | `false` | Shows loading indicator when true |
| `type` | `AppButtonType` | No | `filled` | Button style type |
| `expand` | `bool` | No | `false` | Whether button should expand to fill width |
| `padding` | `EdgeInsetsGeometry?` | No | `null` | Custom padding for the button |

## Button Types

### AppButtonType.filled (Default)
Primary action button with filled background. Use for main actions like "Submit", "Save", "Create".

### AppButtonType.outlined
Secondary action button with border. Use for alternative actions like "Cancel", "Back".

### AppButtonType.text
Tertiary action button without background. Use for less important actions like "Skip", "Learn More".

### AppButtonType.elevated
Legacy elevated button. Use `filled` instead for new code.

## Common Patterns

### Form Submit Button
```dart
AppButton(
  onPressed: _handleSubmit,
  label: l10n.saveChanges,
  icon: Icons.save,
  isLoading: _isSubmitting,
  expand: true,
)
```

### Dialog Actions
```dart
Row(
  children: [
    Expanded(
      child: AppButton(
        onPressed: () => Navigator.pop(context),
        label: l10n.cancel,
        type: AppButtonType.outlined,
      ),
    ),
    SizedBox(width: 16),
    Expanded(
      child: AppButton(
        onPressed: _handleConfirm,
        label: l10n.confirm,
        icon: Icons.check,
      ),
    ),
  ],
)
```

### Delete Action
```dart
AppButton(
  onPressed: _handleDelete,
  label: l10n.delete,
  icon: Icons.delete,
  type: AppButtonType.outlined,
  isLoading: _isDeleting,
)
```

## Migration Guide

### From FilledButton

**Before:**
```dart
FilledButton.icon(
  onPressed: _isSubmitting ? null : _handleSubmit,
  icon: _isSubmitting
      ? SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        )
      : Icon(Icons.save),
  label: Text('Save'),
  style: FilledButton.styleFrom(
    padding: EdgeInsets.symmetric(vertical: 16),
  ),
)
```

**After:**
```dart
AppButton(
  onPressed: _handleSubmit,
  label: 'Save',
  icon: Icons.save,
  isLoading: _isSubmitting,
)
```

### From ElevatedButton

**Before:**
```dart
ElevatedButton(
  onPressed: isLoading ? null : onPressed,
  child: isLoading
      ? CircularProgressIndicator()
      : Text(text),
)
```

**After:**
```dart
AppButton(
  onPressed: onPressed,
  label: text,
  isLoading: isLoading,
  type: AppButtonType.elevated,
)
```

## Best Practices

1. **Use appropriate button types**
   - `filled` for primary actions
   - `outlined` for secondary actions
   - `text` for tertiary actions

2. **Always provide localized labels**
   ```dart
   AppButton(
     label: l10n.saveChanges, // ✅ Good
     // label: 'Save Changes', // ❌ Bad (hardcoded)
   )
   ```

3. **Use expand for full-width buttons in forms**
   ```dart
   AppButton(
     label: l10n.submit,
     expand: true, // ✅ Good for form buttons
   )
   ```

4. **Handle loading states properly**
   ```dart
   AppButton(
     onPressed: _handleSubmit, // Don't set to null when loading
     isLoading: _isSubmitting,  // Let the widget handle it
   )
   ```

5. **Use icons consistently**
   - Save: `Icons.save`
   - Delete: `Icons.delete`
   - Add: `Icons.add`
   - Edit: `Icons.edit`
   - Refresh: `Icons.refresh`

## Related Components

- `CustomAuthButton`: Specialized button for authentication screens
- `FormSectionCard`: Card wrapper for form sections
- See `app_button_examples.dart` for more examples

## Location

`lib/core/widgets/app_button.dart`
