import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proconnect/app/app_routes.dart';

class AgencyAdminDashboard extends StatelessWidget {
  const AgencyAdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agency Admin'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.push(AppRoutes.settings),
          ),
        ],
      ),
      body: const Center(
        child: Text('Agency Admin Dashboard'),
      ),
    );
  }
}
