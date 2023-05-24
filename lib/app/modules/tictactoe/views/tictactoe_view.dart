import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tictactoe_controller.dart';
import '../themeui/color.dart';

class TictactoeView extends GetView<TictactoeController> {
  const TictactoeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double boardWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: MainColor.primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                "It's ${controller.lastValue.value} turn".toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 58,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            //now we will make the game board
            //but first we will create a Game class that will contains all the data and method that we will need
            SizedBox(
              width: boardWidth,
              height: boardWidth,
              child: Obx(
                () => GridView.count(
                  crossAxisCount: controller.boardlenth ~/
                      3, // the ~/ operator allows you to evide to integer and return an Int as a result
                  padding: const EdgeInsets.all(16.0),
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  children: List.generate(controller.boardlenth, (index) {
                    return InkWell(
                      onTap: controller.gameOver.value
                          ? null
                          : () {
                              //when we click we need to add the new value to the board and refrech the screen
                              //we need also to toggle the player
                              //now we need to apply the click only if the field is empty
                              //now let's create a button to repeat the game

                              if (controller.board[index] == "") {
                                controller.board[index] =
                                    controller.lastValue.value;
                                controller.turn.value += 1;
                                controller.gameOver.value =
                                    controller.winnerCheck(
                                        controller.lastValue.value,
                                        index,
                                        controller.scoreboard,
                                        3);

                                if (controller.gameOver.value) {
                                  controller.result.value =
                                      "${controller.lastValue.value} is the Winner";
                                } else if (!controller.gameOver.value &&
                                    controller.turn.value == 9) {
                                  controller.result.value = "It's a Draw!";
                                  controller.gameOver.value = true;
                                }
                                if (controller.lastValue.value == "X") {
                                  controller.lastValue.value = "O";
                                } else {
                                  controller.lastValue.value = "X";
                                }
                              }
                              controller.update();
                            },
                      child: Container(
                        width: controller.blocSize,
                        height: controller.blocSize,
                        decoration: BoxDecoration(
                          color: MainColor.secondaryColor,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Center(
                          child: Text(
                            controller.board[index],
                            style: TextStyle(
                              color: controller.board[index] == "X"
                                  ? Colors.blue
                                  : Colors.pink,
                              fontSize: 64.0,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Obx(
              () => Text(
                controller.result.value,
                style: const TextStyle(color: Colors.white, fontSize: 54.0),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                //erase the board
                controller.restartGame();
                controller.lastValue.value = "X";
                controller.gameOver.value = false;
                controller.turn.value = 0;
                controller.result.value = "";
                controller.scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
              },
              icon: const Icon(Icons.replay),
              label: const Text("Repeat the Game"),
            ),
          ],
        ));
    //the first step is organise our project folder structure
  }
}
