import 'package:dr/Patient/features/auth/data/datasources/patient_signIn_ds.dart';
import 'package:dr/Patient/features/auth/data/datasources/patient_signUp_ds.dart';
import 'package:dr/Patient/features/auth/data/repositories/patient_signIn_repo.dart';
import 'package:dr/Patient/features/auth/data/repositories/patient_signUp_repo.dart';
import 'package:dr/Patient/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/Patient/features/home/data/datasources/filter_ds.dart';
import 'package:dr/Patient/features/home/data/datasources/reservation_ds.dart';
import 'package:dr/Patient/features/home/data/datasources/search_ds.dart';
import 'package:dr/Patient/features/home/data/datasources/section_ds.dart';
import 'package:dr/Patient/features/home/data/repositories/filter_repo.dart';
import 'package:dr/Patient/features/home/data/repositories/reservation_repo.dart';
import 'package:dr/Patient/features/home/data/repositories/search_repo.dart';
import 'package:dr/Patient/features/home/data/repositories/section_repo.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_cubit.dart';
import 'package:dr/Patient/features/setting/data/datasources/my_orders_ds.dart';
import 'package:dr/Patient/features/setting/data/datasources/update_info_ds.dart';
import 'package:dr/Patient/features/setting/data/datasources/update_reservation_ds.dart';
import 'package:dr/Patient/features/setting/data/repositories/my_orders_repo.dart';
import 'package:dr/Patient/features/setting/data/repositories/update_info_repo.dart';
import 'package:dr/Patient/features/setting/data/repositories/update_reservation_repo.dart';
import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:dr/doctor/features/auth/data/data_source/advertise_signup_ds.dart';
import 'package:dr/doctor/features/auth/data/repository/advertise_signup_repo.dart';
import 'package:dr/doctor/features/settings/data/data_source/settings_ds.dart';
import 'package:dr/doctor/features/settings/data/repository/settings_repo.dart';
import 'package:dr/doctor/features/settings/presentation/cubit/setting_cubit.dart';
import 'package:dr/features/auth/data/datasources/login_ds.dart';
import 'package:dr/features/auth/data/repositories/login_repo.dart';
import 'package:dr/features/auth/presentation/cubit/login_cubit.dart';
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
  sl.registerLazySingleton(() => LoginDs(apiHelper: sl()));

  //REPOSITORIES
  sl.registerLazySingleton(() => SignUpAdvertiserRepo(dataSource: sl()));
  sl.registerLazySingleton(() => ReservationOrdersRepo(dataSource: sl()));
  sl.registerLazySingleton(() => DiagnoseReportRepo(dataSource: sl()));
  sl.registerLazySingleton(() => SettingsRepo(dataSource: sl()));
  sl.registerLazySingleton(() => LoginRepo(dataSource: sl()));

  //CUBITS
  sl.registerFactory(() => AuthCubit(signUpAdverRepo: sl()));
  sl.registerFactory(() => ReservationsCubit(repository: sl()));
  sl.registerFactory(() => DiagnoseFormCubit(repository: sl()));
  sl.registerFactory(() => SettingCubit(repository: sl()));
  sl.registerFactory(() => LoginCubit(repository: sl()));

  //PATIENT DATA SOURCE
  sl.registerLazySingleton(() => PatientSignUpDS(apiHelper: sl()));
  sl.registerLazySingleton(() => PatientSignInDS(apiHelper: sl()));
  sl.registerLazySingleton(() => SectionDS(apiHelper: sl()));
  sl.registerLazySingleton(() => FilterDs(apiHelper: sl()));
  sl.registerLazySingleton(() => SearchDS(apiHelper: sl()));
  sl.registerLazySingleton(() => reservationDs(apiHelper: sl()));
  sl.registerLazySingleton(() => MyOrdersDS(apiHelper: sl()));
  sl.registerLazySingleton(() => UpdateReservationDS(apiHelper: sl()));
  sl.registerLazySingleton(() => UpdateInfoDS(apiHelper: sl()));

  //PATIENT REPOSITORIES
  sl.registerLazySingleton(() => SignUpAdvertiserRepo(dataSource: sl()));
  sl.registerLazySingleton(() => SignUpPatientRepo(dataSource: sl()));
  sl.registerLazySingleton(() => SignInPatientRepo(dataSource: sl()));
  sl.registerLazySingleton(() => SectionRepo(dataSource: sl()));
  sl.registerLazySingleton(() => FilterRepo(dataSource: sl()));
  sl.registerLazySingleton(() => SearchRepo(dataSource: sl()));
  sl.registerLazySingleton(() => ReservationRepo(dataSource: sl()));
  sl.registerLazySingleton(() => MyOrdersRepo(dataSource: sl()));
  sl.registerLazySingleton(() => UpdateReservationRepo(dataSource: sl()));
  sl.registerLazySingleton(() => UpdateInfoRepo(dataSource: sl()));

  //PATIENT CUBITS
  sl.registerFactory(() => AuthCubit(signUpAdverRepo: sl()));
  sl.registerFactory(() => AuthCubitForPatient(signUpPatientRepo: sl()));
  sl.registerFactory(() => SignInCubitForPatient(signInPatientRepo: sl()));
  sl.registerFactory(() => SectionCubit(sectionRepo: sl()));
  sl.registerFactory(() => FilterCubit(filterRepo: sl()));
  sl.registerFactory(() => ReservationCubit(reservationRepo: sl()));
  sl.registerFactory(() => MyOrdersCubit(myOrdersRepo: sl()));
  sl.registerFactory(() => UpdateReservationCubit(updateReservationRepo: sl()));
  sl.registerFactory(() => UpdateInfoCubit(UpdateInfo: sl()));
}
