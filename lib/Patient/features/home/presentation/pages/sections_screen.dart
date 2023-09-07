import 'package:dr/Patient/features/home/presentation/widgets/sections_widgets.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SectionsScreen extends StatefulWidget {
  final BuildContext context;

  const SectionsScreen({required this.context, Key? key}) : super(key: key);

  @override
  State<SectionsScreen> createState() => _SectionsScreenState();
}

class _SectionsScreenState extends State<SectionsScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(Duration.zero, () {
      showModalBottomSheet(
        context: widget.context,
        builder: (BuildContext context) {
          return BottomSheetForPatient();
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustumAppBarForPatient(),
        10.ph,
        SliderForPatient(),
        10.ph,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "الأقسام",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        ),
        10.ph,
        Expanded(child: IconsForSections()),
      ],
    );
  }
}
