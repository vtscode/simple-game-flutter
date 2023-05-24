import 'package:get/get.dart';

import '../controllers/minesweeper_controller.dart';

class MinesweeperBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MinesweeperController>(
      () => MinesweeperController(),
    );
  }
}
