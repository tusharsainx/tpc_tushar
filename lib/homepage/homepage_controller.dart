import 'dart:async';
import 'package:get/get.dart';
import 'package:tpc_assignment/homepage/pair.dart';

class HomepageController extends GetxController {
  /// 0-> empty, 1-> red, 2-> green
  final Map<int, int> slotState = {};
  static const Map<int, String> playerMapper = {1: "Red", 2: "Green"};
  int counter = 42;
  final currentTurn = 0.obs;
  Timer? timer;
  final timerDuration = 30.obs;
  final colors = <int>[].obs;
  @override
  void onInit() {
    fillSlots();
    super.onInit();
  }

  void startGame() {
    changeTurn();
  }

  void reset() {
    fillSlots();
    timer?.cancel();
    currentTurn.value = 0;
    timerDuration.value = 30;
  }

  String getDisplayableTimerValue() {
    return "00:${timerDuration.value >= 10 ? timerDuration.value : "0${timerDuration.value}"}";
  }

  void startTimer() {
    timerDuration.value = 30;
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerDuration.value == 0) {
        timer.cancel();
        cancelTurn();
      } else {
        timerDuration.value--;
      }
    });
  }

  void cancelTurn() {
    timer?.cancel();
    changeTurn();
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  void fillSlots() {
    List<int> colorsTemp = <int>[];
    for (int i = 0; i < 42; i++) {
      slotState[i] = 0;

      colorsTemp.add(0xff37311B);
    }
    colors.value = colorsTemp;
    return;
  }

  void changeTurn() {
    if (currentTurn.value == 0) {
      currentTurn.value = 2;
    } else {
      currentTurn.value = (currentTurn.value == 2 ? 1 : 2);
    }
    startTimer();
    return;
  }

  void dropDisk(int index, int turn) {
    if (currentTurn.value == 0) {
      Get.snackbar("Start the game first", "Game not started");
      return;
    }
    if (isSpacePresentInColumn(index)) {
      int color = turn == 2 ? 0xff90EE90 : 0xff8B0000;
      colors[index] = color;
      slotState[index] = turn;
      counter--;
      changeTurn();
      checkWinner(index, turn);
    } else {
      Get.snackbar("Slot Already filled", "Choose another slot");
    }
    if (counter == 0) {
      showGameDrawSnackBar();
    }
  }

  void showGameDrawSnackBar() {
    //if board is filled, show game draw
    Get.snackbar("Game is draw", "");
    timer?.cancel();
  }

  void checkWinner(int index, int turn) {
    bool horizontal = checkWinnerHorizontally(index, turn);
    bool vertical = checkWinnerVertically(index, turn);
    bool leftDiagonal = checkWinnerLeftDiagonal(index, turn);
    bool rightDiagonal = checkWinnerRightDiagonal(index, turn);
    if (horizontal || vertical || leftDiagonal || rightDiagonal) {
      showWinnerDialog(turn);
    }
  }

  bool checkWinnerHorizontally(int index, int turn) {
    Pair coord = findCoord(index);
    int counter = 0;
    for (int i = coord.y; i < 7; i++) {
      // if x=1 and y=4 -> index=14-(2)=12
      int ind = 7 * coord.x + i;
      if (slotState[ind] == turn) {
        counter++;
      } else {
        break;
      }
    }
    for (int i = coord.y - 1; i >= 0; i--) {
      int ind = 7 * coord.x + i;
      if (slotState[ind] == turn) {
        counter++;
      } else {
        break;
      }
    }
    return counter >= 4;
  }

  bool checkWinnerVertically(int index, int turn) {
    Pair coord = findCoord(index);
    int counter = 0;
    for (int i = coord.x; i < 6; i++) {
      int ind = 7 * i + coord.y;
      if (slotState[ind] == turn) {
        counter++;
      } else {
        break;
      }
    }
    for (int i = coord.x - 1; i >= 0; i--) {
      int ind = 7 * i + coord.y;
      if (slotState[ind] == turn) {
        counter++;
      } else {
        break;
      }
    }
    return counter >= 4;
  }

  bool checkWinnerLeftDiagonal(int index, int turn) {
    Pair coord = findCoord(index);
    int counter = 0;
    int i = coord.x;
    int j = coord.y;
    while (i >= 0 && j < 7) {
      int ind = 7 * i + j;
      if (slotState[ind] == turn) {
        counter++;
      } else {
        break;
      }
      i--;
      j++;
    }
    i = coord.x;
    j = coord.y;
    while (i < 6 && j >= 0) {
      int ind = 7 * i + j;
      if (slotState[ind] == turn) {
        counter++;
      } else {
        break;
      }
      i++;
      j--;
    }
    return counter - 1 >= 4;
  }

  bool checkWinnerRightDiagonal(int index, int turn) {
    Pair coord = findCoord(index);
    int counter = 0;
    int i = coord.x;
    int j = coord.y;
    while (i >= 0 && j >= 0) {
      int ind = 7 * i + j;
      if (slotState[ind] == turn) {
        counter++;
      } else {
        break;
      }
      i--;
      j--;
    }
    i = coord.x;
    j = coord.y;
    while (i < 6 && j < 7) {
      int ind = 7 * i + j;
      if (slotState[ind] == turn) {
        counter++;
      } else {
        break;
      }
      i++;
      j++;
    }
    return counter - 1 >= 4;
  }

  void showWinnerDialog(int turn) {
    /// Due to shortage of time,  replacing dialog with snackbar
    Get.snackbar("${playerMapper[turn]} wins", "");
    timer?.cancel();
  }

  bool isSpacePresentInColumn(index) {
    return slotState[index] == 0;
  }

  Pair findCoord(int index) {
    int x = index ~/ 7;
    int y = index - 7 * x;
    return Pair(x, y);
  }
}
