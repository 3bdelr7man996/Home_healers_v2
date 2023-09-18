import 'package:dr/Patient/features/auth/data/repositories/patient_signIn_repo.dart';
import 'package:dr/Patient/features/auth/data/repositories/patient_signUp_repo.dart';
import 'package:dr/Patient/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/Patient/features/home/data/repositories/section_repo.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_cubit.dart';
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
    ],
    child: child,
  );
}
