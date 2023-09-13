import 'package:dr/Patient/features/home/presentation/pages/filter_result_screen.dart';
import 'package:dr/Patient/features/home/presentation/widgets/filter_widgets.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:flutter/material.dart';

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

var arrayForTitle = [
  "أخصائي علاج أول",
  "أخصائي علاج طبيعي",
  "استشاري علاج طبيعي"
];

var arrayForSections = [
  "الام العضلات والمفاصل",
  "إصابات عضلية رياضية",
  "إصابات الجهاز العصبي",
  "تأهيل الأطفال",
  "تأهيل مابعد العمليات الجراحية",
  "مشاكل المرأة الصحية",
  "انعاش القلب الرئوي"
];

var arrayForGender = ["ذكر", "أنثى"];

var arrayForCity = [
  "الرياض",
  "الرياض",
  "الرياض",
  "الرياض",
  "الرياض",
  "الرياض",
  "الرياض",
  "الرياض",
  "الرياض",
  "الرياض",
  "الرياض",
  "الرياض",
  "الرياض",
  "الرياض",
  "الرياض",
  "الرياض",
  "الرياض",
  "الرياض"
];

var arrayForStreets = ["المرسلات", "الصحافة", "المصيف", "النزهة"];

class _FiterScreenState extends State<FiterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarForFilter(context,
          title: "filter_for_search", backButton: true),
      bottomNavigationBar: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            AppConstants.customNavigation(context, FilterResultScreen(), -1, 0);
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
              arrayForTitle: arrayForTitle,
            ),
            RaioButtonsSections(
              title: "اختر القسم",
              selectedValue: selectedValue2,
              arrayForTitle: arrayForSections,
            ),
            RaioButtonsSections(
              title: "اختر جنس الأخصائي",
              selectedValue: selectedValue3,
              arrayForTitle: arrayForGender,
            ),
            RaioButtonsSections(
              title: "اختر المدينة",
              selectedValue: selectedValue4,
              arrayForTitle: arrayForCity,
              num: 2,
            ),
            RaioButtonsSections(
              title: "اختر الحي",
              selectedValue: selectedValue5,
              arrayForTitle: arrayForStreets,
              num: 2,
            ),
          ],
        ),
      ),
    );
  }
}
