import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../core/config/mixins/card_controller.dart';

final trueFalseQuistion =
    ChangeNotifierProvider<TrueFalseQuistion>((ref) => TrueFalseQuistion());

class TrueFalseQuistion extends ChangeNotifier with Controller {
  // // late QuistionType currentQuestionType;
  // bool questionAnswered = false;

  // void setQuestionAnswered(bool answered) {
  //   questionAnswered = answered;
  //   submet();
  // }

  // String word = 'Der Vater';
  // String xword = 'Der Vater';
  // String difin = 'أب';

  // bool _buttonPressed = false;

  // String _result = "";

  // // void falseButton() {
  // //   bool correct = word != xword;
  // //   _result = correct ? "عاااش يابطل جواب صح " : "غلط ياصديقي ";
  // //   _buttonPressed = true;
  // //   notifyListeners();
  // // }

  // void submet() {
  //   bool correct = word == xword;
  //   _result = correct ? "عاااش يابطل جواب صح " : "غلط ياصديقي ";
  //   _buttonPressed = true;
  //   notifyListeners();
  // }

  // bool get buttonPressed => _buttonPressed;
  // String get result => _result;
}
