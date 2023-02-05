import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoulingo/app/parts/main_part/modules/quiz/views/widgets/image_choosing/choose_card.dart';
import 'package:zoulingo/app/parts/main_part/modules/quiz/views/widgets/true_false/true_false.dart';

import '../../../../../../../../core/config/mixins/card_controller.dart';
import '../../../data/models/quistion_model.dart';
import '../sentance_choosing/sentece_choose.dart';
import '../word_choosing/choose_word.dart';

final cardQuizController =
    ChangeNotifierProvider<CardQuiz>((ref) => CardQuiz());

class CardQuiz extends ChangeNotifier with Controller {
  final PageController pageController;
  List<Question> wrongQuistions = [];
  List<Widget> wrongQuistionsType = [];
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
  int numberOfPage = 0;
  String word = "";
  // final int _questionNumber = 1;

  List<Widget> generateQuestionTypes(List<Question> questions) {
    List<Question> wrongQuestions = wrongQuistions;
    var questionTypes = [
      for (var i = 0; i < questions.length; i++)
        ChooseCard(questionObject: questions[i]),
      for (var i = 0; i < questions.length; i++)
        TrueFlaseCard(questionObject: questions[i]),
      for (var i = 0; i < questions.length; i++)
        ChooseWordSentenceCard(questionObject: questions[i]),
      for (var i = 0; i < questions.length; i++)
        ChooseWordCard(questionObject: questions[i]),
    ];
    if (wrongQuistions.isNotEmpty) {
      List<ConsumerWidget> wrongQuestionTypes = [];
      for (var i = 0; i < wrongQuestions.length; i++) {
        switch (wrongQuestions[i].qType) {
          case 0:
            {
              wrongQuestionTypes
                  .add(ChooseCard(questionObject: wrongQuestions[i]));
            }
            break;
          case 1:
            {
              wrongQuestionTypes
                  .add(TrueFlaseCard(questionObject: wrongQuestions[i]));
            }
            break;
          case 2:
            {
              wrongQuestionTypes
                  .add(ChooseWordCard(questionObject: wrongQuestions[i]));
            }
            break;
          case 3:
            {
              wrongQuestionTypes.add(
                  ChooseWordSentenceCard(questionObject: wrongQuestions[i]));
            }
            break;
        }
      }
      questionTypes.addAll(wrongQuestionTypes);
    }
    return questionTypes;
  }

  void next() {
    Future.delayed(const Duration(seconds: 2), () {
      pageController.nextPage(
          duration: const Duration(milliseconds: 400), curve: Curves.ease);
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

  void checkAnswer(bool userAnswer) {
    // print(word + questionObject1!.word);
    if (_choiceMade) {
      return;
    }
    bool correct;
    if (word == questionObject1!.word) {
      correct = true;
    } else {
      correct = false;
    }
    if (userAnswer == correct) {
      _result = "عاااش يابطل جواب صح";
    } else {
      _result = "خطأ ياصديقي ";
    }
    addWrongQuestion(correct, questionObject1!, 1);
    next();
    _choiceMade = true;
    _buttonPressed = true;
    notifyListeners();
  }

  String chooseRandomQuestion() {
    int randomIndex = Random().nextInt(questions.length);
    word = questions[randomIndex].word;
    return word;
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
    int len = questions.length * 4;
    double qnumber = 1 / (len);
    quistionItemLentgh += qnumber;
    notifyListeners();
  }

  void addWrongQuestion(
      bool correctAnswer, Question wrongQuestion, int qTypeNumber) {
    if (!correctAnswer) {
      var newWrongQuestions = wrongQuistions.toSet().toList();
      newWrongQuestions.add(wrongQuestion);
      wrongQuistions = newWrongQuestions;
      wrongQuestion.qType = qTypeNumber;
      // print(wrongQuistions.length);
    }
  }

  void submitAnswer() {
    bool correct = _selectedCardImage == questionObject1!.wrongImages![1];
    _result = correct ? "عاااش يابطل جواب صح " : "خطأ ياصديقي ";

    addWrongQuestion(correct, questionObject1!, 0);
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
    _result = correct1 ? "عاااش يابطل جواب صح " : "غلط ياصديقي ";
    _buttonPressed = true;
    addWrongQuestion(correct1, questionObject1!, 2);
    next();
    notifyListeners();
  }

  void submitAnswer1() {
    bool correct = selectedAnswer == questionObject1!.word;
    _result = correct ? "عاااش يابطل جواب صح " : "خطأ ياصديقي ";
    _buttonPressed = true;
    addWrongQuestion(correct, questionObject1!, 3);
    next();
    notifyListeners();
  }

  int get selectedIndex => _selectedIndex;
  String get selectedCardImage => _selectedCardImage;
  bool get buttonPressed => _buttonPressed;
  String get result => _result;
}
