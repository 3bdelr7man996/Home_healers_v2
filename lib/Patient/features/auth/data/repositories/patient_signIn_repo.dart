import 'package:dr/Patient/features/auth/data/datasources/patient_signIn_ds.dart';
import 'package:dr/Patient/features/auth/data/models/sign_in_patient_model.dart';

class SignInPatientRepo {
  final PatientSignInDS dataSource;

  SignInPatientRepo({required this.dataSource});

  Future<SignInForPatientModel> signIn({
    required Map<String, String> body,
  }) async {
    print("bodyyyy== $body");
    SignInForPatientModel signUpResponse = SignInForPatientModel.fromJson(
      await dataSource.signUp(
        body: body,
      ),
    );
    return signUpResponse;
  }
}
