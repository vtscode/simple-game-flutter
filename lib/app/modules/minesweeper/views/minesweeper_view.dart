import 'package:flutter/material.dart';

import 'package:get/get.dart';

import './main_screen.dart';
import '../controllers/minesweeper_controller.dart';

class MinesweeperView extends GetView<MinesweeperController> {
  const MinesweeperView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MainScreen();
  }
}
