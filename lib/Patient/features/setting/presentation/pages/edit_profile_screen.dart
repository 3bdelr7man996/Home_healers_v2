import 'package:dr/Patient/features/setting/presentation/cubit/edit_acc_cubit/edit_user_acc_cubit.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/edit_widgets.dart';
// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit/update_info_cubit.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/edit_widgets/choose_city_widget.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/edit_widgets/choose_gender_widget.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/edit_widgets/profile_image_for_patient_widget.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:dr/shared_widgets/custom_titled_text_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreenForPatient extends StatefulWidget {
  const EditProfileScreenForPatient({Key? key}) : super(key: key);

  @override
  State<EditProfileScreenForPatient> createState() =>
      _EditProfileScreenForPatientState();
}

class _EditProfileScreenForPatientState
    extends State<EditProfileScreenForPatient> {
  @override
  void initState() {
    super.initState();
    context.read<EditUserAccCubit>().initProfileData();
    context.read<EditUserAccCubit>().getAllCities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(
          context,
          backButton: true,
          title: "edit_setting",
        ),
        body: Column(
          children: [
            20.ph,
            ProfileImageForPatient(),
            20.ph,
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FullNameField(),
                    30.ph,
                    EmailField(),
                    30.ph,
                    MobileNumberField(),
                    30.ph,
                    SelectGenderField(),
                    30.ph,
                    Text(
                      "المدينة",
                      style: bigBlackFont(fontWeight: FontWeight.w500),
                    ),
                    CityDropDown(),
                    30.ph,
                    SizedBox(
                      width: context.width,
                      height: context.height * 0.05,
                      child: BlocBuilder<EditUserAccCubit, EditUserAccState>(
                        builder: (context, state) {
                          return state.updateState == RequestState.loading
                              ? CustomLoader(
                                  padding: 0,
                                )
                              : ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<EditUserAccCubit>()
                                        .UpdateInfoForUser(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  child: Text('save'.tr()),
                                );
                        },
                      ),
                    ),
                    30.ph,
                  ],
                ),
              ),
            ))
          ],
        ));
  }
}

class FullNameField extends StatelessWidget {
  const FullNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditUserAccCubit, EditUserAccState>(
      buildWhen: (previous, current) => previous.userInfo != current.userInfo,
      builder: (context, state) {
        return TiteldTextFormField(
          onChanged: (p0) {
            context.read<EditUserAccCubit>().onFullNameChange(p0);
          },
          title: "full_name",
          initialValue: state.userInfo?.name,
          titleWithouttr: true,
          prefixIconPath: AppImages.personIcon,
          validateMsg: "required".tr(),
        );
      },
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditUserAccCubit, EditUserAccState>(
      buildWhen: (previous, current) => previous.userInfo != current.userInfo,
      builder: (context, state) {
        return TiteldTextFormField(
          onChanged: (p0) {
            context.read<EditUserAccCubit>().onEmailChange(p0);
          },
          initialValue: state.userInfo?.email,
          title: "email",
          titleWithouttr: true,
          prefixIconPath: AppImages.emailIcon,
          readOnly: true,
        );
      },
    );
  }
}

class MobileNumberField extends StatelessWidget {
  const MobileNumberField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditUserAccCubit, EditUserAccState>(
      buildWhen: (previous, current) => previous.userInfo != current.userInfo,
      builder: (context, state) {
        return TiteldTextFormField(
          onChanged: (p0) {
            context.read<EditUserAccCubit>().onNumberChange(p0);
          },
          title: "mobile_number",
          initialValue: state.userInfo?.mobile,
          titleWithouttr: true,
          prefixIconPath: AppImages.phoneIcon,
        );
      },
    );
  }
}

class SelectGenderField extends StatelessWidget {
  const SelectGenderField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "اختر الجنس".tr(),
            style: bigBlackFont(fontWeight: FontWeight.w500),
          ),
          5.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<EditUserAccCubit, EditUserAccState>(
                builder: (context, state) {
                  return GenderButton(
                    title: "male",
                    isSelected: state.gender == "male",
                    onPressed: () {
                      context.read<EditUserAccCubit>().onGenderChange("male");
                    },
                  );
                },
              ),
              BlocBuilder<EditUserAccCubit, EditUserAccState>(
                builder: (context, state) {
                  return GenderButton(
                    title: "female",
                    isSelected: state.gender == "female",
                    onPressed: () {
                      context.read<EditUserAccCubit>().onGenderChange("female");
                    },
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

class CityDropDown extends StatelessWidget {
  const CityDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.4,
      child: BlocBuilder<EditUserAccCubit, EditUserAccState>(
        builder: (context, editState) {
          return editState.citiesState == RequestState.loading
              ? CustomLoader(
                  padding: 0,
                )
              : DropdownButton<String>(
                  isExpanded: true,
                  value: editState.city?.nameAr,
                  items: editState.citiesList
                      ?.map(
                        (city) => DropdownMenuItem(
                          value: city.nameAr,
                          child: Text(city.nameAr!),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    context.read<EditUserAccCubit>().onCityIdChange(
                        editState.citiesList!.firstWhere((city) =>
                            city.nameAr?.compareTo(value ?? '') == 0));
                  },
                );
        },
      ),
    );
  }
}
