import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/condo_management/bloc/condo_management_bloc.dart';

class CondoManagementPage extends StatefulWidget {
  const CondoManagementPage({super.key});

  @override
  State<CondoManagementPage> createState() => _CondoManagementPageState();
}

class _CondoManagementPageState extends State<CondoManagementPage> {
  @override
  void initState() {
    super.initState();
    context.read<CondoManagementBloc>().add(
      const CondoManagementEvent.loadCondos(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.condoManagement),
      ),
      body: BlocBuilder<CondoManagementBloc, CondoManagementState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: () => const Center(child: CircularProgressIndicator()),
            loaded: (condos) {
              if (condos.isEmpty) {
                return Center(child: Text(l10n.noCondosFound));
              }
              return ListView.builder(
                itemCount: condos.length,
                itemBuilder: (context, index) {
                  final condo = condos[index];
                  return ListTile(
                    title: Text(condo.name),
                    subtitle: Text(condo.address),
                  );
                },
              );
            },
            failure: (message) =>
                Center(child: Text(l10n.errorPrefix + message)),
          );
        },
      ),
    );
  }
}
