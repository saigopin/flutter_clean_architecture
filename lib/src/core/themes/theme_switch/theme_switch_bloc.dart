import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_switch_event.dart';
part 'theme_switch_state.dart';

class ThemeSwitchBloc extends HydratedBloc<ThemeSwitchEvent, ThemeSwitchState> {
  // initially the switch is off so the switchValue is false
  ThemeSwitchBloc() : super(const ThemeSwitchInitial(switchValue: false)) {
    // emitting ThemeSwitchState for Switch on event
    on<SwitchOnEvent>((SwitchOnEvent event, Emitter<ThemeSwitchState> emit) {
      emit(const ThemeSwitchState(switchValue: true));
    });

    // emitting ThemeSwitchState for Switch off event
    on<SwitchOffEvent>((SwitchOffEvent event, Emitter<ThemeSwitchState> emit) {
      emit(const ThemeSwitchState(switchValue: false));
    });
  }

  @override
  ThemeSwitchState? fromJson(Map<String, dynamic> json) {
    return ThemeSwitchState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeSwitchState state) {
    return state.toMap();
  }
}
