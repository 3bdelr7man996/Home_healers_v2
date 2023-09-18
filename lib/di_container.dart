import 'package:dr/Patient/features/auth/data/datasources/patient_signIn_ds.dart';
import 'package:dr/Patient/features/auth/data/datasources/patient_signUp_ds.dart';
import 'package:dr/Patient/features/auth/data/repositories/patient_signIn_repo.dart';
import 'package:dr/Patient/features/auth/data/repositories/patient_signUp_repo.dart';
import 'package:dr/Patient/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/Patient/features/home/data/datasources/section_ds.dart';
import 'package:dr/Patient/features/home/data/repositories/section_repo.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_cubit.dart';
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
  sl.registerLazySingleton(() => ApiBaseHelper(AppStrings.divUrl));

  //data source class
  sl.registerLazySingleton(() => AdvertiseSignUpDS(apiHelper: sl()));
  sl.registerLazySingleton(() => PatientSignUpDS(apiHelper: sl()));
  sl.registerLazySingleton(() => PatientSignInDS(apiHelper: sl()));
  sl.registerLazySingleton(() => SectionDS(apiHelper: sl()));

  //REPOSITORIES
  sl.registerLazySingleton(() => SignUpAdvertiserRepo(dataSource: sl()));
  sl.registerLazySingleton(() => SignUpPatientRepo(dataSource: sl()));
  sl.registerLazySingleton(() => SignInPatientRepo(dataSource: sl()));
  sl.registerLazySingleton(() => SectionRepo(dataSource: sl()));

  //CUBITS
  sl.registerFactory(() => AuthCubit(signUpAdverRepo: sl()));
  sl.registerFactory(() => AuthCubitForPatient(signUpPatientRepo: sl()));
  sl.registerFactory(() => SignInCubitForPatient(signInPatientRepo: sl()));
  sl.registerFactory(() => SectionCubit(sectionRepo: sl()));
}
