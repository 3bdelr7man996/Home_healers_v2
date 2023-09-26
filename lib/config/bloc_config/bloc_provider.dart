import 'package:dr/Patient/features/auth/data/repositories/patient_signIn_repo.dart';
import 'package:dr/Patient/features/auth/data/repositories/patient_signUp_repo.dart';
import 'package:dr/Patient/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/Patient/features/home/data/repositories/filter_repo.dart';
import 'package:dr/Patient/features/home/data/repositories/reservation_repo.dart';
import 'package:dr/Patient/features/home/data/repositories/search_repo.dart';
import 'package:dr/Patient/features/home/data/repositories/section_repo.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_cubit.dart';
import 'package:dr/Patient/features/setting/data/repositories/my_orders_repo.dart';
import 'package:dr/Patient/features/setting/data/repositories/update_info_repo.dart';
import 'package:dr/Patient/features/setting/data/repositories/update_reservation_repo.dart';
import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:dr/doctor/features/auth/data/repository/advertise_signup_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dr/di_container.dart' as di;

import '../../Patient/features/auth/data/datasources/patient_signUp_ds.dart';
import '../../doctor/features/auth/presentation/cubit/auth_cubit.dart';

MultiBlocProvider blocMultiProvider({required child}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (BuildContext context) =>
            AuthCubit(signUpAdverRepo: di.sl<SignUpAdvertiserRepo>()),
      ),
      BlocProvider(
        create: (BuildContext context) => AuthCubitForPatient(
          signUpPatientRepo: di.sl<SignUpPatientRepo>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => SignInCubitForPatient(
          signInPatientRepo: di.sl<SignInPatientRepo>(),
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
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => MyOrdersCubit(
          myOrdersRepo: di.sl<MyOrdersRepo>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => UpdateReservationCubit(
          updateReservationRepo: di.sl<UpdateReservationRepo>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => UpdateInfoCubit(
          UpdateInfo: di.sl<UpdateInfoRepo>(),
        ),
      ),
    ],
    child: child,
  );
}
