import 'package:get_it/get_it.dart';

import '../databases/cach_helper.dart';

final getit = GetIt.instance;
void setupServicesLocator() {
  getit.registerSingleton<CacheHelper>(CacheHelper());
}
