import 'package:dr/doctor/features/auth/data/repository/advertise_signup_repo.dart';
import 'package:dr/doctor/features/diagnose_report/presentation/cubit/diagnose_form_cubit.dart';
import 'package:dr/doctor/features/home/data/repositories/reservation_orders_repo.dart';
import 'package:dr/doctor/features/home/presentation/cubit/resevations_cubit/reservations_cubit.dart';
import 'package:dr/doctor/features/settings/data/repository/settings_repo.dart';
import 'package:dr/doctor/features/settings/presentation/cubit/setting_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dr/di_container.dart' as di;

import '../../doctor/features/auth/presentation/cubit/auth_cubit.dart';
import '../../doctor/features/diagnose_report/data/repositories/diagnose_report_repo.dart';

MultiBlocProvider blocMultiProvider({required child}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (BuildContext context) =>
            AuthCubit(signUpAdverRepo: di.sl<SignUpAdvertiserRepo>()),
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
    ],
    child: child,
  );
}
