part of 'l10n_bloc.dart';

abstract class L10nEvent {
  const L10nEvent();
}

class L10nLoadStarted extends L10nEvent {}

class L10nChanged extends L10nEvent {
  const L10nChanged(this.locale);
  final Locale locale;
}
