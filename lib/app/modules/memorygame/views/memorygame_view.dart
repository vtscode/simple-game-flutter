import 'package:flutter/material.dart';
import '../components/info_card.dart';
import 'package:get/get.dart';

import '../controllers/memorygame_controller.dart';

class MemorygameView extends GetView<MemorygameController> {
  MemorygameView({Key? key}) : super(key: key);
  //setting text style
  TextStyle whiteText = const TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE55870),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Memory Game",
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                info_card("Tries", "${controller.tries.value}"),
                info_card("Score", "${controller.score.value}"),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            child: Obx(
              () => GridView.builder(
                  itemCount: controller.gameImg!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  padding: const EdgeInsets.all(16.0),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print(controller.matchCheck);
                        //incrementing the clicks
                        controller.tries.value += 1;
                        controller.gameImg[index] =
                            controller.cards_list[index];
                        controller.matchCheck
                            .add({index: controller.cards_list[index]});
                        print(controller.matchCheck.first);
                        if (controller.matchCheck.length == 2) {
                          if (controller.matchCheck[0].values.first ==
                              controller.matchCheck[1].values.first) {
                            print("true");
                            //incrementing the score
                            controller.score.value += 100;
                            controller.matchCheck.clear();
                          } else {
                            print("false");

                            Future.delayed(Duration(milliseconds: 500), () {
                              print(controller.gameColors);
                              controller.gameImg[controller.matchCheck[0].keys
                                  .first] = controller.hiddenCardpath;
                              controller.gameImg[controller.matchCheck[1].keys
                                  .first] = controller.hiddenCardpath;
                              controller.matchCheck.clear();
                            });
                          }
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFB46A),
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage(controller.gameImg[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
