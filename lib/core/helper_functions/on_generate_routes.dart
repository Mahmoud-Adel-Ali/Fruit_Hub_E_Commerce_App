import 'package:flutter/material.dart';

import '../../features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
