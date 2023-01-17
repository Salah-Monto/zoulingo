import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swipeable_card_stack/swipe_controller.dart';

import '../../../../../../../../core/config/utils/enums.dart';
import '../sentance_choosing/sentece_choose.dart';

final trueFalseQuistion =
    ChangeNotifierProvider<TrueFalseQuistion>((ref) => TrueFalseQuistion());

class TrueFalseQuistion extends ChangeNotifier {
  SwipeableCardSectionController cardController =
      SwipeableCardSectionController();
  List<Widget> myCards = const [ChooseWordSentenceCard()];
  late QuistionType currentQuestionType;
  bool questionAnswered = false;

  void setCurrentQuestionType(QuistionType type) {
    currentQuestionType = type;
    notifyListeners();
  }

  void setQuestionAnswered(bool answered) {
    questionAnswered = answered;
    notifyListeners();
  }

  String word = 'Der Vater';
  String xword = 'Der Vater';
  String difin = 'أب';

  bool _buttonPressed = false;

  String _result = "";

  bool _isChecked = false;

  // void falseButton() {
  //   bool correct = word != xword;
  //   _result = correct ? "عاااش يابطل جواب صح " : "غلط ياصديقي ";
  //   _buttonPressed = true;
  //   notifyListeners();
  // }

  void submet() {
    print("image222");
    if (isChecked) {
      cardController.triggerSwipeRight();
      _isChecked = false;
      notifyListeners();
    } else {
      bool correct = word == xword;
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
