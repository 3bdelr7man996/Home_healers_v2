import 'package:dr/Patient/features/auth/data/repositories/patient_signUp_repo.dart';
import 'package:dr/Patient/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/Patient/features/favorite/data/repositories/favorite_repo.dart';
import 'package:dr/Patient/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:dr/Patient/features/home/data/repositories/filter_repo.dart';
import 'package:dr/Patient/features/home/data/repositories/get_all_ads_repo.dart';
import 'package:dr/Patient/features/home/data/repositories/reservation_repo.dart';
import 'package:dr/Patient/features/home/data/repositories/reservation_with_offer_repo.dart';
import 'package:dr/Patient/features/home/data/repositories/search_repo.dart';
import 'package:dr/Patient/features/home/data/repositories/section_repo.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_cubit.dart';
import 'package:dr/Patient/features/offer/data/repositories/get_offers_Repo.dart';
import 'package:dr/Patient/features/offer/data/repositories/get_packages_repo.dart';
import 'package:dr/Patient/features/offer/presentation/cubit/offer_cubit.dart';
import 'package:dr/Patient/features/payment/data/repositories/payment_repo.dart';
import 'package:dr/Patient/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:dr/Patient/features/setting/data/repositories/add_report_repo.dart';
import 'package:dr/Patient/features/setting/data/repositories/evaluation_repo.dart';
import 'package:dr/Patient/features/setting/data/repositories/my_orders_repo.dart';
import 'package:dr/Patient/features/setting/data/repositories/my_points_repo.dart';
import 'package:dr/Patient/features/setting/data/repositories/reports_repo.dart';
import 'package:dr/Patient/features/setting/data/repositories/show_notification_repo.dart';
import 'package:dr/Patient/features/setting/data/repositories/update_info_repo.dart';
import 'package:dr/Patient/features/setting/data/repositories/update_reservation_repo.dart';
import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:dr/doctor/features/chats/data/repositories/chats_repo.dart';
import 'package:dr/doctor/features/chats/presentation/cubit/audio_cubit/audio_cubit.dart';
import 'package:dr/doctor/features/chats/presentation/cubit/chat_cubit/chats_cubit.dart';
import 'package:dr/doctor/features/chats/presentation/cubit/record_cubit/record_cubit.dart';
import 'package:dr/doctor/features/diagnose_report/presentation/cubit/diagnose_form_cubit.dart';
import 'package:dr/doctor/features/home/data/repositories/reservation_orders_repo.dart';
import 'package:dr/doctor/features/home/presentation/cubit/resevations_cubit/reservations_cubit.dart';
import 'package:dr/doctor/features/notification/presentation/cubit/notification_cubit.dart';
import 'package:dr/doctor/features/settings/data/repository/settings_repo.dart';
import 'package:dr/doctor/features/settings/presentation/cubit/setting_cubit.dart';
import 'package:dr/features/auth/data/repositories/forget_password_repo.dart';
import 'package:dr/features/auth/presentation/cubit/forget_cubit/forget_password_cubit.dart';
import 'package:dr/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dr/di_container.dart' as di;

import '../../doctor/features/auth/presentation/cubit/auth_cubit.dart';
import '../../doctor/features/diagnose_report/data/repositories/diagnose_report_repo.dart';

MultiBlocProvider blocMultiProvider({required child}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (BuildContext context) => di.sl<AuthCubit>(),
      ),
      BlocProvider(
        create: (BuildContext context) => di.sl<NotificationCubit>(),
      ),
      BlocProvider(
        create: (BuildContext context) => di.sl<AddFavoriteCubit>(),
      ),
      BlocProvider(
        create: (BuildContext context) => di.sl<LoginCubit>(),
      ),
      BlocProvider(
        create: (BuildContext context) =>
            ReservationsCubit(repository: di.sl<ReservationOrdersRepo>()),
      ),
      BlocProvider(
        create: (BuildContext context) =>
            DiagnoseFormCubit(repository: di.sl<DiagnoseReportRepo>()),
      ),
      BlocProvider(
        create: (BuildContext context) =>
            SettingCubit(repository: di.sl<SettingsRepo>()),
      ),
      BlocProvider(
        create: (BuildContext context) => AuthCubitForPatient(
          signUpPatientRepo: di.sl<SignUpPatientRepo>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => SectionCubit(
          sectionRepo: di.sl<SectionRepo>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => FilterCubit(
          filterRepo: di.sl<FilterRepo>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => SearchCubit(
          searchRepo: di.sl<SearchRepo>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => ReservationCubit(
            reservationRepo: di.sl<ReservationRepo>(),
            reservationWithOfferRepo: di.sl<ReservationWithOfferRepo>()),
      ),
      BlocProvider(
        create: (BuildContext context) => MyOrdersCubit(
            showNotificationRepo: di.sl<ShowNotificationRepo>(),
            showBillRepo: di.sl<ShowBillRepo>(),
            myOrdersRepo: di.sl<MyOrdersRepo>(),
            getInvoiceRepo: di.sl<GetInvoiceRepo>()),
      ),
      BlocProvider(
        create: (BuildContext context) => UpdateReservationCubit(
          updateReservationRepo: di.sl<UpdateReservationRepo>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => FavoriteCubit(
          favoriteRepo: di.sl<FavoriteRepo>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => UpdateInfoCubit(
          UpdateInfo: di.sl<UpdateInfoRepo>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => GetPackagesCubit(
          getPackagesRepo: di.sl<GetPackagesRepo>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => GetOffersCubit(
          getOffersRepo: di.sl<GetOffersRepo>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => GetAllAdsCubit(
          getAllAdsRepo: di.sl<GetAllAdsRepo>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => PaymentCubit(
          repository: di.sl<PaymentRepository>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => ForgetPasswordCubit(
          repository: di.sl<ForgetPasswordRepo>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => GetPointsCubit(
          getPointrepo: di.sl<GetPointsRepo>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => evaluationCubit(
          eevaluationsRepo: di.sl<evaluationsRepo>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => ReportsCubit(
          repositry: di.sl<ReportsRepo>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => AddReportCubit(
          repositry: di.sl<AddReportRepo>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => ChatsCubit(
          chatsRepo: di.sl<ChatsRepo>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => RecorderCubit(),
      ),
      BlocProvider(
        create: (BuildContext context) => AudioCubit(),
      ),
    ],
    child: child,
  );
}
