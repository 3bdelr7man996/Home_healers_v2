// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/home/presentation/pages/section_details_screen.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/doctor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class IconsForSections extends StatefulWidget {
  bool formOffer;
  var sessionCountForOffer;
  var fromPackage;
  IconsForSections(
      {super.key,
      this.formOffer = false,
      this.sessionCountForOffer,
      this.fromPackage = false});

  @override
  State<IconsForSections> createState() => _IconsForSectionsState();
}

class _IconsForSectionsState extends State<IconsForSections> {
  final List<String> icons = [
    "assets/icons/muscle_icon.svg",
    "assets/icons/sports_muscle_injuries_icon.svg",
    "assets/icons/Post-operative_rehabilitation_icon.svg",
    "assets/icons/children_icon.svg",
    "assets/icons/Cardiac_rehabilitation_icon.svg",
    "assets/icons/nervous_system_injuries_icon.svg",
    "assets/icons/women's_health_problems_icon.svg",
  ];

  final List<String> labels = [
    'إصابات رياضية',
    'الام العضلات والمفاصل',
    'تأهيل الأطفال',
    'تأهيل بعد العمليات الجراحية',
    'تأهيل قلبي رئوي',
    'إصابات الجهاز العصبي',
    'مشاكل صحة المرأة',
  ];

  final List<String> SectiondetailsTitle = [
    'muscle_and_joint_pain_section',
    'muscle_injuries_section',
    'rehabilitation_after_surgeries',
    'pediatric_rehabilitation_section',
    'cardiopulmonary_rehabilitation',
    'nervous_system_injuries',
    'women_health_problems'
  ];
  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().getAllStatus();
  }

  @override
  Widget build(BuildContext context) {
    final statusList =
        context.select((AuthCubit cubit) => cubit.state.statusList);

    return GridView.builder(
      itemCount: icons.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 0.8),
      itemBuilder: (BuildContext context, int index) {
        return Builder(builder: (BuildContext context) {
          return InkWell(
            onTap: () {
              AppConstants.customNavigation(
                  context,
                  SectionDetailsScreen(
                    sessionCountForOffer: widget.sessionCountForOffer,
                    fromOffer: widget.formOffer,
                    numberOfIcon: index,
                    SectiondetailsTitle: SectiondetailsTitle[index],
                    status_id: statusList![index].id,
                  ),
                  -1,
                  0);
            },
            child: Column(
              children: [
                SvgPicture.asset(icons[index]),
                5.ph,
                Text(
                  context.select((AuthCubit cubit) => cubit.state.statusList) !=
                          null
                      ? context
                          .select((AuthCubit cubit) =>
                              cubit.state.statusList![index].nameAr)
                          .toString()
                      : "",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          );
        });
      },
    );
  }
}
