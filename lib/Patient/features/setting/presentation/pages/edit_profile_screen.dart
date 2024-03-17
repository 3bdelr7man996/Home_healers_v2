// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/edit_widgets.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_font.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/doctor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/shared_widgets/custom_titled_text_form.dart';
import 'package:dr/shared_widgets/gender_button.dart';
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
  var userInfo;
  var jsonData;
  String FirstName = '';
  String LastName = '';
  String email = '';
  String mobile = '';

  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().getAllCities();

    getAttributeFromSharedPreferences().then((value) {
      setState(() {
        userInfo = value;

        jsonData = jsonDecode(userInfo);
        List<String> words = jsonData["name"].split(" ");
        FirstName = words[0];
        LastName = words[1];
        email = jsonData["email"];
        mobile = jsonData["mobile"];
      });
      context
          .read<UpdateInfoCubit>()
          .onCityIdChange(jsonData!["city_id"].toString());
      context
          .read<UpdateInfoCubit>()
          .onFullNameChange(jsonData["name"].toString());
      context
          .read<UpdateInfoCubit>()
          .onEmailChange(jsonData["email"].toString());
      context
          .read<UpdateInfoCubit>()
          .onNumberChange(jsonData["mobile"].toString());
      context
          .read<UpdateInfoCubit>()
          .onGenderChange(jsonData["gender"].toString());
    });
  }

  int x = 0;
  @override
  Widget build(BuildContext context) {
    var cities = context.select((AuthCubit cubit) => cubit.state.citiesList);
    for (int i = 0; i < cities!.length; i++) {
      if (cities[i].id.toString() == jsonData?["city_id"])
        context.read<UpdateInfoCubit>().oncitySelectedChange(cities[i].nameAr!);
    }
    print(jsonData);

    return Scaffold(
        appBar: customAppBar(
          context,
          backButton: true,
          title: "edit_setting",
        ),
        body: cities == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  20.ph,
                  ProfileImageForPatient(),
                  20.ph,
                  Expanded(
                      child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          TiteldTextFormField(
                            onChanged: (p0) {
                              context
                                  .read<UpdateInfoCubit>()
                                  .onFullNameChange(p0);
                            },
                            title: "full_name",
                            hint: "$FirstName $LastName",
                            titleWithouttr: true,
                            prefixIconPath: AppImages.personIcon,
                            validateMsg: "required".tr(),
                          ),
                          30.ph,
                          TiteldTextFormField(
                            onChanged: (p0) {
                              context.read<UpdateInfoCubit>().onEmailChange(p0);
                            },
                            title: "email",
                            hint: "$email",
                            titleWithouttr: true,
                            prefixIconPath: AppImages.emailIcon,
                          ),
                          30.ph,
                          TiteldTextFormField(
                            onChanged: (p0) {
                              context
                                  .read<UpdateInfoCubit>()
                                  .onNumberChange(p0);
                            },
                            title: "mobile_number",
                            hint: "$mobile",
                            titleWithouttr: true,
                            prefixIconPath: AppImages.phoneIcon,
                          ),
                          30.ph,
                          Container(
                            width: context.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "اختر الجنس".tr(),
                                  style:
                                      bigBlackFont(fontWeight: FontWeight.w500),
                                ),
                                5.ph,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GenderButton(
                                        gender: "male",
                                        title: "male",
                                        fromSetting: true),
                                    GenderButton(
                                        gender: "female",
                                        title: "female",
                                        fromSetting: true)
                                  ],
                                )
                              ],
                            ),
                          ),
                          30.ph,
                          BlocBuilder<AuthCubit, AuthState>(
                            builder: (context, state) {
                              return Container(
                                width: context.width,
                                child: BlocBuilder<UpdateInfoCubit,
                                    UpdateInfoState>(
                                  builder: (context, updateInfoState) {
                                    return DropdownButton<String>(
                                      value: updateInfoState.citySelected,
                                      items: state.citiesList
                                          ?.map((city) => DropdownMenuItem(
                                              value: city.nameAr,
                                              child: Text(city.nameAr!)))
                                          .toList(),
                                      onChanged: (value) {
                                        context
                                            .read<UpdateInfoCubit>()
                                            .oncitySelectedChange(value);

                                        var val;
                                        for (int i = 0;
                                            i < cities.length;
                                            i++) {
                                          if (cities[i].nameAr == value) {
                                            val = cities[i].id;
                                          }
                                        }
                                        context
                                            .read<UpdateInfoCubit>()
                                            .onCityIdChange(val.toString());
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          30.ph,
                          SizedBox(
                            width: context.width,
                            height: context.height * 0.05,
                            child: ElevatedButton(
                              onPressed: () {
                                context
                                    .read<UpdateInfoCubit>()
                                    .UpdateInfoForUser(context);
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
                          30.ph,
                        ],
                      ),
                    ),
                  ))
                ],
              ));
  }
}
