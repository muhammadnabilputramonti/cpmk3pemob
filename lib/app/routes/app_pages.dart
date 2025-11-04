import 'package:get/get.dart';

import '../modules/login/views/login_view.dart';
import '../modules/register/views/register_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/settings/views/settings_view.dart';

import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
    ),

    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterView(),
    ),

    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
    ),

    GetPage(
      name: Routes.PROFILE,
      page: () => const ProfileView(),
    ),

    GetPage(
      name: Routes.SETTINGS,
      page: () => const SettingsView(),
    ),
  ];
}
