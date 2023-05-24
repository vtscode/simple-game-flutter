import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/memorygame/bindings/memorygame_binding.dart';
import '../modules/memorygame/views/memorygame_view.dart';
import '../modules/minesweeper/bindings/minesweeper_binding.dart';
import '../modules/minesweeper/views/minesweeper_view.dart';
import '../modules/quizgame/bindings/quizgame_binding.dart';
import '../modules/quizgame/views/quizgame_view.dart';
import '../modules/tictactoe/bindings/tictactoe_binding.dart';
import '../modules/tictactoe/views/tictactoe_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MINESWEEPER;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TICTACTOE,
      page: () => const TictactoeView(),
      binding: TictactoeBinding(),
    ),
    GetPage(
      name: _Paths.MEMORYGAME,
      page: () => MemorygameView(),
      binding: MemorygameBinding(),
    ),
    GetPage(
      name: _Paths.QUIZGAME,
      page: () => const QuizgameView(),
      binding: QuizgameBinding(),
    ),
    GetPage(
      name: _Paths.MINESWEEPER,
      page: () => const MinesweeperView(),
      binding: MinesweeperBinding(),
    ),
  ];
}
