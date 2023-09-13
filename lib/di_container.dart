import 'package:dr/doctor/features/auth/data/data_source/advertise_signup_ds.dart';
import 'package:dr/doctor/features/auth/data/repository/advertise_signup_repo.dart';
import 'package:get_it/get_it.dart';

import 'core/utils/app_strings.dart';
import 'core/utils/http_helper.dart';
import 'doctor/features/auth/presentation/cubit/auth_cubit.dart';

final sl = GetIt.instance;

Future<void> serviceLocatorInit() async {
  sl.allowReassignment = true;

  // Core
  sl.registerLazySingleton(() => ApiBaseHelper(AppStrings.baseUrl));

  //data source class
  sl.registerLazySingleton(() => AdvertiseSignUpDS(apiHelper: sl()));

  //REPOSITORIES
  sl.registerLazySingleton(() => SignUpAdvertiserRepo(dataSource: sl()));

  //CUBITS
  sl.registerFactory(() => AuthCubit(signUpAdverRepo: sl()));
}
