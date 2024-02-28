part of 'theme_switch_bloc.dart';

sealed class ThemeSwitchEvent extends Equatable {
  const ThemeSwitchEvent();

  @override
  List<Object> get props => <Object>[];
}

// event for dark theme
class SwitchOnEvent extends ThemeSwitchEvent {}

// event for light theme
class SwitchOffEvent extends ThemeSwitchEvent {}
