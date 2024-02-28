part of 'theme_switch_bloc.dart';

class ThemeSwitchState extends Equatable {
  final bool switchValue;
  const ThemeSwitchState({required this.switchValue});

  @override
  List<Object> get props => [switchValue];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'switchValue': switchValue,
    };
  }

  factory ThemeSwitchState.fromMap(Map<String, dynamic> map) {
    return ThemeSwitchState(
      switchValue: map['switchValue'] as bool,
    );
  }
}

final class ThemeSwitchInitial extends ThemeSwitchState {
  // using the super() method to pass the switchValue to the ThemeSwitchState
  // constructor
  const ThemeSwitchInitial({required bool switchValue})
      : super(switchValue: switchValue);
}
