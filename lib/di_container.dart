import 'package:dr/Patient/features/auth/data/datasources/patient_signUp_ds.dart';
import 'package:dr/Patient/features/auth/data/repositories/patient_signUp_repo.dart';
import 'package:dr/Patient/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/Patient/features/favorite/data/datasources/addFavorite_ds.dart';
import 'package:dr/Patient/features/favorite/data/datasources/favorite_ds.dart';
import 'package:dr/Patient/features/favorite/data/repositories/addFavorite_repo.dart';
import 'package:dr/Patient/features/favorite/data/repositories/favorite_repo.dart';
import 'package:dr/Patient/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:dr/Patient/features/home/data/datasources/filter_ds.dart';
import 'package:dr/Patient/features/home/data/datasources/get_all_ads_ds.dart';
import 'package:dr/Patient/features/home/data/datasources/reservation_ds.dart';
import 'package:dr/Patient/features/home/data/datasources/reservation_with_offer_ds.dart';
import 'package:dr/Patient/features/home/data/datasources/search_ds.dart';
import 'package:dr/Patient/features/home/data/datasources/section_ds.dart';
import 'package:dr/Patient/features/home/data/repositories/filter_repo.dart';
import 'package:dr/Patient/features/home/data/repositories/get_all_ads_repo.dart';
import 'package:dr/Patient/features/home/data/repositories/reservation_repo.dart';
import 'package:dr/Patient/features/home/data/repositories/reservation_with_offer_repo.dart';
import 'package:dr/Patient/features/home/data/repositories/search_repo.dart';
import 'package:dr/Patient/features/home/data/repositories/section_repo.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_cubit/ads_cubit.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_cubit/filter_cubit.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_cubit/reservation_cubit.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_cubit/secton_cubit.dart';
import 'package:dr/Patient/features/offer/data/datasources/get_offers_ds.dart';
import 'package:dr/Patient/features/offer/data/datasources/get_packages_ds.dart';
import 'package:dr/Patient/features/offer/data/repositories/get_offers_Repo.dart';
import 'package:dr/Patient/features/offer/data/repositories/get_packages_repo.dart';
import 'package:dr/Patient/features/offer/presentation/cubit/offer_cubit.dart';
import 'package:dr/Patient/features/payment/data/datasources/payment_ds.dart';
import 'package:dr/Patient/features/payment/data/repositories/payment_repo.dart';
import 'package:dr/Patient/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:dr/Patient/features/setting/data/datasources/add_report_ds.dart';
import 'package:dr/Patient/features/setting/data/datasources/evaluations_ds.dart';
import 'package:dr/Patient/features/setting/data/datasources/my_orders_ds.dart';
import 'package:dr/Patient/features/setting/data/datasources/my_points_ds.dart';
import 'package:dr/Patient/features/setting/data/datasources/reports_ds.dart';
import 'package:dr/Patient/features/setting/data/datasources/update_info_ds.dart';
import 'package:dr/Patient/features/setting/data/datasources/update_reservation_ds.dart';
import 'package:dr/Patient/features/setting/data/repositories/add_report_repo.dart';
import 'package:dr/Patient/features/setting/data/repositories/evaluation_repo.dart';
import 'package:dr/Patient/features/setting/data/repositories/my_orders_repo.dart';
import 'package:dr/Patient/features/setting/data/repositories/my_points_repo.dart';
import 'package:dr/Patient/features/setting/data/repositories/reports_repo.dart';
import 'package:dr/Patient/features/setting/data/repositories/update_info_repo.dart';
import 'package:dr/Patient/features/setting/data/repositories/update_reservation_repo.dart';
import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:dr/config/pusher_config/pusher_config.dart';
import 'package:dr/doctor/features/auth/data/data_source/advertise_signup_ds.dart';
import 'package:dr/doctor/features/auth/data/repository/advertise_signup_repo.dart';
import 'package:dr/doctor/features/chats/data/datasources/chats_ds.dart';
import 'package:dr/doctor/features/chats/data/repositories/chats_repo.dart';
import 'package:dr/doctor/features/chats/presentation/cubit/chats_cubit.dart';
import 'package:dr/doctor/features/notification/data/data_source/notifications_ds.dart';
import 'package:dr/doctor/features/notification/presentation/cubit/notification_cubit.dart';
import 'package:dr/doctor/features/settings/data/data_source/settings_ds.dart';
import 'package:dr/doctor/features/settings/data/repository/settings_repo.dart';
import 'package:dr/doctor/features/settings/presentation/cubit/setting_cubit.dart';
import 'package:dr/features/auth/data/datasources/forget_password_ds.dart';
import 'package:dr/features/auth/data/datasources/login_ds.dart';
import 'package:dr/features/auth/data/repositories/forget_password_repo.dart';
import 'package:dr/features/auth/data/repositories/login_repo.dart';
import 'package:dr/features/auth/presentation/cubit/forget_cubit/forget_password_cubit.dart';
import 'package:dr/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'Patient/features/setting/data/datasources/show_notification_ds.dart';
import 'Patient/features/setting/data/repositories/show_notification_repo.dart';
import 'config/notifications_config/firebase_messages.dart';
import 'config/notifications_config/local_notification_config.dart';
import 'core/utils/app_strings.dart';
import 'core/utils/http_helper.dart';
import 'doctor/features/auth/presentation/cubit/auth_cubit.dart';
import 'doctor/features/diagnose_report/data/datasources/diagnose_report_ds.dart';
import 'doctor/features/diagnose_report/presentation/cubit/diagnose_form_cubit.dart';
import 'doctor/features/home/data/datasources/reservations_orders_ds.dart';
import 'doctor/features/diagnose_report/data/repositories/diagnose_report_repo.dart';
import 'doctor/features/home/data/repositories/reservation_orders_repo.dart';
import 'doctor/features/home/presentation/cubit/resevations_cubit/reservations_cubit.dart';
import 'doctor/features/notification/data/repositories/notifications_repo.dart';

