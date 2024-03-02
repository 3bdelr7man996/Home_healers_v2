import 'package:dr/doctor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/sign_up/signup_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_app_bar.dart';

final formKey = GlobalKey<FormState>();

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    context.read<AuthCubit>().initRegisterData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context),
        body: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            // if (state.registerState == RequestState.success) {
            //   AppConstants.pushRemoveNavigator(context,
            //       screen: const HomeScreen(selectedIndex: 0));
            // }
          },
          child: SignUpBody(),
        ));
  }
}
