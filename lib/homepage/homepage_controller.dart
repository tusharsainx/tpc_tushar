import 'package:get/get.dart';
import 'package:tpc_assignment/homepage/pair.dart';

class HomepageController extends GetxController {
  /// 0-> empty, 1-> red, 2-> green
  final Map<int, int> slotState = {};
  static const Map<int, String> playerMapper = {1: "Red", 2: "Green"};
  int counter = 42;
  @override
  void onInit() {
    fillSlots();
    super.onInit();
  }

  void fillSlots() {
    for (int i = 0; i < 42; i++) {
      slotState[i] = 0;
    }
    return;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void dropDisk(int index, int turn) {
    if (isSpacePresentInColumn(index)) {
      slotState[index] = turn;
      counter--;
      checkWinner(index, turn);
    } else {
      Get.snackbar("Slot Already filled", "Choose another slot");
    }
    if (counter == -1) {
      showGameDrawSnackBar();
    }
  }

  void showGameDrawSnackBar() {
    //if board is filled, show game draw
    Get.snackbar("Game is draw", "");
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
      int ind = 7 * (coord.x + 1) - (7 - i - 1);
      if (slotState[ind] == turn) {
        counter++;
      } else {
        break;
      }
    }
    for (int i = coord.y - 1; i >= 0; i--) {
      int ind = 7 * (coord.x + 1) - (7 - i - 1);
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
      int ind = 7 * (i + 1) - (7 - coord.y - 1);
      if (slotState[ind] == turn) {
        counter++;
      } else {
        break;
      }
    }
    for (int i = coord.x - 1; i >= 0; i--) {
      int ind = 7 * (i + 1) - (7 - coord.y - 1);
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
      int ind = 7 * (i + 1) - (7 - j - 1);
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
      int ind = 7 * (i + 1) - (7 - j - 1);
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
  }

  void showWinnerDialog(int turn) {
    /// Due to shortage of time,  replacing dialog with snackbar
    Get.snackbar("${playerMapper[turn]} wins", "");
  }

  bool isSpacePresentInColumn(index) {
    return slotState[index] == 0;
  }

  Pair findCoord(int index) {
    int y = (index + 1) % 7 - 1;
    int x = (index + 1) ~/ 7;
    return Pair(x, y);
  }
}
