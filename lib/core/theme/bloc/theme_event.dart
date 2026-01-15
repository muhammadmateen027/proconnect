part of 'theme_bloc.dart';

abstract class ThemeEvent {
  const ThemeEvent();
}

class ThemeLoadStarted extends ThemeEvent {}

class ThemeChanged extends ThemeEvent {
  const ThemeChanged(this.themeMode);

  final ThemeMode themeMode;
}
