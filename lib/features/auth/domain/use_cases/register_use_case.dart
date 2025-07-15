import 'package:injectable/injectable.dart';
import 'package:responsive_adaptive_ui/features/auth/data/models/RegisterResponse.dart';
import 'package:responsive_adaptive_ui/features/auth/data/models/register_model.dart';
import 'package:responsive_adaptive_ui/features/auth/domain/repos/auth_repo.dart';

@injectable
class RegisterUseCase {
  AuthRepo authRepo;
  RegisterUseCase(this.authRepo);

  Future<RegisterResponse> call(RegisterModel registerModel) =>
      authRepo.register(registerModel);
}
