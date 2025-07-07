import 'package:flutter/material.dart';
import 'package:fruit_hub_e_commerce_app/fruit_hub_app.dart';

import 'core/databases/cach_helper.dart';
import 'core/services/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServicesLocator();
  await getit.get<CacheHelper>().init();
  runApp(const FruitHubApp());
}
