import 'package:dr/doctor/features/auth/data/repository/advertise_signup_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dr/di_container.dart' as di;

import '../../doctor/features/auth/presentation/cubit/auth_cubit.dart';

MultiBlocProvider blocMultiProvider({required child}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (BuildContext context) =>
            AuthCubit(signUpAdverRepo: di.sl<SignUpAdvertiserRepo>()),
      ),
    ],
    child: child,
  );
}
