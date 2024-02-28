import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  /// property to get the heading
  final String heading;

  /// property to get the description
  final String description;

  /// property for button pressed
  final void Function() buttonOnPressedHandler;

  const BottomSheetWidget({
    super.key,
    required this.heading,
    required this.description,
    required this.buttonOnPressedHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: double.infinity,
      decoration: _buildBottomSheetDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildHeadingTextUI(),
          const SizedBox(height: 15.0),
          _buildDescriptionUI(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.09,
          ),
          buildButtonUI(),
        ],
      ),
    );
  }

  Widget buildButtonUI() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ElevatedButton(
          onPressed: buttonOnPressedHandler,
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: Colors.deepPurple),
          child: const Text(
            'Continue',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
      );

  Text _buildDescriptionUI() => Text(
        description,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w300,
        ),
      );

  Text _buildHeadingTextUI() => Text(
        heading,
        style: const TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      );

  BoxDecoration _buildBottomSheetDecoration() {
    return const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20.0),
      ),
    );
  }
}
