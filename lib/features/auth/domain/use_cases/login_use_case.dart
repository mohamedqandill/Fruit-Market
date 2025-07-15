import 'package:injectable/injectable.dart';
import 'package:responsive_adaptive_ui/features/auth/data/models/login_user_model.dart';
import 'package:responsive_adaptive_ui/features/auth/domain/repos/auth_repo.dart';

@injectable
class LoginUseCase {
  AuthRepo authRepo;
  LoginUseCase(this.authRepo);

  Future<LoginUserModel> call(String email, String password) =>
      authRepo.login(email, password);
}
