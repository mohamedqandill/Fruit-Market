import 'package:responsive_adaptive_ui/features/auth/data/models/RegisterResponse.dart';

import '../models/forget_pass_model.dart';
import '../models/login_user_model.dart';
import '../models/register_model.dart';

abstract class AuthDataSource {
  Future<RegisterResponse> register(RegisterModel model);
  Future<LoginUserModel> login(String email, String password);
  Future<ForgetPassModel> forgetPassword(String email);
}
