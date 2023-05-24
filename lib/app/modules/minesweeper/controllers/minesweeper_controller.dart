import 'package:get/get.dart';

class Cell {
  int row;
  int col;
  dynamic content;
  bool reveal = false;

  Cell(this.row, this.col, this.content, this.reveal);
}

class MinesweeperController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
