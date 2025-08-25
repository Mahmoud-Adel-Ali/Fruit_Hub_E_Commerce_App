import 'package:get_it/get_it.dart';

import '../../features/auth/data/repos/auth_repo_impl.dart';
import '../../features/auth/domain/repos/auth_repo.dart';
import '../databases/cach_helper.dart';
import 'firebase_auth_service.dart';

final getit = GetIt.instance;

void setupServicesLocator() {
  getit.registerSingleton<CacheHelper>(CacheHelper());
  getit.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getit.registerSingleton<AuthRepo>(
    AuthRepoImpl(firebaseAuthService: getit<FirebaseAuthService>()),
  );
}
