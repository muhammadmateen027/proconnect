import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proconnect/core/widgets/app_button.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/apartment_management/bloc/apartment/apartment_bloc.dart';
import 'package:proconnect/pages/apartment_management/bloc/apartment/apartment_event.dart';

/// Delete Apartment Dialog Widget
class DeleteApartmentDialog extends StatelessWidget {
  const DeleteApartmentDialog({
    required this.condominiumId,
    required this.apartmentId,
    super.key,
  });

  final String condominiumId;
  final String apartmentId;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AlertDialog(
      title: Text(l10n.deleteApartment),
      content: Text(l10n.deleteApartmentConfirmation),
      actions: [
        AppButton(
          onPressed: () => Navigator.of(context).pop(),
          label: l10n.cancel,
          type: AppButtonType.text,
        ),
        AppButton(
          onPressed: () {
            context.read<ApartmentBloc>().add(
              ApartmentEvent.deleteApartment(
                condominiumId: condominiumId,
                apartmentId: apartmentId,
              ),
            );
            Navigator.of(context).pop();
          },
          label: l10n.delete,
        ),
      ],
    );
  }
}
