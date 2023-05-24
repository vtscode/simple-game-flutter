import 'package:get/get.dart';

import '../controllers/memorygame_controller.dart';

class MemorygameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MemorygameController>(
      () => MemorygameController(),
    );
  }
}
