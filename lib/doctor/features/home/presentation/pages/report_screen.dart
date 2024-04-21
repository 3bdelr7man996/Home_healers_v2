import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/doctor/features/home/presentation/widgets/report_widgets.dart';
import 'package:dr/doctor/features/home/presentation/widgets/requests_details_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  bool _isVisible = false;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: "report_template", backButton: true),
      bottomNavigationBar: CustomBottomNavigation(selectedIndex: 0),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                children: [
                  TextFormFieldForReport(label: "Medical and surgical history"),
                  10.ph,
                  TextFormFieldForReport(label: "Chief Complaint"),
                  10.ph,
                  TextFormFieldForReport(label: "Conscious/Unconscious"),
                  10.ph,
                  TextFormFieldForReport(
                      label: "Oriention(Time,place and person)"),
                  10.ph,
                  TextFormFieldForReport(label: "Pain(Severity,Type,Location)"),
                  10.ph,
                  TextFormFieldForReport(
                      label: "Observation(deformities,inflammation)"),
                  10.ph,
                  TextFormFieldForReport(label: "Sensation"),
                  10.ph,
                  TextFormFieldForReport(label: "ROM"),
                  10.ph,
                  TextFormFieldForReport(label: "Muscles Tone"),
                  10.ph,
                  TextFormFieldForReport(label: "Balance"),
                  10.ph,
                  TextFormFieldForReport(label: "Gait"),
                  30.ph,
                  SizedBox(
                    width: context.width * 0.9,
                    height: context.height * 0.06,
                    child: ElevatedButton(
                      onPressed: () {
                        _toggleVisibility();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.primaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: Text(
                        'send_report'.tr(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  30.ph
                ],
              ),
            ),
            PopUp(
              toggleVisibility: _toggleVisibility,
              isVisible: _isVisible,
            )
          ],
        ),
      ),
    );
  }
}
