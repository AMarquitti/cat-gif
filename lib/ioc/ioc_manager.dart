import 'package:flutter/foundation.dart';

import '../integrations/environments/environment_config.dart';
import '../integrations/helpers/http_helper.dart';
import '../integrations/packages/dio/dio_http_helper.dart';
import '../integrations/packages/get_it/get_it_injetor.dart';
import 'injector.dart';

abstract class IocManager {
  static void register() {
    final Injector injector = Injector.register(GetItInjector());
    if (kIsWeb) {
      _registerWeb(injector);
    } else {
      _registerMobile(injector);
    }
  }

  static void _registerMobile(Injector injector) {
    _registerCommons(injector);
  }

  static void _registerWeb(Injector injector) {
    _registerCommons(injector);
  }

  static void _registerCommons(Injector injector) {
    injector.registerFactoryByName(
      () => EnvironmentConfig.baseUrl,
      'baseUrl',
    );
    injector.registerLazySingleton<HttpHelper>(() => DioHttpHelper());
  }
}
