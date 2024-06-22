// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/home/presentation/pages/section_details_screen.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/doctor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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
  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().getAllStatus();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      if (state.statusState == RequestState.loading) {
        return CustomLoader(
          padding: 0,
        );
      } else if (state.statusList != null) {
        return GridView.builder(
          itemCount: state.statusList?.length,
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
                        SectiondetailsTitle: state.statusList?[index].nameAr,
                        status_id: state.statusList![index].id,
                      ),
                      -1,
                      0);
                },
                child: Column(
                  children: [
                    AppConstants.customNetworkImage(
                        imagePath: state.statusList?[index].image ?? '',
                        imageError: AppImages.sts_muscle_pain,
                        ),
                    5.ph,
                    Text(
                      state.statusList?[index].nameAr ?? '',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              );
            });
          },
        );
      } else {
        return SizedBox.shrink();
      }
    });
  }
}
