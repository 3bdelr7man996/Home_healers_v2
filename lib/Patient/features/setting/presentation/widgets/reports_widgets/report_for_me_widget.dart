import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit/report_cubit.dart';
import 'package:dr/Patient/features/setting/presentation/cubit/setting_state/report_state.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/shared_widgets/photo_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';

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
            : state.reportsForPatient!.length == 0
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
                          : state.reportsForPatient!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            AppConstants.customNavigation(
                                context,
                                PhotoViewerRouteWrapper(
                                    filePath: state
                                        .reportsForPatient![index].repImage,
                                    typeOfFile: state
                                        .reportsForPatient![index].repImage!
                                        .substring(
                                            0,
                                            state.reportsForPatient![index]
                                                    .repImage!.length -
                                                4)),
                                0,
                                -1);
                          },
                          child: Container(
                            padding: EdgeInsets.only(bottom: 10.0),
                            color: Colors.white,
                            child: Container(
                              child: state.reportsForPatient![index].repImage!
                                          .substring(
                                              0,
                                              state.reportsForPatient![index]
                                                      .repImage!.length -
                                                  4) ==
                                      "pdf"
                                  ? Center(child: Text("file"))
                                  : Center(
                                      child: PhotoView(
                                        imageProvider: NetworkImage(
                                          '${AppStrings.imageUrl}${state.reportsForPatient![index].repImage}',
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
