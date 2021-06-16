import 'package:flutter/material.dart';

import 'application/application.dart';
import 'ioc/ioc_manager.dart';

Future<void> main() async {
  await init();
  runApp(Application());
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  IocManager.register();
}
