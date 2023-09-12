import 'package:dr/Patient/features/setting/presentation/widgets/my_wallet_widgets.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({super.key});

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, backButton: true, title: "my_wallet"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyCurrentBalance(),
              15.ph,
              Text(
                "تصنيف المعاملات :",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              Divider(
                thickness: 1,
              ),
              DepositWidget(),
              15.ph,
              TranferWidget(),
              15.ph,
              DepositWidget(),
              15.ph,
              TranferWidget(),
              15.ph,
              DepositWidget(),
              15.ph,
              TranferWidget(),
              15.ph
            ],
          ),
        ),
      ),
    );
  }
}
