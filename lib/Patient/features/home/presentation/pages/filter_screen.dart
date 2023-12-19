import 'package:dr/Patient/features/home/presentation/cubit/home_cubit.dart';
import 'package:dr/Patient/features/home/presentation/widgets/filter_widgets.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/firebase_analytic_helper.dart';
import 'package:dr/doctor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FiterScreen extends StatefulWidget {
  const FiterScreen({super.key});

  @override
  State<FiterScreen> createState() => _FiterScreenState();
}

late String? selectedValue = "أخصائي أول علاج طبيعي";
late String? selectedValue2 = "الام العضلات والمفاصل";
late String? selectedValue3 = "ذكر";
late String? selectedValue4 = "الرياض";
late String? selectedValue5 = "حي المرسلات";

var arrayForGender = ["ذكر", "أنثى"];

class _FiterScreenState extends State<FiterScreen> {
  var Cites,
      CitesFromData,
      areas,
      categoriesFromData,
      categories,
      statusFromData,
      Status;

  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().getAllCities();
    context.read<AuthCubit>().onAreasChange("الرياض");
    context.read<AuthCubit>().getAllDepartements();
    context.read<AuthCubit>().getAllStatus();
    context.read<ReservationCubit>().onChangestatus_id(null);
  }

  @override
  Widget build(BuildContext context) {
    print(context.select((AuthCubit cubit) => cubit.state.areasList));
    print("//////////////////////////////////////////////////////////////");
    print(context.select((AuthCubit cubit) => cubit.state.citiesList));
    print("//////////////////////////////////////////////////////////////");

    statusFromData =
        context.select((AuthCubit cubit) => cubit.state.statusList);
    if (statusFromData != null) {
      Status = statusFromData.map((city) {
        if (city != null) {
          return {
            "name": city.nameAr,
            "id": city.id,
          };
        } else {
          return null;
        }
      }).toList();
    }
    categoriesFromData =
        context.select((AuthCubit cubit) => cubit.state.departemensList);
    if (categoriesFromData != null) {
      categories = categoriesFromData.map((city) {
        if (city != null) {
          return {
            "name": city.nameAr,
            "id": city.id,
          };
        } else {
          return null;
        }
      }).toList();
    }
    // print(context.select((AuthCubit cubit) => cubit.state.departemensList));
    CitesFromData = context.select((AuthCubit cubit) => cubit.state.citiesList);
    if (CitesFromData != null) {
      Cites = CitesFromData.map((city) {
        if (city != null) {
          return {
            "name": city.nameAr,
            "id": city.id,
          };
        } else {
          return null;
        }
      }).toList();
    }
    return Scaffold(
      appBar: customAppBarForFilter(context,
          title: "filter_for_search", backButton: true),
      bottomNavigationBar: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () async {
            await context.read<FilterCubit>().GetFilterResult(context);
            FirebaseAnalyticUtil.logSearchEvent();
            // AppConstants.customNavigation(context, FilterResultScreen(), -1, 0);
          },
          style: ElevatedButton.styleFrom(
            primary: AppColors.primaryColor,
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
            RaioButtonsSections(
              title: "اختر مسمى الأخصائي",
              selectedValue: selectedValue,
              nameOfSection: "category_id",
              arrayForTitle: categories,
              num: 3,
            ),
            RaioButtonsSections(
              title: "اختر القسم",
              selectedValue: selectedValue2,
              arrayForTitle: Status,
              nameOfSection: "status_id",
              num: 3,
            ),
            RaioButtonsSections(
              title: "اختر جنس الأخصائي",
              selectedValue: selectedValue3,
              nameOfSection: "gender",
              arrayForTitle: arrayForGender,
            ),
            RaioButtonsSections(
              title: "اختر المدينة",
              selectedValue: selectedValue4,
              arrayForTitle: Cites,
              nameOfSection: "city_id",
              num: 2,
            ),
            RaioButtonsSections(
              title: "اختر الحي",
              selectedValue: selectedValue5,
              arrayForTitle:
                  context.select((AuthCubit cubit) => cubit.state.areasList),
              nameOfSection: "area_id",
              num: 2,
            ),
          ],
        ),
      ),
    );
  }
}
