import 'package:dr/Patient/features/home/presentation/widgets/sections_widgets.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';

class SectionsScreen extends StatefulWidget {
  final BuildContext context;

  const SectionsScreen({required this.context, Key? key}) : super(key: key);

  @override
  State<SectionsScreen> createState() => _SectionsScreenState();
}

int i = 0;

class _SectionsScreenState extends State<SectionsScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (i == 0) {
      Future.delayed(Duration.zero, () {
        showModalBottomSheet(
          context: widget.context,
          builder: (BuildContext context) {
            return const BottomSheetForPatient();
          },
        );
      });
    }
    i++;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustumAppBarForPatient(),
        10.ph,
        const SliderForPatient(),
        10.ph,
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
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
        const Expanded(child: IconsForSections()),
      ],
    );
  }
}
