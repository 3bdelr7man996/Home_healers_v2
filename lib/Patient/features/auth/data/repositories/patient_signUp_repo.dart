import 'package:dr/Patient/features/auth/data/datasources/patient_signUp_ds.dart';

import '../models/sign_up_patient_model.dart';

class SignUpPatientRepo {
  final PatientSignUpDS dataSource;

  SignUpPatientRepo({required this.dataSource});

  Future<SignUpForPatientModel> signUP({
    required Map<String, String> body,
  }) async {
    print("bodyyyy== $body");
    SignUpForPatientModel signUpResponse = SignUpForPatientModel.fromJson(
      await dataSource.signUp(
        body: body,
      ),
    );
    return signUpResponse;
  }
}
