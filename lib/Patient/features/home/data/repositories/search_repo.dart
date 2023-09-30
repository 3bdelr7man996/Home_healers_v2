import 'package:dr/Patient/features/home/data/datasources/search_ds.dart';
import 'package:dr/Patient/features/home/data/models/section-model.dart';

class SearchRepo {
  final SearchDS dataSource;

  SearchRepo({required this.dataSource});

  Future<SectionModel> GetSearch() async {
    SectionModel signUpResponse = SectionModel.fromJson(
      await dataSource.GetSearch(),
    );
    return signUpResponse;
  }
}
