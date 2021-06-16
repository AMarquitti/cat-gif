import 'package:flutter/material.dart';

class CircleLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: 60,
        backgroundColor: Colors.white,
        child: Hero(
          tag: 'logo_horizontal',
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }
}
