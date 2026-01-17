import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:proconnect/app/app_routes.dart';
import 'package:proconnect/core/services/dependency_injector.dart';
import 'package:proconnect/core/theme/theme.dart';
import 'package:proconnect/domain/models/condo.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/apartment_management/bloc/apartment/apartment_bloc.dart';
import 'package:proconnect/pages/apartment_management/bloc/apartment/apartment_event.dart';
import 'package:proconnect/pages/apartment_management/bloc/floor/floor_bloc.dart';
import 'package:proconnect/pages/apartment_management/bloc/floor/floor_event.dart';
import 'package:proconnect/core/widgets/pro_connect_layout.dart';
import 'package:proconnect/pages/apartment_management/widgets/apartment_list_tab.dart';
import 'package:proconnect/pages/apartment_management/widgets/floor_list_tab.dart';

/// Apartment Management Page for managing floors and apartments in a condominium
class ApartmentManagementPage extends StatefulWidget {
  const ApartmentManagementPage({
    required this.condo,
    super.key,
  });

  final Condo condo;

  @override
  State<ApartmentManagementPage> createState() =>
      _ApartmentManagementPageState();
}

class _ApartmentManagementPageState extends State<ApartmentManagementPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final bloc = DependencyInjector.instance.resolve<FloorBloc>()
              ..add(FloorEvent.loadFloors(condominiumId: widget.condo.id));
            return bloc;
          },
        ),
        BlocProvider(
          create: (context) {
            final bloc = DependencyInjector.instance.resolve<ApartmentBloc>()
              ..add(
                ApartmentEvent.loadApartments(
                  condominiumId: widget.condo.id,
                ),
              );
            return bloc;
          },
        ),
      ],
      child: ProConnectLayout(
        useGlass: false,
        useScrolling: false, // TabBarView handles its own scrolling
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.apartmentManagement,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                widget.condo.name,
                style: theme.textTheme.titleMedium,
              ),
            ],
          ),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                icon: const Icon(Icons.layers_rounded),
                text: l10n.floors,
              ),
              Tab(
                icon: const Icon(Icons.apartment_rounded),
                text: l10n.apartments,
              ),
            ],
          ),
        ),
        floatingActionButton: AnimatedBuilder(
          animation: _tabController,
          builder: (context, child) {
            return FloatingActionButton.extended(
              onPressed: () {
                if (_tabController.index == 0) {
                  // Floors tab
                  FloorListTab.showAddFloorDialog(context, widget.condo);
                } else {
                  // Apartments tab
                  ApartmentListTab.showAddApartmentDialog(
                    context,
                    widget.condo,
                  );
                }
              },
              icon: const Icon(Icons.add),
              label: Text(
                _tabController.index == 0 ? l10n.addFloor : l10n.addApartment,
              ),
            );
          },
        ),
        child: TabBarView(
          controller: _tabController,
          children: [
            FloorListTab(condo: widget.condo),
            ApartmentListTab(condo: widget.condo),
          ],
        ),
      ),
    );
  }
}
