import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/doctor/features/settings/presentation/cubit/setting_cubit.dart';
import 'package:dr/doctor/features/settings/presentation/widgets/change_password_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool _isVisible = false;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, backButton: true, title: "change_password"),
      body: Container(
        height: context.height,
        child: Stack(children: [
          SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: BlocBuilder<SettingCubit, SettingState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextFormFieldForChangePassword(
                            obscure: state.showOldPassword,
                            onchanged: (var value) {
                              context
                                  .read<SettingCubit>()
                                  .showValueForOldpassword(value);
                            },
                            onClick: () {
                              context
                                  .read<SettingCubit>()
                                  .showIconForOldpassword();
                            },
                            num: 4,
                            title: "old_password",
                            icon: AppImages.passwordIcon,
                          ),
                          5.ph,
                          Text(
                            "forget_your_password".tr(),
                            style: TextStyle(color: AppColors.primaryColor),
                            textAlign: TextAlign.end,
                          )
                        ],
                      ),
                      30.ph,
                      TextFormFieldForChangePassword(
                        onchanged: (var value) {
                          context
                              .read<SettingCubit>()
                              .showValueForNewpassword(value);
                        },
                        obscure: state.showNewPassword,
                        onClick: () {
                          context.read<SettingCubit>().showIconForNewpassword();
                        },
                        num: 4,
                        title: "new_password",
                        icon: AppImages.passwordIcon,
                      ),
                      20.ph,
                      TextFormFieldForChangePassword(
                        onchanged: (var value) {
                          context
                              .read<SettingCubit>()
                              .showValueForConfirmpassword(value);
                        },
                        obscure: state.showConfirmPassword,
                        onClick: () {
                          context
                              .read<SettingCubit>()
                              .showIconForConfirmpassword();
                        },
                        num: 4,
                        title: "confirm_new_password",
                        icon: AppImages.passwordIcon,
                      ),
                      70.ph,
                      SizedBox(
                        width: context.width,
                        height: context.height * 0.05,
                        child: ElevatedButton(
                          onPressed: () {
                            context
                                .read<SettingCubit>()
                                .changePassword(_toggleVisibility);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text('save'.tr()),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          PopUpForChangePassword(
            toggleVisibility: _toggleVisibility,
            isVisible: _isVisible,
          )
        ]),
      ),
    );
  }
}
