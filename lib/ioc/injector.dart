typedef FactoryFunc<T extends Object> = T Function();

abstract class Injector {
  static late Injector instance;
  void registerFactory<T extends Object>(FactoryFunc<T> factoryFunc);

  void registerFactoryByName<T extends Object>(
      FactoryFunc<T> factoryFunc, String name);

  void registerSingleton<T extends Object>(T instance);

  void registerLazySingleton<T extends Object>(FactoryFunc<T> factoryFunc);

  void registerLazySingletonByName<T extends Object>(
      FactoryFunc<T> factoryFunc, String name);

  void clear();

  void resetLazySingleton<T extends Object>({Object? instance});

  T resolve<T extends Object>();

  bool isRegistred<T extends Object>({Object instance, String instanceName});

  T resolveByName<T extends Object>(String name);

  static Injector register(Injector implementation) {
    return instance = implementation;
  }
}
