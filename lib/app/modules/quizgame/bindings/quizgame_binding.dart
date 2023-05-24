import 'package:get/get.dart';

import '../controllers/quizgame_controller.dart';

class QuizgameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizgameController>(
      () => QuizgameController(),
    );
  }
}
