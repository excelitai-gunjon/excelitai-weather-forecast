import 'package:excelitai_weather_forecast/src/ui/home/home_controller.dart';
import 'package:get/instance_manager.dart';
// import 'package:weather_app/src/ui/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(city: 'Dhaka'));
  }
}
