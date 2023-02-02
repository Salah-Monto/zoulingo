import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../core/config/mixins/card_controller.dart';
import '../../../data/models/quistion_model.dart';

final cardQuizController =
    ChangeNotifierProvider<CardQuiz>((ref) => CardQuiz());

class CardQuiz extends ChangeNotifier with Controller {
  final PageController pageController;
  // final ChooseWordQuistion chooseWordQuestion = ChooseWordQuistion();
  // final SentenceQuistion sentenceQuistion = SentenceQuistion();
  CardQuiz() : pageController = PageController();
  Question? questionObject1;
  String selectedAnswer = '';
  bool isSelected = false;
  bool _buttonPressed = false;
  String _result = "";
  int _selectedIndex = -1;
  String _selectedCardImage = "";
  bool _choiceMade = false;
  double quistionItemLentgh = 0;
  void next() {
    Future.delayed(const Duration(seconds: 2), () {
      pageController.nextPage(
          duration: const Duration(milliseconds: 350), curve: Curves.ease);
      updateTheQnStatus();

      selectedAnswer = '';
      isSelected = false;
      _buttonPressed = false;
      _result = "";
      _selectedIndex = -1;
      _selectedCardImage = "";
      questionObject1 = null;
      _choiceMade = false;
    });
  }

  void onCardTapped(int index, String image) {
    if (_choiceMade) {
      return;
    }
    _selectedIndex = index;
    _selectedCardImage = image;
    _choiceMade = true;
    submitAnswer();
  }

  void updateTheQnStatus() {
    int len = questions.length * 3;
    double qnumber = 1 / (len);
    quistionItemLentgh += qnumber;
    notifyListeners();
  }

  void submitAnswer() {
    bool correct = _selectedCardImage == questionObject1!.wrongImages![1];
    _result = correct ? "عاااش يابطل جواب صح " : "خطأ ياصديقي ";
    _buttonPressed = true;
    next();
    notifyListeners();
  }

  void selectOption(String option) {
    if (_choiceMade) {
      return;
    }

    selectedAnswer = option;
    _choiceMade = true;
    submitAnswer1();
  }

  void selectOption2(String option) {
    if (_choiceMade) {
      return;
    }
    selectedAnswer = option;
    _choiceMade = true;
    submitAnswer2();
  }

  void submitAnswer2() {
    bool correct1 = selectedAnswer == questionObject1!.definition;
    //  print(selectedAnswer + questionObject1!.definition);
    _result = correct1 ? "عاااش يابطل جواب صح " : "غلط ياصديقي ";
    _buttonPressed = true;
    next();
    notifyListeners();
  }

  void submitAnswer1() {
    bool correct = selectedAnswer == questionObject1!.word;
    // print(selectedAnswer + questionObject1!.word);
    _result = correct ? "عاااش يابطل جواب صح " : "خطأ ياصديقي ";
    _buttonPressed = true;
    next();
    notifyListeners();
  }

  int get selectedIndex => _selectedIndex;
  String get selectedCardImage => _selectedCardImage;
  bool get buttonPressed => _buttonPressed;
  String get result => _result;
}
