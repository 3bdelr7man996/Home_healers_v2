import 'package:dr/Patient/features/home/presentation/pages/payment_details_screen.dart';
import 'package:dr/Patient/features/home/presentation/widgets/date_of_session_widgets.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';

class DateOfSessionScreen extends StatefulWidget {
  const DateOfSessionScreen({super.key});

  @override
  _DateOfSessionScreenState createState() => _DateOfSessionScreenState();
}

class _DateOfSessionScreenState extends State<DateOfSessionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,
          title: "choose_your_reservation_date", backButton: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TableClenderForSession(),
            30.ph,
            TextFormField(
              maxLines: 7,
              decoration: InputDecoration(
                hintText:
                    'تفاصيل أخري \nتشخيص سابق - ملاحظات - الوقت المناسب للزيارة',
                hintStyle: TextStyle(fontSize: 12),
              ),
            ),
            10.ph,
            TextField(
              decoration: InputDecoration(
                hintText: 'حدد موقع الجلسة العلاجية',
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/icons/session_location_icon.svg",
                    width: 5,
                    height: 5,
                  ),
                ),
              ),
            ),
            20.ph,
            Container(
              width: context.width,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  AppConstants.customNavigation(
                      context, PaymentDetailsScreen(withOffer: true), -1, 0);
                },
                child: Text('تابع الدفع'),
                style: ElevatedButton.styleFrom(
                  primary: AppColors.primaryColor,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
