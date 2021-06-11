import 'package:albumapp/Presentation/SplashScreen/spalsh_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String INITIAL = '/';

  static List<GetPage> routes = [
    GetPage(name: INITIAL, page: () => SpalshScreen()),
  ];
}
