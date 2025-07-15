import 'package:injectable/injectable.dart';
import 'package:responsive_adaptive_ui/features/auth/domain/repos/auth_repo.dart';

import '../../data/models/forget_pass_model.dart';

@injectable
class ForgetPasswordUseCase {
  AuthRepo authRepo;
  ForgetPasswordUseCase(this.authRepo);

  Future<ForgetPassModel> call(String email) => authRepo.forgetPassword(email);
}
