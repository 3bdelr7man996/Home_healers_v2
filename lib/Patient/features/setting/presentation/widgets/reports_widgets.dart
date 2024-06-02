// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/setting/presentation/cubit/settings_cubit/setting_cubit.dart';

import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/shared_widgets/photo_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';

import '../../../../../core/utils/app_strings.dart';

class ReportsForMe extends StatefulWidget {
  ReportsForMe({super.key});

  @override
  State<ReportsForMe> createState() => _ReportsForMeState();
}

class _ReportsForMeState extends State<ReportsForMe> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportsCubit, ReportsState>(
      builder: (context, state) {
        return state.reportsForPatient == null
            ? SizedBox()
            : state.reportsForPatient.length == 0
                ? Expanded(
                    child: Center(
                      child: Text(
                        "لا يوجد تقارير لعرضها",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                : Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 30,
                      ),
                      itemCount: state.reportsForPatient == null
                          ? 0
                          : state.reportsForPatient.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            AppConstants.customNavigation(
                                context,
                                PhotoViewerRouteWrapper(
                                    filePath:
                                        state.reportsForPatient[index].repImage,
                                    typeOfFile: state
                                        .reportsForPatient[index].repImage
                                        .substring(
                                            0,
                                            state.reportsForPatient[index]
                                                    .repImage.length -
                                                4)),
                                0,
                                -1);
                          },
                          child: Container(
                            padding: EdgeInsets.only(bottom: 10.0),
                            color: Colors.white,
                            child: Container(
                              child: state.reportsForPatient[index].repImage
                                          .substring(
                                              0,
                                              state.reportsForPatient[index]
                                                      .repImage.length -
                                                  4) ==
                                      "pdf"
                                  ? Center(child: Text("file"))
                                  : Center(
                                      child: PhotoView(
                                        imageProvider: NetworkImage(
                                          '${AppStrings.imageUrl}${state.reportsForPatient[index].repImage}',
                                        ),
                                      ),
                                    ),
                              width: 200,
                              height: 200,
                              color: const Color.fromARGB(122, 158, 158, 158),
                            ),
                          ),
                        );
                      },
                    ),
                  );
      },
    );
  }
}

class specialist_reports extends StatefulWidget {
  specialist_reports({super.key});

  @override
  State<specialist_reports> createState() => _specialist_reportsState();
}

class _specialist_reportsState extends State<specialist_reports> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportsCubit, ReportsState>(
      builder: (context, state) {
        return state.reportsForDoctors == null
            ? SizedBox()
            : state.reportsForDoctors.length == 0
                ? Expanded(
                    child: Center(
                    child: Text(
                      "لا يوجد تقارير لعرضها",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ))
                : Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: state.reportsForDoctors == null
                          ? 0
                          : state.reportsForDoctors.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            AppConstants.customNavigation(
                                context,
                                PhotoViewerRouteWrapper(
                                  filePath: state.reportsForDoctors[index].file,
                                ),
                                0,
                                -1);
                          },
                          child: Container(
                            padding: EdgeInsets.only(bottom: 10.0),
                            color: Colors.white,
                            child: state.reportsForDoctors[index].file
                                    .endsWith('pdf')
                                ? SizedBox(
                                    child: AppConstants.customAssetImage(
                                      imagePath: AppImages.pdf_icon,
                                    ),
                                  )
                                : SizedBox(
                                    child: AppConstants.customNetworkImage(
                                      imagePath:
                                          state.reportsForDoctors[index].file,
                                    ),
                                    width: 200,
                                    height: 200,
                                  ),
                          ),
                        );
                      },
                    ),
                  );
      },
    );
  }
}
