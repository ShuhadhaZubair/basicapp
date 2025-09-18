import 'package:get/get.dart';
import 'Home.dart';
import 'Login.dart';
import 'Signup.dart';

class AppRoutes {
  static const login = '/login';
  static const signup = '/signup';
  static const home = '/home';

  static final pages = [
    GetPage(name: login, page: () => const Login()),
    GetPage(name: signup, page: () => const Signup()),
    GetPage(name: home, page: () => const Home()),
  ];
}
