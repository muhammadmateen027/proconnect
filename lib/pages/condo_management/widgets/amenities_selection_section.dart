import 'package:flutter/material.dart';
import 'package:proconnect/core/theme/app_spacing.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/condo_management/widgets/form_section_card.dart';

/// Widget for amenities selection
/// Displays a list of amenities as filter chips for multi-selection
class AmenitiesSelectionSection extends StatefulWidget {
  const AmenitiesSelectionSection({
    required this.selectedAmenities,
    required this.onAmenitiesChanged,
    super.key,
  });

  final List<String> selectedAmenities;
  final ValueChanged<List<String>> onAmenitiesChanged;

  @override
  State<AmenitiesSelectionSection> createState() =>
      _AmenitiesSelectionSectionState();
}

class _AmenitiesSelectionSectionState extends State<AmenitiesSelectionSection> {
  /// Get localized amenities list
  List<String> _getAvailableAmenities(BuildContext context) {
    final l10n = context.l10n;
    return [
      l10n.swimmingPool,
      l10n.gym,
      l10n.parking,
      l10n.security,
      l10n.playground,
      l10n.bbqArea,
      l10n.functionRoom,
      l10n.sauna,
      l10n.tennisCourt,
      l10n.basketballCourt,
      l10n.joggingTrack,
      l10n.miniMarket,
      l10n.cafe,
      l10n.laundry,
    ];
  }

  void _toggleAmenity(String amenity, bool selected) {
    final updatedAmenities = List<String>.from(widget.selectedAmenities);
    if (selected) {
      updatedAmenities.add(amenity);
    } else {
      updatedAmenities.remove(amenity);
    }
    widget.onAmenitiesChanged(updatedAmenities);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return FormSectionCard(
      title: l10n.amenities,
      children: [
        Text(
          l10n.amenitiesDescription,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        AppSpacing.gapH16,
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _getAvailableAmenities(context).map((String amenity) {
            final isSelected = widget.selectedAmenities.contains(amenity);
            return FilterChip(
              label: Text(amenity),
              selected: isSelected,
              onSelected: (selected) => _toggleAmenity(amenity, selected),
            );
          }).toList(),
        ),
      ],
    );
  }
}
