import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_e_commerce_app/fruit_hub_app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/databases/cach_helper.dart';
import 'core/services/custom_bloc_observer.dart';
import 'core/services/service_locator.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //* Supabase initialization
  await Supabase.initialize(
    url: 'https://cxnyjymtbjeorfgnvbcx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN4bnlqeW10Ymplb3JmZ252YmN4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjQyNTgzMjMsImV4cCI6MjA3OTgzNDMyM30.aqan6QNu4aKqOCfcBKBgsTSSJDuIG93aE9a9cG-XmTU',
  );

  //* Firebase initialization
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = CustomBlocObserver();
  setupServicesLocator();
  await getit.get<CacheHelper>().init();
  runApp(const FruitHubApp());
}
