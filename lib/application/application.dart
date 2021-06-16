import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../features/home/home_feature.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeFeature.splash,
      routes: generateRoutes(),
      onGenerateTitle: (BuildContext context) => 'app_title',
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }

  Map<String, WidgetBuilder> generateRoutes() {
    return <String, WidgetBuilder>{
      ...HomeFeature.generateRoutes(),
    };
  }
}
