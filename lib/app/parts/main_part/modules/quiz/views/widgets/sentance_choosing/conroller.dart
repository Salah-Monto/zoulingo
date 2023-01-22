import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swipable_stack/swipable_stack.dart';

import 'package:zoulingo/app/parts/main_part/modules/quiz/views/widgets/sentance_choosing/sentece_choose.dart';

import '../../../../../../../../core/config/mixins/card_controller.dart';
import '../../../data/models/quistion_model.dart';

final senteceQuizController =
    ChangeNotifierProvider<SentenceQuistion>((ref) => SentenceQuistion());

class SentenceQuistion extends ChangeNotifier with Controller {
  Question? questionObject1;
  String selectedAnswer = '';
  bool _buttonPressed = false;
  String _result = "";

  void selectOption(String option) {
    selectedAnswer = option;
    submitAnswer();
  }

  void submitAnswer() {
    bool correct = selectedAnswer == questionObject1!.word;
    _result = correct ? "عاااش يابطل جواب صح " : "غلط ياصديقي ";
    _buttonPressed = true;
    next();
    notifyListeners();
  }

  bool get buttonPressed => _buttonPressed;
  String get result => _result;
}
