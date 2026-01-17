import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:proconnect/domain/apartment/usecase/get_apartments_by_owner_use_case.dart';
import 'package:proconnect/domain/models/apartment.dart';

import 'owner_apartment_event.dart';
import 'owner_apartment_state.dart';

export 'owner_apartment_event.dart';
export 'owner_apartment_state.dart';

/// BLoC for managing apartments in the owner dashboard
class OwnerApartmentBloc
    extends Bloc<OwnerApartmentEvent, OwnerApartmentState> {
  OwnerApartmentBloc(this._getApartmentsByOwnerUseCase)
    : super(const OwnerApartmentState.initial()) {
    on<OwnerApartmentEvent>((event, emit) async {
      await event.map(
        loadApartments: (e) => _onLoadApartments(e.ownerId, emit),
        apartmentsUpdated: (e) async =>
            _onApartmentsUpdated(e.apartments, emit),
        clear: (_) async => _onClear(emit),
      );
    });
  }

  final GetApartmentsByOwnerUseCase _getApartmentsByOwnerUseCase;
  StreamSubscription<List<Apartment>>? _apartmentSubscription;

  Future<void> _onLoadApartments(
    String ownerId,
    Emitter<OwnerApartmentState> emit,
  ) async {
    emit(const OwnerApartmentState.loading());

    await emit.forEach<List<Apartment>>(
      _getApartmentsByOwnerUseCase(ownerId),
      onData: OwnerApartmentState.loaded,
      onError: (error, stackTrace) =>
          OwnerApartmentState.error(error.toString()),
    );
  }

  void _onApartmentsUpdated(
    List<Apartment> apartments,
    Emitter<OwnerApartmentState> emit,
  ) {
    emit(OwnerApartmentState.loaded(apartments));
  }

  void _onClear(Emitter<OwnerApartmentState> emit) {
    _apartmentSubscription?.cancel();
    _apartmentSubscription = null;
    emit(const OwnerApartmentState.initial());
  }

  @override
  Future<void> close() {
    _apartmentSubscription?.cancel();
    return super.close();
  }
}
