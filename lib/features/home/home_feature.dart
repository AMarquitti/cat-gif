import 'package:flutter/material.dart';

import '../../integrations/helpers/http_helper.dart';
import '../../ioc/injector.dart';
import 'data/remote/cat_remote_repository.dart';
import 'domain/use_cases/implementation/get_cat_gif_impl_use_case.dart';
import 'presentation/components/cat_gif_component.dart';
import 'presentation/cubits/cat_cubit/cat_cubit.dart';
import 'presentation/page/home_page.dart';
import 'presentation/page/splash_page.dart';

class HomeFeature {
  static const String splash = '/';
  static const String home = '/home';

  static Map<String, WidgetBuilder> generateRoutes() {
    return <String, WidgetBuilder>{
      splash: (_) => HomeFeature()._buildSplash(),
      home: (_) => HomeFeature()._buildHome(),
    };
  }

  static Future<void> navigateToHome(BuildContext context) {
    return Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder<Object>(
          transitionDuration: const Duration(seconds: 1),
          pageBuilder: (_, __, ___) => HomeFeature()._buildHome(),
          transitionsBuilder: (_, __, ___, Widget child) {
            return child;
          },
        ),
        (_) => false);
  }

  Widget _buildSplash() {
    return const SplashPage();
  }

  Widget _buildHome() {
    return HomePage(
      catGifComponent: _buildCatGifComponent(),
    );
  }

  Widget _buildCatGifComponent() {
    return CatGifComponent(
      baseUrl: Injector.instance.resolveByName('baseUrl'),
      catCubit: CatCubit(
        GetCatGifImplUseCase(
          CatRemoteRepository(
            Injector.instance.resolveByName('baseUrl'),
            Injector.instance.resolve<HttpHelper>(),
          ),
        ),
      ),
    );
  }
}
