import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/src/core/exports.dart';

class ThemeSwitchWidget extends StatelessWidget {
  const ThemeSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
        builder: (BuildContext context, ThemeSwitchState state) {
      return IconButton(
        onPressed: () {
          if (state.switchValue) {
            context.read<ThemeSwitchBloc>().add(SwitchOffEvent());
          } else {
            context.read<ThemeSwitchBloc>().add(SwitchOnEvent());
          }
        },
        icon: Icon(
          state.switchValue ? Icons.dark_mode_outlined : Icons.sunny,
        ),
      );
    });
  }
}
