import 'package:dr/Patient/features/home/data/datasources/filter_ds.dart';
import 'package:dr/Patient/features/home/data/models/section-model.dart';

class FilterRepo {
  final FilterDs dataSource;

  FilterRepo({required this.dataSource});

  Future<SectionModel> GetFilter(
      {required sectionNumber,
      required category_id,
      required areaId,
      required cityId,
      required gender}) async {
    SectionModel signUpResponse = SectionModel.fromJson(
      await dataSource.GetFilter(
          sectionNumber: sectionNumber,
          category_id: category_id,
          areaId: areaId,
          cityId: cityId,
          gender: gender),
    );
    return signUpResponse;
  }
}

// required Map<String, String> body,
