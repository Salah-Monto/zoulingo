import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swipeable_card_stack/swipe_controller.dart';
import 'package:zoulingo/app/parts/main_part/modules/quiz/views/widgets/sentance_choosing/sentece_choose.dart';

import '../../../data/models/quistion_model.dart';

final senteceQuizController =
    ChangeNotifierProvider<SentenceQuistion>((ref) => SentenceQuistion());

class SentenceQuistion extends ChangeNotifier {
  SwipeableCardSectionController cardController =
      SwipeableCardSectionController();
  List<Widget> myCards = const [ChooseWordSentenceCard()];
  String selectedAnswer = '';
  bool _buttonPressed = false;
  String _result = "";
  bool _isChecked = false;
  void selectOption(String option) {
    selectedAnswer = option;
    notifyListeners();
  }

  var question = Question(
      word: "Der",
      question: "....... vater ist im work ",
      wrongAnswers: ["Die", "Der", "Das"]);

  void submitAnswer2() {
    if (isChecked) {
      cardController.triggerSwipeRight();
      _isChecked = false;
      notifyListeners();
    } else {
      bool correct = selectedAnswer == question.word;
      _result = correct ? "عاااش يابطل جواب صح " : "غلط ياصديقي ";
      _buttonPressed = true;
      _isChecked = true;
      notifyListeners();
    }
  }

  bool get isChecked => _isChecked;

  bool get buttonPressed => _buttonPressed;
  String get result => _result;
}
