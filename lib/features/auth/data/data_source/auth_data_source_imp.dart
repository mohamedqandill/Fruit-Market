import 'package:injectable/injectable.dart';
import 'package:responsive_adaptive_ui/core/apis/api_manager.dart';
import 'package:responsive_adaptive_ui/core/apis/end_points.dart';
import 'package:responsive_adaptive_ui/core/local_storage_service/prefs.dart';
import 'package:responsive_adaptive_ui/features/auth/data/data_source/auth_data_source.dart';
import 'package:responsive_adaptive_ui/features/auth/data/models/RegisterResponse.dart';
import 'package:responsive_adaptive_ui/features/auth/data/models/login_user_model.dart';
import 'package:responsive_adaptive_ui/features/auth/data/models/register_model.dart';

import '../../../../di.dart';
import '../models/forget_pass_model.dart';

@Injectable(as: AuthDataSource)
class AuthDataSourceImp implements AuthDataSource {
  AuthDataSourceImp();

  @override
  Future<RegisterResponse> register(RegisterModel model) async {
    try {
      SharedPrefs prefs = SharedPrefs();
      await prefs.init();
      final response = await getIt<ApiManager>()
          .postData(endPoints: EndPoints.register, body: {
        "name": model.name,
        "mobile": model.phone,
        "email": model.email,
        "password": model.password
      });
      var data = RegisterResponse.fromJson(response.data);
      if (response.statusCode == 200) {
        if (data.data!.token != null) {
          var token = await prefs.setString("token", data.data!.token!);
        }
      }
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LoginUserModel> login(String email, String password) async {
    try {
      final response = await getIt<ApiManager>().postData(
          endPoints: EndPoints.login,
          body: {"phone_email": email, "password": password});
      var data = LoginUserModel.fromJson(response.data);
      return data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<ForgetPassModel> forgetPassword(String email) async {
    try {
      final response = await getIt<ApiManager>().postData(
          endPoints: EndPoints.forgetPassword, body: {"email": email});
      var data = ForgetPassModel.fromJson(response.data);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
