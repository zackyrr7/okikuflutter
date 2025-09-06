import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:okiku/modules/auth/services/auth_services.dart';

class AuthController extends GetxController {
  var isLoginIsSelected = true.obs;
  var isLoading = false.obs;
  var secureText = true.obs;
  var secureText2 = true.obs;
  final storage = FlutterSecureStorage();
  final googleLogin = GoogleSignIn();
  void selectLogin() => isLoginIsSelected.value = true;
  void selectRegister() => isLoginIsSelected.value = false;
  final AuthServices _authServices = AuthServices();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordVerifController = TextEditingController();

  var email = ''.obs;
  var name = ''.obs;
  var googleId = ''.obs;

  void isSecureText() {
    secureText.value = !secureText.value;
  }

  void isSecureText2() {
    secureText2.value = !secureText2.value;
  }

  Future<void> loginGoogle() async {
    isLoading.value = true;

    final googleUser = await googleLogin.signIn();

    if (googleUser == null) {
      isLoading.value = false;
      return;
    }

    final email = googleUser?.email;
    final name = googleUser?.displayName;
    final googleId = googleUser?.id;

    var result = await _authServices.loginGoogle(
      email.toString(),
      name.toString(),
      googleId.toString(),
    );

    if (result['status'] == true && result['message'] == 'detail required') {
      Get.offAndToNamed('/detail-create');
    } else if (result['status'] == true &&
        result['message'] != 'detail required') {
      Get.offAndToNamed('/navbar');
    } else {
      Get.snackbar(
        'Login Gagal',
        result['message'],
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    // final googleAuth = await googleUser.authentication;
    // await storage.write(key: 'accessToken', value: googleAuth.accessToken);
    // await storage.write(key: 'idToken', value: googleAuth.idToken);

    isLoading.value = false;
  }

  Future<void> register() async {
    isLoading.value = true;
    final name = nameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final passwordVerif = passwordVerifController.text;

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        passwordVerif.isEmpty) {
      Get.snackbar(
        'Error',
        'Semua field harus diisi',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    } else if (password != passwordVerif) {
      Get.snackbar('Error', 'Password tidak cocok');
      return;
    }

    try {
      var result = await _authServices.register(name, email, password);

      if (result['status'] == true) {
        Get.offAndToNamed('/navbar');
        emailController.clear();
        nameController.clear();
        passwordController.clear();
        passwordVerifController.clear();
      } else {
        Get.snackbar(
          'Register Gagal',
          result['message'],
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login() async {
    isLoading.value = true;

    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Semua field harus diisi',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      var result = await _authServices.login(email, password);

      if (result['status'] == true && result['message'] != 'detail required') {
        Get.offAndToNamed('/navbar');
        emailController.clear();
        nameController.clear();
        passwordController.clear();
        passwordVerifController.clear();
      } else if (result['status'] == true &&
          result['message'] == 'detail required') {
        Get.offAndToNamed('/navbar');
        emailController.clear();
        nameController.clear();
        passwordController.clear();
        passwordVerifController.clear();
      } else {
        Get.snackbar(
          'Login Gagal',
          result['message'],
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }



  Future<void> logout() async {
    storage.deleteAll();
  }
}
