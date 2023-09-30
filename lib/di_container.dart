import 'package:dr/doctor/features/auth/data/data_source/advertise_signup_ds.dart';
import 'package:dr/doctor/features/auth/data/repository/advertise_signup_repo.dart';
import 'package:dr/doctor/features/settings/data/data_source/settings_ds.dart';
import 'package:dr/doctor/features/settings/data/repository/settings_repo.dart';
import 'package:dr/doctor/features/settings/presentation/cubit/setting_cubit.dart';
import 'package:get_it/get_it.dart';

import 'core/utils/app_strings.dart';
import 'core/utils/http_helper.dart';
import 'doctor/features/auth/presentation/cubit/auth_cubit.dart';
import 'doctor/features/diagnose_report/data/datasources/diagnose_report_ds.dart';
import 'doctor/features/diagnose_report/presentation/cubit/diagnose_form_cubit.dart';
import 'doctor/features/home/data/datasources/reservations_orders_ds.dart';
import 'doctor/features/diagnose_report/data/repositories/diagnose_report_repo.dart';
import 'doctor/features/home/data/repositories/reservation_orders_repo.dart';
import 'doctor/features/home/presentation/cubit/resevations_cubit/reservations_cubit.dart';

final sl = GetIt.instance;

Future<void> serviceLocatorInit() async {
  sl.allowReassignment = true;

  // Core
  sl.registerLazySingleton(() => ApiBaseHelper(AppStrings.divUrl));

  //data source class
  sl.registerLazySingleton(() => AdvertiseSignUpDS(apiHelper: sl()));
  sl.registerLazySingleton(() => ReservationOrdersDS(apiHelper: sl()));
  sl.registerLazySingleton(() => DiagnosereportDs(apiHelper: sl()));
  sl.registerLazySingleton(() => SettingsDs(apiHelper: sl()));

  //REPOSITORIES
  sl.registerLazySingleton(() => SignUpAdvertiserRepo(dataSource: sl()));
  sl.registerLazySingleton(() => ReservationOrdersRepo(dataSource: sl()));
  sl.registerLazySingleton(() => DiagnoseReportRepo(dataSource: sl()));
  sl.registerLazySingleton(() => SettingsRepo(dataSource: sl()));

  //CUBITS
  sl.registerFactory(() => AuthCubit(signUpAdverRepo: sl()));
  sl.registerFactory(() => ReservationsCubit(repository: sl()));
  sl.registerFactory(() => DiagnoseFormCubit(repository: sl()));
  sl.registerFactory(() => SettingCubit(repository: sl()));
}
