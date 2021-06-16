
import 'package:get_it/get_it.dart';

import '../../../ioc/injector.dart';

class GetItInjector implements Injector {
  final GetIt _getIt = GetIt.instance;

  @override
  void registerFactory<T extends Object>(T Function() factoryFunc) {
    if (_getIt.isRegistered<T>()) {
      _getIt.unregister<T>();
    }

    _getIt.registerFactory<T>(factoryFunc);
  }

  @override
  void registerLazySingleton<T extends Object>(T Function() factoryFunc) {
    if (_getIt.isRegistered<T>()) {
      _getIt.unregister<T>();
    }
    _getIt.registerLazySingleton(factoryFunc);
  }

  @override
  void clear() {
    _getIt.reset();
  }

  @override
  T resolve<T extends Object>() {
    return _getIt.get<T>();
  }

  @override
  T resolveByName<T extends Object>(String name) {
    return _getIt.get<T>(
      instanceName: name,
    );
  }

  @override
  void registerFactoryByName<T extends Object>(
      T Function() factoryFunc, String name) {
    if (_getIt.isRegistered<T>(instanceName: name)) {
      _getIt.unregister<T>(instanceName: name);
    }
    _getIt.registerFactory<T>(
      factoryFunc,
      instanceName: name,
    );
  }

  @override
  void registerLazySingletonByName<T extends Object>(
      T Function() factoryFunc, String name) {
    _getIt.registerLazySingleton<T>(
      factoryFunc,
      instanceName: name,
    );
  }

  @override
  void registerSingleton<T extends Object>(T instance) {
    if (_getIt.isRegistered<T>()) {
      _getIt.unregister<T>();
    }
    _getIt.registerSingleton<T>(instance);
  }

  @override
  bool isRegistred<T extends Object>({Object? instance, String? instanceName}) {
    if (instanceName != null) {
      return _getIt.isRegistered<T>(instanceName: instanceName);
    }
    return _getIt.isRegistered<T>();
  }

  @override
  void resetLazySingleton<T extends Object>({Object? instance}) {
    if (instance != null) {
      _getIt.resetLazySingleton<T>(instance: instance);
      return;
    }
    _getIt.resetLazySingleton<T>();
  }
}
