import 'package:basicui/userModel.dart';
import 'package:get/get.dart';

import 'appRoutes.dart';
import 'authRepository.dart';


class AuthController extends GetxController {
  final AuthRepository _repo = AuthRepository();

  var isLoading = false.obs;

  Future<void> signup(String name, String email, String password) async {
    isLoading.value = true;
    final user = UserModel(name: name, email: email, password: password);
    await _repo.signup(user);
    isLoading.value = false;
    Get.offAllNamed(AppRoutes.home);
  }

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    final success = await _repo.login(email, password);
    isLoading.value = false;
    if (success) {
      Get.offAllNamed(AppRoutes.home);
    } else {
      Get.snackbar("Error", "Invalid email or password");
    }
  }

  Future<void> logout() async {
    await _repo.logout();
    Get.offAllNamed(AppRoutes.login);
  }
}
