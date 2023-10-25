import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/doctor/features/settings/presentation/cubit/setting_cubit.dart';
import 'package:dr/doctor/features/settings/presentation/widgets/points_widgets/points_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyPointScreen extends StatefulWidget {
  const MyPointScreen({super.key});

  @override
  State<MyPointScreen> createState() => _MyPointScreenState();
}

class _MyPointScreenState extends State<MyPointScreen> {
  @override
  void initState() {
    context.read<SettingCubit>().doctorPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        backButton: true,
        fromSetting: true,
        title: "my_point",
      ),
      // bottomNavigationBar: CustomBottomNavigation(selectedIndex: 3),
      body: const PointsBody(),
    );
  }
}
