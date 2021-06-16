import 'package:flutter/material.dart';

import '../../../../application/presentation/layouts/layout_main.dart';
import '../../../../application/presentation/widgets/localization_icon.dart';
import '../widgets/circle_logo.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.catGifComponent}) : super(key: key);
  final Widget catGifComponent;

  @override
  Widget build(BuildContext context) {
    return LayoutMain(
        title: 'CatHome',
        stackElement: Column(
          children: <Widget>[
            const SizedBox(height: 80),
            CircleLogo(),
          ],
        ),
        leftChild: LocalizationIcon(),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 60),
            catGifComponent,
          ],
        ));
  }
}
