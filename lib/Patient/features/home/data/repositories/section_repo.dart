import 'package:dr/Patient/features/home/data/datasources/section_ds.dart';
import 'package:dr/Patient/features/home/data/models/section-model.dart';

class SectionRepo {
  final SectionDS dataSource;

  SectionRepo({required this.dataSource});

  Future<SectionModel> GetSection({required sectionNumber}) async {
    // print("bodyyyy== $body");
    SectionModel signUpResponse = SectionModel.fromJson(
      await dataSource.GetSection(sectionNumber: sectionNumber),
    );
    return signUpResponse;
  }
}

// required Map<String, String> body,
