import 'package:injectable/injectable.dart';
import 'package:responsive_adaptive_ui/features/auth/data/data_source/auth_data_source.dart';
import 'package:responsive_adaptive_ui/features/auth/data/models/RegisterResponse.dart';
import 'package:responsive_adaptive_ui/features/auth/data/models/login_user_model.dart';
import 'package:responsive_adaptive_ui/features/auth/data/models/register_model.dart';

import '../../domain/repos/auth_repo.dart';
import '../models/forget_pass_model.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthDataSource authDataSource;
  AuthRepoImpl(this.authDataSource);
  @override
  Future<RegisterResponse> register(RegisterModel registerModel) async {
    try {
      var result = await authDataSource.register(registerModel);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LoginUserModel> login(String email, String password) async {
    try {
      var result = await authDataSource.login(email, password);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ForgetPassModel> forgetPassword(String email) async {
    try {
      var result = await authDataSource.forgetPassword(email);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
