import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MemorygameController extends GetxController {
  //game stats
  final tries = 0.obs;
  final score = 0.obs;
  final hideTest = false.obs;

  @override
  void onInit() {
    initGame();
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

  final Color hiddenCard = Colors.red;
  late List<Color> gameColors;
  late List<String> gameImg;
  List<Color> cards = [
    Colors.green,
    Colors.yellow,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.blue
  ];
  final String hiddenCardpath = "assets/images/hidden.png";
  List<String> cards_list = [
    "assets/images/circle.png",
    "assets/images/triangle.png",
    "assets/images/circle.png",
    "assets/images/heart.png",
    "assets/images/star.png",
    "assets/images/triangle.png",
    "assets/images/star.png",
    "assets/images/heart.png",
  ];
  final int cardCount = 8;
  List<Map<int, String>> matchCheck = [];

  //methods
  void initGame() {
    gameColors = List.generate(cardCount, (index) => hiddenCard).obs;
    gameImg = List.generate(cardCount, (index) => hiddenCardpath).obs;
  }
}
