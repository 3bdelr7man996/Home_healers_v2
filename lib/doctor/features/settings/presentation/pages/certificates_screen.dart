import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/doctor/features/settings/presentation/cubit/setting_cubit.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CertificatesScreen extends StatefulWidget {
  const CertificatesScreen({super.key});

  @override
  State<CertificatesScreen> createState() => _CertificatesScreenState();
}

class _CertificatesScreenState extends State<CertificatesScreen> {
  @override
  void initState() {
    context.read<SettingCubit>().getAllDocuments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,
          backButton: true, fromSetting: true, title: "certificates"),
      body: Column(
        children: [
          BlocBuilder<SettingCubit, SettingState>(
            builder: (context, state) {
              if (state.pullStatus == RequestState.loading) {
                return const CustomLoader(
                  padding: 0.45,
                );
              } else if (state.pullStatus == RequestState.success &&
                  state.myDocuments != null &&
                  state.myDocuments!.isNotEmpty) {
                return Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: state.myDocuments?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: AppConstants.customNetworkImage(
                                imagePath:
                                    "${AppStrings.imageUrl}${state.myDocuments?[index]}"),
                          ));
                    },
                  ),
                );
              } else {
                return Expanded(
                  child: Center(
                    child: Image.asset("assets/images/noDocument.png"),
                  ),
                );
              }
            },
          ),
          BlocBuilder<SettingCubit, SettingState>(
            builder: (context, state) {
              if (state.pullStatus == RequestState.loading) {
                return const SizedBox.shrink();
              } else {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Material(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: AppColors
                          .primaryColor, // Set the background color to red
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          backgroundColor: Colors
                              .transparent, // Make the background color transparent
                          shadowColor:
                              Colors.transparent, // Remove the button shadow
                        ),
                        onPressed: () {
                          context.read<SettingCubit>().onPickDocument();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("add_certificate".tr()),
                            5.pw,
                            SvgPicture.asset(
                              "assets/icons/Certificates_icon.svg",
                              width: 25,
                              height: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