final sl = GetIt.instance;

Future<void> serviceLocatorInit() async {
  sl.allowReassignment = true;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  sl.registerLazySingleton(() => pusher);

  // Core
  sl.registerLazySingleton(() => PusherConfiguration(pusher: sl()));
  sl.registerLazySingleton(() => ApiBaseHelper(AppStrings.baseUrl));
  sl.registerLazySingleton(() => LocalNotificationsService());
  sl.registerLazySingleton(() => FirebaseMessagingService(
        firebaseMessaging: _firebaseMessaging,
        localNotification: sl(),
      ));

  //data source class
  sl.registerLazySingleton(() => AdvertiseSignUpDS(apiHelper: sl()));
  sl.registerLazySingleton(() => ReservationOrdersDS(apiHelper: sl()));
  sl.registerLazySingleton(() => DiagnosereportDs(apiHelper: sl()));
  sl.registerLazySingleton(() => SettingsDs(apiHelper: sl()));
  sl.registerLazySingleton(() => LoginDs(apiHelper: sl()));
  sl.registerLazySingleton(() => NotificationsDs(apiHelper: sl()));
  sl.registerLazySingleton(() => ChatsDS(apiHelper: sl()));

  //REPOSITORIES
  sl.registerLazySingleton(() => SignUpAdvertiserRepo(dataSource: sl()));
  sl.registerLazySingleton(() => ReservationOrdersRepo(dataSource: sl()));
  sl.registerLazySingleton(() => DiagnoseReportRepo(dataSource: sl()));
  sl.registerLazySingleton(() => SettingsRepo(dataSource: sl()));
  sl.registerLazySingleton(() => LoginRepo(dataSource: sl()));
  sl.registerLazySingleton(() => NotificationsRepo(dataSource: sl()));
  sl.registerLazySingleton(() => ChatsRepo(dataSource: sl()));

  //CUBITS
  sl.registerFactory(() => AuthCubit(signUpAdverRepo: sl()));
  sl.registerFactory(() => ReservationsCubit(repository: sl()));
  sl.registerFactory(() => DiagnoseFormCubit(repository: sl()));
  sl.registerFactory(() => SettingCubit(repository: sl()));
  sl.registerFactory(() => LoginCubit(repository: sl()));
  sl.registerFactory(() => NotificationCubit(repository: sl()));
  sl.registerFactory(() => ChatsCubit(chatsRepo: sl()));

  //PATIENT DATA SOURCE
  sl.registerLazySingleton(() => PatientSignUpDS(apiHelper: sl()));
  sl.registerLazySingleton(() => SectionDS(apiHelper: sl()));
  sl.registerLazySingleton(() => FilterDs(apiHelper: sl()));
  sl.registerLazySingleton(() => SearchDS(apiHelper: sl()));
  sl.registerLazySingleton(() => reservationDs(apiHelper: sl()));
  sl.registerLazySingleton(() => MyOrdersDS(apiHelper: sl()));
  sl.registerLazySingleton(() => UpdateReservationDS(apiHelper: sl()));
  sl.registerLazySingleton(() => UpdateInfoDS(apiHelper: sl()));
  sl.registerLazySingleton(() => FavoriteDS(apiHelper: sl()));
  sl.registerLazySingleton(() => AddFavoriteDS(apiHelper: sl()));
  sl.registerLazySingleton(() => PaymentDataSource(apiHelper: sl()));
  sl.registerLazySingleton(() => GetPackagesDS(apiHelper: sl()));
  sl.registerLazySingleton(() => GetOffersDS(apiHelper: sl()));
  sl.registerLazySingleton(() => ReservationWithOfferDS(apiHelper: sl()));
  sl.registerLazySingleton(() => GetAllAdsDS(apiHelper: sl()));
  sl.registerLazySingleton(() => ForgetPasswordDs(apiHelper: sl()));
  sl.registerLazySingleton(() => MyPointsDS(apiHelper: sl()));
  sl.registerLazySingleton(() => evaluationsDS(apiHelper: sl()));
  sl.registerLazySingleton(() => ReportsDS(apiHelper: sl()));
  sl.registerLazySingleton(() => AddReportDS(apiHelper: sl()));
  sl.registerLazySingleton(() => ShowBillDS(apiHelper: sl()));
  sl.registerLazySingleton(() => GetInvoiceDS(apiHelper: sl()));
  sl.registerLazySingleton(() => ShowNotificationDS(apiHelper: sl()));

  //PATIENT REPOSITORIES
  sl.registerLazySingleton(() => SignUpAdvertiserRepo(dataSource: sl()));
  sl.registerLazySingleton(() => SignUpPatientRepo(dataSource: sl()));
  sl.registerLazySingleton(() => SectionRepo(dataSource: sl()));
  sl.registerLazySingleton(() => FilterRepo(dataSource: sl()));
  sl.registerLazySingleton(() => SearchRepo(dataSource: sl()));
  sl.registerLazySingleton(() => ReservationRepo(dataSource: sl()));
  sl.registerLazySingleton(() => MyOrdersRepo(dataSource: sl()));
  sl.registerLazySingleton(() => UpdateReservationRepo(dataSource: sl()));
  sl.registerLazySingleton(() => UpdateInfoRepo(dataSource: sl()));
  sl.registerLazySingleton(() => FavoriteRepo(dataSource: sl()));
  sl.registerLazySingleton(() => AddFavoriteRepo(dataSource: sl()));
  sl.registerLazySingleton(() => GetPackagesRepo(dataSource: sl()));
  sl.registerLazySingleton(() => GetOffersRepo(dataSource: sl()));
  sl.registerLazySingleton(() => ReservationWithOfferRepo(dataSource: sl()));
  sl.registerLazySingleton(() => GetAllAdsRepo(dataSource: sl()));
  sl.registerLazySingleton(() => PaymentRepository(dataSource: sl()));
  sl.registerLazySingleton(() => ForgetPasswordRepo(dataSource: sl()));
  sl.registerLazySingleton(() => GetPointsRepo(dataSource: sl()));
  sl.registerLazySingleton(() => evaluationsRepo(dataSource: sl()));
  sl.registerLazySingleton(() => ReportsRepo(dataSource: sl()));
  sl.registerLazySingleton(() => AddReportRepo(dataSource: sl()));
  sl.registerLazySingleton(() => ShowBillRepo(dataSource: sl()));
  sl.registerLazySingleton(() => GetInvoiceRepo(dataSource: sl()));
  sl.registerLazySingleton(() => ShowNotificationRepo(dataSource: sl()));

  //PATIENT CUBITS
  sl.registerFactory(() => AuthCubit(signUpAdverRepo: sl()));
  sl.registerFactory(() => AuthCubitForPatient(signUpPatientRepo: sl()));
  sl.registerFactory(() => SectionCubit(sectionRepo: sl()));
  sl.registerFactory(() => FilterCubit(filterRepo: sl()));
  sl.registerFactory(() =>
      ReservationCubit(reservationRepo: sl(), reservationWithOfferRepo: sl()));
  sl.registerFactory(() => MyOrdersCubit(
      myOrdersRepo: sl(),
      showBillRepo: sl(),
      getInvoiceRepo: sl(),
      showNotificationRepo: sl()));
  sl.registerFactory(() => UpdateReservationCubit(updateReservationRepo: sl()));
  sl.registerFactory(() => UpdateInfoCubit(UpdateInfo: sl()));
  sl.registerFactory(() => FavoriteCubit(favoriteRepo: sl()));
  sl.registerFactory(() => AddFavoriteCubit(addFavoriteRepo: sl()));
  sl.registerFactory(() => GetPackagesCubit(getPackagesRepo: sl()));
  sl.registerFactory(() => GetOffersCubit(getOffersRepo: sl()));
  sl.registerFactory(() => GetAllAdsCubit(getAllAdsRepo: sl()));
  sl.registerFactory(() => PaymentCubit(repository: sl()));
  sl.registerFactory(() => ForgetPasswordCubit(repository: sl()));
  sl.registerFactory(() => GetPointsCubit(getPointrepo: sl()));
  sl.registerFactory(() => evaluationCubit(eevaluationsRepo: sl()));
  sl.registerFactory(() => ReportsCubit(repositry: sl()));
  sl.registerFactory(() => AddReportCubit(repositry: sl()));
}
