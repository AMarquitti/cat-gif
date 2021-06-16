import 'package:flutter/material.dart';

import '../../../../core/res/color_palette.dart';
import '../../home_feature.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    _animationController.addStatusListener(
        (AnimationStatus status) => _onCompleteAnimation(status));
    super.initState();
  }

  void _onCompleteAnimation(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      HomeFeature.navigateToHome(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalette.backgroundColor,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: FadeTransition(
                        opacity: _animationController,
                        child: Hero(
                          tag: 'logo_horizontal',
                          child: Padding(
                            padding: const EdgeInsets.all(33),
                            child: AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Image.asset('assets/images/logo.png')),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: FadeTransition(
                        opacity: _animationController,
                        child: const Text('Demo V 0.0.1'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
