import 'package:flutter/material.dart';

class ModleStatus {
  final String text;
  final Color colors;

  ModleStatus(this.text, this.colors);
}

ModleStatus statusText({required String status}) {
  ModleStatus modleStatus = ModleStatus(status, Colors.grey.shade200);
  if (status == 'reviewing') {
    modleStatus = ModleStatus('المراجعة', Colors.amberAccent);
  } else if (status == 'confirmed') {
    modleStatus = ModleStatus('مقبول', Colors.greenAccent);
  } else if (status == 'wait_confirm') {
    modleStatus = ModleStatus('انتظار الدفع', Colors.amberAccent);
  } else if (status == 'pending') {
    modleStatus = ModleStatus('تحديث الموعد', Colors.amberAccent);
  } else if (status == 'completed') {
    modleStatus = ModleStatus('مكتمل', Colors.lightBlue.shade200);
  } else if (status == 'canceled') {
    modleStatus = ModleStatus('الغاء', Colors.redAccent.shade200);
  }
  return modleStatus;
}
