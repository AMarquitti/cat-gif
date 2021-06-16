import 'package:flutter/material.dart';

import '../../../core/res/color_palette.dart';

class LayoutMain extends StatelessWidget {
  const LayoutMain(
      {Key? key,
      required this.child,
      this.leftChild = const Center(),
      this.title = '',
      this.subtitle = '',
      this.heightFactor = 150,
      this.enableLogo = true,
      this.bottomNavigationBar = const SizedBox.shrink(),
      this.floatingButton = const SizedBox.shrink(),
      this.appBar = const SizedBox.shrink(),
      this.sideBar = false,
      this.drawer = const SizedBox.shrink(),
      this.scaffoldKey,
      this.stackElement = const SizedBox.shrink(),
      this.borderAngle = 45})
      : super(key: key);

  final Widget child;
  final Widget leftChild;
  final Widget stackElement;
  final bool sideBar;
  final bool enableLogo;
  final Widget bottomNavigationBar;
  final Widget floatingButton;
  final String title;
  final String subtitle;
  final double heightFactor;
  final double borderAngle;
  final Widget drawer;
  final Widget appBar;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constrains) {
      return buildVerticalLayout(context);
    });
  }

  Widget buildHorizontalLayout(BuildContext context) {
    final GlobalKey<ScaffoldState> globalKey =
        scaffoldKey ?? GlobalKey<ScaffoldState>();
    return Scaffold(
      key: globalKey,
      floatingActionButton: floatingButton,
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: ColorPalette.backgroundColor,
      drawer: drawer,
      body: Center(
        child: SizedBox(
          width: 480,
          child: _buildBody(context),
        ),
      ),
    );
  }

  Widget buildVerticalLayout(BuildContext context) {
    final GlobalKey<ScaffoldState> globalKey =
        scaffoldKey ?? GlobalKey<ScaffoldState>();

    return Scaffold(
        key: globalKey,
        floatingActionButton: floatingButton,
        bottomNavigationBar: bottomNavigationBar,
        backgroundColor: ColorPalette.backgroundColor,
        drawer: drawer,
        body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: bottomNavigationBar,
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                colors: <Color>[
                  ColorPalette.primaryColor,
                  ColorPalette.primaryColorDark
                ],
                center: Alignment.topRight,
                radius: 2.0,
              ),
            ),
            child: const SafeArea(
              child: Padding(
                padding: EdgeInsets.all(33),
                child: Text(
                  'Gif Cat APP',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 150),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
