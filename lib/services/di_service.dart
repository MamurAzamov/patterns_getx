import 'package:get/get.dart';
import 'package:patterns_getx/controllers/splash_controller.dart';
import '../controllers/main_controller.dart';
import '../controllers/starter_controller.dart';

class DIService {
  static Future<void> init() async {
    // Get.put<MainController>(MainController());
    Get.lazyPut<MainController>(() => MainController(), fenix: true);
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.lazyPut<StarterController>(() => StarterController(), fenix: true);
  }
}
