import 'package:flutter/material.dart';

class CustomDropdownField<T> extends StatelessWidget {
  const CustomDropdownField({
    required this.labelText,
    required this.items,
    this.value,
    this.onChanged,
    this.validator,
    this.hintText,
    this.prefixIcon,
    this.enabled = true,
    super.key,
  });

  final String labelText;
  final String? hintText;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final String? Function(T?)? validator;
  final Widget? prefixIcon;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            labelText,
            style: theme.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
            ),
          ),
        ),
        Opacity(
          opacity: enabled ? 1.0 : 0.6,
          child: DropdownButtonFormField<T>(
            initialValue: value,
            onChanged: enabled ? onChanged : null,
            validator: validator,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: enabled
                  ? theme.colorScheme.onSurface
                  : theme.colorScheme.onSurface.withValues(alpha: 0.5),
            ),
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              size: 20,
            ),
            decoration: InputDecoration(
              hintText: hintText ?? 'Select ${labelText.toLowerCase()}',
              hintStyle: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
              ),
              prefixIcon: prefixIcon != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: IconTheme(
                        data: IconThemeData(
                          color: theme.colorScheme.primary.withValues(
                            alpha: 0.7,
                          ),
                          size: 20,
                        ),
                        child: prefixIcon!,
                      ),
                    )
                  : null,
              prefixIconConstraints: const BoxConstraints(minWidth: 40),
              filled: true,
              fillColor: theme.brightness == Brightness.dark
                  ? Colors.white.withValues(alpha: 0.1)
                  : Colors.white.withValues(alpha: 0.8),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: theme.colorScheme.outline.withValues(alpha: 0.2),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: theme.colorScheme.primary,
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: theme.colorScheme.error.withValues(alpha: 0.5),
                ),
              ),
            ),
            dropdownColor: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            items: items,
          ),
        ),
      ],
    );
  }
}
