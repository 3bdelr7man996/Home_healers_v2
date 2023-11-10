import 'package:dr/Patient/features/setting/data/datasources/evaluations_ds.dart';
import 'package:dr/Patient/features/setting/data/models/evaluations_model.dart';

class evaluationsRepo {
  final evaluationsDS dataSource;

  evaluationsRepo({required this.dataSource});

  Future<evaluationsModel> sendEvaluation({
    required Map<String, dynamic> body,
  }) async {
    print("bodyyyy== $body");
    evaluationsModel sendEvaluation = evaluationsModel.fromJson(
      await dataSource.sendEvaluation(
        body: body,
      ),
    );
    return sendEvaluation;
  }
}
