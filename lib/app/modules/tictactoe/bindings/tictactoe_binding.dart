import 'package:get/get.dart';

import '../controllers/tictactoe_controller.dart';

class TictactoeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TictactoeController>(
      () => TictactoeController(),
    );
  }
}
