import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_e_commerce_app/fruit_hub_app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/databases/cach_helper.dart';
import 'core/services/custom_bloc_observer.dart';
import 'core/services/service_locator.dart';
import 'core/utils/app_keys.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //* Supabase initialization
  await Supabase.initialize(
    url: AppKeys.supabaseUrl,
    anonKey: AppKeys.supabaseAnonKey,
  );

  //* Firebase initialization
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = CustomBlocObserver();
  setupServicesLocator();
  await getit.get<CacheHelper>().init();
  runApp(const FruitHubApp());
}
