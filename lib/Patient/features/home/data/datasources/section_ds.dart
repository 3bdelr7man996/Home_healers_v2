import 'package:dr/core/utils/http_helper.dart';

class SectionDS {
  final ApiBaseHelper apiHelper;
  SectionDS({required this.apiHelper});

  Future<Map<String, dynamic>?> GetSection({required int sectionNumber}) async {
    var number;
    if (sectionNumber == 0) {
      number = 2;
    } else if (sectionNumber == 1) {
      number = 9;
    } else if (sectionNumber == 2) {
      number = 10;
    } else if (sectionNumber == 3) {
      number = 11;
    } else if (sectionNumber == 4) {
      number = 12;
    } else if (sectionNumber == 5) {
      number = 13;
    } else {
      number = 14;
    }
    Map<String, dynamic>? response = await apiHelper.get(
      "/api/advertisers?status_id=${number}",
    );
    return response;
  }
}
//required Map<String, String> body,