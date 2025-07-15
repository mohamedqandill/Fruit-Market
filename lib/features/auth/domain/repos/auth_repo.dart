import 'package:responsive_adaptive_ui/features/auth/data/models/RegisterResponse.dart';
import 'package:responsive_adaptive_ui/features/auth/data/models/login_user_model.dart';
import 'package:responsive_adaptive_ui/features/auth/data/models/register_model.dart';

import '../../data/models/forget_pass_model.dart';

abstract class AuthRepo {
  Future<RegisterResponse> register(RegisterModel registerModel);
  Future<LoginUserModel> login(String email, String password);
  Future<ForgetPassModel> forgetPassword(String email);
}
