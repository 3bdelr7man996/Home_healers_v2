import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/cubit/auth_cubit.dart';

MultiBlocProvider blocMultiProvider({required child}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (BuildContext context) => AuthCubit(),
      ),
    ],
    child: child,
  );
}
