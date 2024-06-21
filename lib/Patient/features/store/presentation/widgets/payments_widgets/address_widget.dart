import 'package:dr/Patient/features/store/presentation/widgets/payments_widgets/select_location_widget.dart';
import 'package:flutter/material.dart';

class AddressWidget extends StatefulWidget {
  const AddressWidget({super.key});

  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  int _selectedValue = 1;
  final TextEditingController control = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '23-شارع الحرية - الرياض -السعودية',
                  style: TextStyle(fontSize: 16),
                ),
                Radio(
                  value: 1,
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value as int;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '23-شارع الحرية - الرياض -السعودية',
                  style: TextStyle(fontSize: 16),
                ),
                Radio(
                  value: 2,
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value as int;
                    });
                  },
                ),
              ],
            ),
            SelectLocationWidget(
              control: control,
            )
          ],
        ),
      ),
    );
  }
}
