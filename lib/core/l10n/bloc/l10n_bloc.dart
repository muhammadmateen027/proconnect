import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proconnect/core/l10n/repository/l10n_repository.dart';

part 'l10n_event.dart';
part 'l10n_state.dart';

class L10nBloc extends Bloc<L10nEvent, L10nState> {
  L10nBloc(this._l10nRepository) : super(const L10nState(null)) {
    on<L10nLoadStarted>(_onL10nLoadStarted);
    on<L10nChanged>(_onL10nChanged);
  }

  final L10nRepository _l10nRepository;

  Future<void> _onL10nLoadStarted(
    L10nLoadStarted event,
    Emitter<L10nState> emit,
  ) async {
    final locale = await _l10nRepository.loadLocale();
    emit(L10nState(locale));
  }

  Future<void> _onL10nChanged(
    L10nChanged event,
    Emitter<L10nState> emit,
  ) async {
    await _l10nRepository.saveLocale(event.locale);
    emit(L10nState(event.locale));
  }
}
