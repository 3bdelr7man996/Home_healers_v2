import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/doctor/features/home/presentation/cubit/resevations_cubit/reservations_cubit.dart';
import 'package:dr/doctor/features/home/presentation/widgets/my_reservations_widget/my_reservations_body.dart';
import 'package:dr/doctor/features/home/presentation/widgets/my_reservations_widget/reservations_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyReservationScreen extends StatefulWidget {
  final int statusId;

  const MyReservationScreen({super.key, required this.statusId});
  @override
  State<MyReservationScreen> createState() => _MyReservationScreenState();
}

class _MyReservationScreenState extends State<MyReservationScreen> {
  @override
  void initState() {
    context
        .read<ReservationsCubit>()
        .getReservations(statusId: widget.statusId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,
          backButton: true, title: "muscle_and_joint_injuries_requests"),
      body: Column(
        children: [
          20.ph,
          ResevationsTabs(
            tabTitle: reservationTabs,
            statusId: widget.statusId,
          ),
          10.ph,
          const MyReservationBody(),
        ],
      ),
    );
  }
}
