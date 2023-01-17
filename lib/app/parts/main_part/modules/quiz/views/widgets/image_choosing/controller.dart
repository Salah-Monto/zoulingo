import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swipeable_card_stack/swipe_controller.dart';
import 'package:zoulingo/app/parts/main_part/modules/quiz/views/widgets/sentance_choosing/sentece_choose.dart';

import '../../../data/models/quistion_model.dart';

final cardQuizController =
    ChangeNotifierProvider<CardQuiz>((ref) => CardQuiz());

class CardQuiz extends ChangeNotifier {
  SwipeableCardSectionController cardController =
      SwipeableCardSectionController();
  List<Widget> myCards = const [ChooseWordSentenceCard()];
  String selectedAnswer = '';
  bool isSelected = false;
  bool _buttonPressed = false;
  String _result = "";
  bool _isChecked = false;
  final question = Question(word: "Vater", wrongImages: [
    "assets/images/woman.png",
    "assets/images/vater.png",
    "assets/images/woman.png",
    "assets/images/woman.png"
  ]);
  int _selectedIndex = -1;
  String _selectedCardImage = "";

  void onCardTapped(int index, String image) {
    _selectedIndex = index;
    _selectedCardImage = image;
    notifyListeners();
  }

  void submiteAnswer() {
    if (isChecked && cardController != null) {
      cardController.triggerSwipeRight();
      _isChecked = false;
      notifyListeners();
    } else {
      bool correct = _selectedCardImage == question.wrongImages![1];
      _result = correct ? "عاااش يابطل جواب صح " : "غلط ياصديقي ";
      _buttonPressed = true;
      _isChecked = true;
      notifyListeners();
    }
  }

  bool get isChecked => _isChecked;
  int get selectedIndex => _selectedIndex;
  String get selectedCardImage => _selectedCardImage;
  bool get buttonPressed => _buttonPressed;
  String get result => _result;
}
