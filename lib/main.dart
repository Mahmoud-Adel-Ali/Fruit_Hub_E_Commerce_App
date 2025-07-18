import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub_e_commerce_app/fruit_hub_app.dart';

import 'core/databases/cach_helper.dart';
import 'core/services/service_locator.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupServicesLocator();
  await getit.get<CacheHelper>().init();
  runApp(const FruitHubApp());
}
