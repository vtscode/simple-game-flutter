import 'package:get/get.dart';
import '../utils/models.dart';

class TictactoeController extends GetxController {
  //adding the necessary variables
  final lastValue = "X".obs;
  final gameOver = false.obs;
  final turn = 0.obs; // to check the draw
  final result = "".obs;
  List<int> scoreboard = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ]; //the score are for the different combination of the game [Row1,2,3, Col1,2,3, Diagonal1,2];
  //let's declare a new Game components
  final boardlenth = 9; // we will creare a board of 3*3 blocks;
  final blocSize = 100.0;

  //Creating the empty board
  late List<String> board;

  @override
  void onInit() {
    restartGame();
    super.onInit();
  }

  void restartGame() {
    board = List.generate(boardlenth, (index) => Player.empty).obs;
  }

  bool winnerCheck(
      String player, int index, List<int> scoreboard, int gridSize) {
    //first let's declare the row   and col
    int row = index ~/ 3;
    int col = index % 3;
    int score = player == "X" ? 1 : -1;

    scoreboard[row] += score;
    scoreboard[gridSize + col] += score;
    if (row == col) scoreboard[2 * gridSize] += score;
    if (gridSize - 1 - col == row) scoreboard[2 * gridSize + 1] += score;

    //checking if we have 3 or -3 in the score board
    if (scoreboard.contains(3) || scoreboard.contains(-3)) {
      return true;
    }

    //by default it will return false
    return false;
  }
}
