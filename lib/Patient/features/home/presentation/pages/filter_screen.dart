import 'package:dr/Patient/features/home/presentation/cubit/cubit/filter_cubit.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_cubit.dart';
import 'package:dr/Patient/features/home/presentation/widgets/filter_widgets.dart';
import 'package:dr/Patient/features/home/presentation/widgets/filter_widgets/filter_layout.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/doctor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FiterScreen extends StatefulWidget {
  const FiterScreen({super.key});

  @override
  State<FiterScreen> createState() => _FiterScreenState();
}

var arrayForGender = [Item(nameAr: "ذكر", id: 2), Item(nameAr: "أنثى", id: 3)];

class _FiterScreenState extends State<FiterScreen> {
  @override
  void initState() {
    context.read<FilterCubit>().initData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // statusFromData =
    //     context.select((AuthCubit cubit) => cubit.state.statusList);
    // if (statusFromData != null) {
    //   Status = statusFromData.map((city) {
    //     if (city != null) {
    //       return {
    //         "name": city.nameAr,
    //         "id": city.id,
    //       };
    //     } else {
    //       return null;
    //     }
    //   }).toList();
    // }
    // categoriesFromData =
    //     context.select((AuthCubit cubit) => cubit.state.departemensList);
    // if (categoriesFromData != null) {
    //   categories = categoriesFromData.map((city) {
    //     if (city != null) {
    //       return {
    //         "name": city.nameAr,
    //         "id": city.id,
    //       };
    //     } else {
    //       return null;
    //     }
    //   }).toList();
    // }
    // CitesFromData = context.select((AuthCubit cubit) => cubit.state.citiesList);
    // if (CitesFromData != null) {
    //   Cites = CitesFromData.map((city) {
    //     if (city != null) {
    //       return {
    //         "name": city.nameAr,
    //         "id": city.id,
    //       };
    //     } else {
    //       return null;
    //     }
    //   }).toList();
    //}
    return Scaffold(
      appBar: customAppBarForFilter(
        context,
        title: "filter_for_search",
        backButton: true,
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () async {
            await context.read<FilterCubit>().GetFilterResult(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'تطبيق',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Divider(
              thickness: 1,
            ),
            BlocBuilder<FilterCubit, FilterState>(
              builder: (context, state) {
                return FilterLayout<Item>(
                  key: Key("categorie_radio_list"),
                  radioList: context.read<FilterCubit>().catgList,
                  selectedRadioValue: state.category_id,
                  title: "اختر مسمى الأخصائي",
                  onRadioChanged: (v) {
                    context.read<FilterCubit>().changeCategoryNumber(v);
                  },
                  selectedRadioText: state.category_id?.nameAr ?? '',
                  showRadio: state.showCateg,
                  onTapDropIcon: () => context.read<FilterCubit>().showCateg(),
                );
              },
            ),
            BlocBuilder<FilterCubit, FilterState>(
              builder: (context, state) {
                return FilterLayout<Item>(
                  key: Key("status_radio_list"),
                  radioList: context.read<FilterCubit>().statusList,
                  selectedRadioValue: state.status_id,
                  title: "اختر القسم",
                  onRadioChanged: (v) {
                    context.read<FilterCubit>().changeSectionNumber(v);
                  },
                  selectedRadioText: state.status_id?.nameAr ?? '',
                  showRadio: state.showStatus,
                  onTapDropIcon: () => context.read<FilterCubit>().showStatus(),
                );
              },
            ),
            BlocBuilder<FilterCubit, FilterState>(
              builder: (context, state) {
                return FilterLayout<Item>(
                  key: Key("gender_radio_list"),
                  radioList: arrayForGender,
                  selectedRadioValue: state.gender,
                  title: "اختر جنس الأخصائي",
                  onRadioChanged: (v) {
                    context.read<FilterCubit>().changeGender(v);
                  },
                  selectedRadioText: state.gender?.nameAr ?? '',
                  showRadio: state.showGender,
                  onTapDropIcon: () => context.read<FilterCubit>().showGender(),
                );
              },
            ),
            BlocBuilder<FilterCubit, FilterState>(
              builder: (context, state) {
                return FilterLayout<Item>(
                  key: Key("city_radio_list"),
                  radioList: context.read<FilterCubit>().citiesList,
                  selectedRadioValue: state.city_id,
                  title: "اختر المدينة",
                  onRadioChanged: (v) {
                    context.read<FilterCubit>().changeCity(v);
                    context.read<FilterCubit>().changeArea(null);
                    context.read<FilterCubit>().onfillAreaList(context
                        .read<AuthCubit>()
                        .citiesList
                        ?.firstWhere((e) => e.id == v?.id)
                        .area);
                  },
                  selectedRadioText: state.city_id?.nameAr ?? '',
                  showRadio: state.showCity,
                  onTapDropIcon: () => context.read<FilterCubit>().showCities(),
                );
              },
            ),
            BlocBuilder<FilterCubit, FilterState>(
              // buildWhen: (previous, current) =>
              //     previous.area_id != current.area_id ||
              //     previous.areaList != current.areaList,
              builder: (context, state) {
                return state.areaList != null
                    ? FilterLayout<Item>(
                        key: Key("area_radio_list"),
                        radioList: context.read<FilterCubit>().areaItemList,
                        selectedRadioValue: state.area_id,
                        title: "اختر الحي",
                        onRadioChanged: (v) {
                          context.read<FilterCubit>().changeArea(v);
                        },
                        selectedRadioText: state.area_id?.nameAr ?? '',
                        showRadio: state.showArea,
                        onTapDropIcon: () =>
                            context.read<FilterCubit>().showArea(),
                      )
                    : SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
