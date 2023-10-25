// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_font.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/doctor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_location_picker/map_location_picker.dart';

class TextFormFieldForSignUpForPatient extends StatelessWidget {
  final int num;
  final String title;
  final String icon;

  TextFormFieldForSignUpForPatient(
      {super.key, required this.num, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.tr(),
          style: bigBlackFont(fontWeight: FontWeight.w500),
        ),
        5.ph,
        TextFormField(
          obscureText: num == 4
              ? context.select(
                  (AuthCubitForPatient cubit) => cubit.state.obscurePass)
              : num == 5
                  ? context.select((AuthCubitForPatient cubit) =>
                      cubit.state.obscureConfPass)
                  : false,
          decoration: InputDecoration(
            suffixIcon: num == 4
                ? context.select(
                        (AuthCubitForPatient cubit) => cubit.state.obscurePass)
                    ? InkWell(
                        onTap: () {
                          context.read<AuthCubitForPatient>().showPassword();
                        },
                        child: SizedBox(
                          height: 18,
                          width: 18,
                          child: AppConstants.customAssetSvg(
                            imagePath: AppImages.hiddenPassIcon,
                            fit: BoxFit.none,
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          context.read<AuthCubitForPatient>().showPassword();
                        },
                        child: SizedBox(
                          height: 18,
                          width: 18,
                          child: AppConstants.customAssetSvg(
                            imagePath: AppImages.showPasswordIcon,
                            fit: BoxFit.none,
                          ),
                        ),
                      )
                : num == 5
                    ? context.select((AuthCubitForPatient cubit) =>
                            cubit.state.obscureConfPass)
                        ? InkWell(
                            onTap: () {
                              context
                                  .read<AuthCubitForPatient>()
                                  .showConfPassword();
                            },
                            child: SizedBox(
                              height: 18,
                              width: 18,
                              child: AppConstants.customAssetSvg(
                                imagePath: AppImages.hiddenPassIcon,
                                fit: BoxFit.none,
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              context
                                  .read<AuthCubitForPatient>()
                                  .showConfPassword();
                            },
                            child: SizedBox(
                              height: 18,
                              width: 18,
                              child: AppConstants.customAssetSvg(
                                imagePath: AppImages.showPasswordIcon,
                                fit: BoxFit.none,
                              ),
                            ),
                          )
                    : null,
            hintText: title.tr(),
            prefixIcon: num == 7
                ? null
                : SizedBox(
                    height: 18,
                    width: 18,
                    child: AppConstants.customAssetSvg(
                      imagePath: icon,
                      fit: BoxFit.none,
                    ),
                  ),
          ),
          onChanged: (value) {
            if (num == 1)
              context.read<AuthCubitForPatient>().onFNameChange(value);
            else if (num == 2)
              context.read<AuthCubitForPatient>().onLNameChange(value);
            else if (num == 3)
              context.read<AuthCubitForPatient>().onEmailChange(value);
            else if (num == 8)
              context.read<AuthCubitForPatient>().onPhoneChange(value);
            else if (num == 7)
              context.read<AuthCubitForPatient>().onIdentificationChange(value);
            else if (num == 4)
              context.read<AuthCubitForPatient>().onPassWordChange(value);
            else if (num == 5)
              context.read<AuthCubitForPatient>().onConfPassChange(value);
          },
        ),
      ],
    );
  }
}

class GenderButtonForSignUpForPatient extends StatelessWidget {
  final String title;
  final String gender;

  GenderButtonForSignUpForPatient({
    super.key,
    this.title = "",
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubitForPatient, AuthStateForPatient>(
      builder: (context, state) {
        return SizedBox(
          width: context.width * 0.3,
          height: context.height * 0.05,
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: (state.gender != null && state.gender == gender)
                      ? const BorderSide(
                          color: AppColors.primaryColor, width: 1.5)
                      : BorderSide.none,
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black54),
            ),
            onPressed: () {
              context.read<AuthCubitForPatient>().onGenderChange(gender);
            },
            child: Text(title.tr()),
          ),
        );
      },
    );
  }
}

