import 'package:flutter/material.dart';

class LocalizationIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.language_rounded,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}
