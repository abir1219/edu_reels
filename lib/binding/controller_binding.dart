import 'package:get/get.dart';

import '../controller/reels_controller.dart';
import '../controller/slider_controller.dart';

class ControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ReelsController>(() => ReelsController());
    Get.lazyPut<SliderController>(() => SliderController());
  }

}