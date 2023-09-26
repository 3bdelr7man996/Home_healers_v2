import 'package:dr/core/utils/http_helper.dart';

class SearchDS {
  final ApiBaseHelper apiHelper;
  SearchDS({required this.apiHelper});

  Future<Map<String, dynamic>?> GetSearch() async {
    Map<String, dynamic>? response = await apiHelper.get(
      "/api/advertisers",
    );
    return response;
  }
}
