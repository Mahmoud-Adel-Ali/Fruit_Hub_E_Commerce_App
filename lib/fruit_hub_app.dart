import 'package:flutter/material.dart';

import 'features/splash/presentation/views/widgets/splash_view.dart';

class FruitHubApp extends StatelessWidget {
  const FruitHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit Hub App',
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
