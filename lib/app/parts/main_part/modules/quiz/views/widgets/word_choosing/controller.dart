import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoulingo/app/parts/main_part/modules/quiz/data/models/quistion_model.dart';

import '../../../../../../../../core/config/mixins/card_controller.dart';

final wordQuizController =
    ChangeNotifierProvider<ChooseWordQuistion>((ref) => ChooseWordQuistion());

class ChooseWordQuistion extends ChangeNotifier with Controller {
  Question? questionObject1;
  String selectedAnswer = '';
  bool _buttonPressed = false;
  String _result = "";

  void selectOption(String option) {
    selectedAnswer = option;
    submitAnswer();
  }

  void submitAnswer() {
    bool correct1 = selectedAnswer == questionObject1!.definition;
    _result = correct1 ? "عاااش يابطل جواب صح " : "غلط ياصديقي ";
    _buttonPressed = true;
    // next();
    notifyListeners();
  }

  String get result => _result;
  bool get buttonPressed => _buttonPressed;
}
