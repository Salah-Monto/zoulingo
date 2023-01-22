import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../core/config/mixins/card_controller.dart';
import '../../../data/models/quistion_model.dart';

final cardQuizController =
    ChangeNotifierProvider<CardQuiz>((ref) => CardQuiz());

class CardQuiz extends ChangeNotifier with Controller {
  Question? questionObject1;
  String selectedAnswer = '';
  bool isSelected = false;
  bool _buttonPressed = false;
  String _result = "";
  int _selectedIndex = -1;
  String _selectedCardImage = "";

  void onCardTapped(int index, String image) {
    _selectedIndex = index;
    _selectedCardImage = image;
    submiteAnswer();
  }

  void submiteAnswer() {
    bool correct = _selectedCardImage == questionObject1!.wrongImages![1];
    _result = correct ? "عاااش يابطل جواب صح " : "غلط ياصديقي ";
    _buttonPressed = true;
    next();
    notifyListeners();
  }

  int get selectedIndex => _selectedIndex;
  String get selectedCardImage => _selectedCardImage;
  bool get buttonPressed => _buttonPressed;
  String get result => _result;
}