class LocationInput extends StatelessWidget {
  final TextEditingController control = TextEditingController();
  LocationInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final contextFirst = context;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "location".tr(),
          style: bigBlackFont(fontWeight: FontWeight.w500),
        ),
        5.ph,
        BlocBuilder<AuthCubitForPatient, AuthStateForPatient>(
          buildWhen: (previous, current) =>
              previous.address != current.address ||
              previous.advertiser != current.advertiser,
          builder: (context, state) {
            return TextFormField(
              key: const Key('signUpForm_locationInput_textField'),
              controller: (control.text.isEmpty && state.advertiser != null)
                  ? TextEditingController(text: state.advertiser?.addressAr)
                  : control,
              //initialValue: state.advertiser?.addressAr ?? "",
              readOnly: true,
              keyboardType: TextInputType.name,
              onTap: () {
                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapLocationPicker(
                      apiKey: AppStrings.mapApiKey, // Put YOUR OWN KEY here.
                      onNext: (result) {
                        if (result != null) {
                          context.read<AuthCubitForPatient>().onAddressChange(
                              address: result.formattedAddress,
                              location: result.geometry.location);

                          control.text = result.formattedAddress ?? "";
                        }
                        Navigator.of(context).pop();
                      },
                      location: state.location,
                      currentLatLng: LatLng(
                          state.location?.lat ?? 24.70281458492638,
                          state.location?.lng ?? 46.704172412998915),
                    ),
                  ),
                );
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "required".tr();
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "location".tr(),
                suffixIcon: SizedBox(
                  height: 18,
                  width: 18,
                  child: AppConstants.customAssetSvg(
                    imagePath:
                        AppImages.locationIcon, //AppImages.showPasswordIcon,
                    fit: BoxFit.none,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class BirthdayPicker extends StatefulWidget {
  @override
  _BirthdayPickerState createState() => _BirthdayPickerState();
}

class _BirthdayPickerState extends State<BirthdayPicker> {
  TextEditingController _birthdayController = TextEditingController();
  late DateTime _selectedDate = DateTime.now();
  late int _age = 0;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _birthdayController.text = DateFormat('MM/dd/yyyy').format(picked);
        _age = DateTime.now().year - picked.year;
        print(_selectedDate);
        print(_birthdayController.text);
        print(_age);
        context.read<AuthCubitForPatient>().onageChange("$_age");
        context
            .read<AuthCubitForPatient>()
            .onbirthdayChange(_birthdayController.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _birthdayController,
      onTap: () => _selectDate(context),
      decoration: InputDecoration(
        labelText: 'تاريخ عيد الميلاد',
      ),
      readOnly: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'أرجوك ادخل تاريخ عيد ميلادك';
        }
        return null;
      },
    );
  }
}

class BottomSheetForSignUP extends StatelessWidget {
  final String title;
  const BottomSheetForSignUP({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.tr(),
            style: bigBlackFont(fontWeight: FontWeight.w500),
          ),
          5.ph,
          SizedBox(
            height: context.height * 0.05,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black54,
                side: const BorderSide(color: Colors.black54, width: 0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return const OptionsForCities();
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title.tr()),
                  const Icon(Icons.arrow_forward_ios_outlined),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OptionsForCities extends StatelessWidget {
  const OptionsForCities({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.65,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            10.ph,
            Text(
              'select_city'.tr(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            20.ph,
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state.citiesState == RequestState.loading) {
                  return const CustomLoader(
                    padding: 0,
                  );
                } else if (state.citiesList != null) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.citiesList!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(state.citiesList![index].nameAr!),
                              Radio(
                                groupValue: state.selectedCity,
                                value: state.citiesList![index].id,
                                onChanged: (checked) {
                                  try {
                                    context.read<AuthCubit>().onSelectCity(
                                          state.citiesList![index].id!,
                                        );
                                    var id = state.citiesList![index].id!;
                                    context
                                        .read<AuthCubitForPatient>()
                                        .onCityChange(id);
                                    print(id);
                                  } catch (e) {
                                    print(e.toString());
                                  }
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            15.ph,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('confirm'.tr()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectCityButtonForSignUpForPatient extends StatelessWidget {
  final String title;
  var value;

  SelectCityButtonForSignUpForPatient({super.key, this.title = "", this.value});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubitForPatient, AuthStateForPatient>(
      builder: (context, state) {
        return SizedBox(
          width: context.width * 0.3,
          height: context.height * 0.05,
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: (state.country_code != null &&
                          state.country_code == value)
                      ? const BorderSide(
                          color: AppColors.primaryColor, width: 1.5)
                      : BorderSide.none,
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black54),
            ),
            onPressed: () {
              context.read<AuthCubitForPatient>().oncountryCodeChange(value);
            },
            child: Text(title.tr()),
          ),
        );
      },
    );
  }
}

class nationalityButtonForSignUpForPatient extends StatelessWidget {
  final String title;
  var value;

  nationalityButtonForSignUpForPatient(
      {super.key, this.title = "", this.value});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubitForPatient, AuthStateForPatient>(
      builder: (context, state) {
        return SizedBox(
          width: context.width * 0.3,
          height: context.height * 0.05,
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side:
                      (state.nationality != null && state.nationality == value)
                          ? const BorderSide(
                              color: AppColors.primaryColor, width: 1.5)
                          : BorderSide.none,
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black54),
            ),
            onPressed: () {
              context.read<AuthCubitForPatient>().onNationalityChange(value);
            },
            child: Text(title.tr()),
          ),
        );
      },
    );
  }
}
