import 'package:dr/Patient/features/setting/presentation/widgets/requests_details_widgets.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class RequestsDetailsScreenForPatient extends StatefulWidget {
  int num;
  RequestsDetailsScreenForPatient({super.key, required this.num});

  @override
  State<RequestsDetailsScreenForPatient> createState() =>
      _RequestsDetailsScreenForPatientState();
}

class _RequestsDetailsScreenForPatientState
    extends State<RequestsDetailsScreenForPatient> {
  bool _isVisible = false;
  bool _firstPopUp = false;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
      _firstPopUp = !_firstPopUp;
    });
  }

  void changePopUp() {
    setState(() {
      _firstPopUp = !_firstPopUp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, backButton: true, title: "order_details"),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FirstSection(
                    num: widget.num,
                  ),
                  20.ph,
                  const Divider(
                    thickness: 1,
                  ),
                  20.ph,
                  TowSection(num: widget.num),
                  20.ph,
                  Divider(
                    thickness: 1,
                  ),
                  widget.num == 2 ||
                          widget.num == 3 ||
                          widget.num == 4 ||
                          num == 5
                      ? SessionInfoForPatient()
                      : SizedBox(),
                  Text(
                    "تفاصيل الإجمالي",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  20.ph,
                  Bill(),
                  30.ph,
                  if (widget.num != 5)
                    widget.num == 4
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: AppColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: EdgeInsets.all(16),
                                ),
                                onPressed: () {},
                                child: Text('إظهار الفاتورة'),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    side: BorderSide(
                                        color: AppColors.primaryColor),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 0,
                                    padding: EdgeInsets.all(16),
                                    backgroundColor: Colors.transparent),
                                onPressed: () {},
                                child: Text(
                                  'تقييم الخدمة',
                                  style:
                                      TextStyle(color: AppColors.primaryColor),
                                ),
                              ),
                            ],
                          )
                        : ElevatedButton(
                            onPressed: () {
                              _toggleVisibility();
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.primaryColor),
                              minimumSize: MaterialStateProperty.all<Size>(
                                Size(double.infinity, 50),
                              ),
                            ),
                            child: Text(
                              'الغاء الطلب',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          )
                ],
              ),
            ),
          ),
          PopUpForRemoveRequest(
            toggleVisibility: _toggleVisibility,
            changePopUp: changePopUp,
            isVisible: _isVisible,
            firstPopUp: _firstPopUp,
          )
        ],
      ),
    );
  }
}
