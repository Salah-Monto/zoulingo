import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swipeable_card_stack/swipe_controller.dart';

final wordQuizController =
    ChangeNotifierProvider<ChooseWordQuistion>((ref) => ChooseWordQuistion());

class ChooseWordQuistion extends ChangeNotifier {
  SwipeableCardSectionController cardController =
      SwipeableCardSectionController();
  // List<Widget> myCards = const [ChooseWordSentenceCard()];
  String question = 'Der Vater';
  String correctAnswer = 'أب';
  List<String> options = ['أب', 'أم', 'أخ', 'أخت'];
  String selectedAnswer = '';
  bool _buttonPressed = false;
  String _result = "";
  bool _isChecked = false;
  void selectOption(String option) {
    selectedAnswer = option;
    notifyListeners();
  }

  void submitAnswer() {
    if (isChecked) {
      _isChecked = false;
      notifyListeners();
    } else {
      bool correct1 = selectedAnswer == correctAnswer;
      _result = correct1 ? "عاااش يابطل جواب صح " : "غلط ياصديقي ";

      _buttonPressed = true;
      cardController.triggerSwipeRight();
      _isChecked = true;
      notifyListeners();
    }
  }

  bool get isChecked => _isChecked;
  String get result => _result;
  bool get buttonPressed => _buttonPressed;
}
