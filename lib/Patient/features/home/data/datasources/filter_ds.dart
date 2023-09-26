import 'package:dr/core/utils/http_helper.dart';

class FilterDs {
  final ApiBaseHelper apiHelper;
  FilterDs({required this.apiHelper});

  Future<Map<String, dynamic>?> GetFilter({
    required int? sectionNumber,
    required int? category_id,
    required int? cityId,
    required int? areaId,
    required String? gender,
  }) async {
    String route = "/api/advertisers?" +
        (category_id != null && category_id != -1
            ? '&category_id=$category_id'
            : '') +
        (sectionNumber != null && sectionNumber != -1
            ? '&status_id=$sectionNumber'
            : '') +
        (cityId != null && cityId != -1 ? '&city_id=$cityId' : '') +
        (areaId != null && areaId != -1 ? '&area_id=$areaId' : '') +
        (gender != null && gender != "-1" ? '&gender=$gender' : '');
    print(route);
    Map<String, dynamic>? response = await apiHelper.get(
      route,
    );
    return response;
  }
}
