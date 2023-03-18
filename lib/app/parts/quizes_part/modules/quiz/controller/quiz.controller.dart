// ignore_for_file: type_annotate_public_apis, non_constant_identifier_names, avoid_dynamic_calls

import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:zoulingo/app/parts/quizes_part/data/models/quistion_model.dart';
import 'package:zoulingo/app/parts/quizes_part/modules/quiz/views/widgets/choose_card.dart';
import 'package:zoulingo/app/parts/quizes_part/modules/quiz/views/widgets/choose_word.dart';
import 'package:zoulingo/app/parts/quizes_part/modules/quiz/views/widgets/flash_card.dart';
import 'package:zoulingo/app/parts/quizes_part/modules/quiz/views/widgets/sentece_choose.dart';
import 'package:zoulingo/app/parts/quizes_part/modules/quiz/views/widgets/true_false.dart';
import 'package:zoulingo/core/config/mixins/card_controller.dart';

final cardQuizController =
    ChangeNotifierProvider<CardQuiz>((ref) => CardQuiz());

class CardQuiz extends ChangeNotifier with Controller {
  final PageController pageController;
  final FlutterTts flutterTts = FlutterTts();
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
  bool choiceMad = false;

  // final int _questionNumber = 1;

  List<Widget> generateQuestionTypes(List<Question> questions) {
    final List<Question> wrongQuestions = wrongQuistions;

    final questionTypes = [
      FLashCardsView(),
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
      final List<ConsumerWidget> wrongQuestionTypes = [];
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
                ChooseWordSentenceCard(questionObject: wrongQuestions[i]),
              );
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
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
      );
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

  // ignore: avoid_positional_boolean_parameters
  void checkAnswer(bool userAnswer) {
    // print(word + questionObject1!.word);
    if (_choiceMade) {
      return;
    } else {
      bool correct;
      if (word == questionObject1!.word) {
        correct = true;
      } else {
        correct = false;
      }
      if (userAnswer == correct) {
        _result = "عاااش يابطل جواب صح";
        // wrongQuistions.remove(questionObject1!);
        // print(wrongQuistions.length);
      } else {
        _result = "خطأ ياصديقي ";
        addWrongQuestion(correct, questionObject1!, 1);
      }

      next();
      _choiceMade = true;
      _buttonPressed = true;
      notifyListeners();
    }
  }

  String chooseRandomQuestion() {
    final int randomIndex = Random().nextInt(questions.length);
    word = questions[randomIndex].word;
    choiceMad = true;
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
    final int len = questions.length * 4;
    final double qnumber = 1 / len;
    quistionItemLentgh += qnumber;
    notifyListeners();
  }

  void addWrongQuestion(
    // ignore: avoid_positional_boolean_parameters
    bool correctAnswer,
    Question wrongQuestion,
    int qTypeNumber,
  ) {
    if (!correctAnswer) {
      final newWrongQuestions = wrongQuistions.toList();
      newWrongQuestions.add(wrongQuestion);
      wrongQuistions = newWrongQuestions;
      wrongQuestion.qType = qTypeNumber;
      if (kDebugMode) {
        print(wrongQuistions.length);
      }
    }
  }

  void submitAnswer() {
    final bool correct = _selectedCardImage == questionObject1!.wrongImages![1];
    _result = correct ? "عاااش يابطل جواب صح " : "خطأ ياصديقي ";
    if (correct) {
      wrongQuistions.remove(questionObject1);
    }
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
    final bool correct1 = selectedAnswer == questionObject1!.definition;
    _result = correct1 ? "عاااش يابطل جواب صح " : "غلط ياصديقي ";
    // if (correct1) {
    //   wrongQuistions.remove(questionObject1!);
    //   print(wrongQuistions.length);
    // }
    _buttonPressed = true;
    addWrongQuestion(correct1, questionObject1!, 2);
    next();
    notifyListeners();
  }

  void submitAnswer1() {
    final bool correct = selectedAnswer == questionObject1!.word;
    _result = correct ? "عاااش يابطل جواب صح " : "خطأ ياصديقي ";
    // if (correct) {
    //   wrongQuistions.remove(questionObject1!);
    //   print(wrongQuistions.length);
    // }
    _buttonPressed = true;
    addWrongQuestion(correct, questionObject1!, 3);
    next();
    notifyListeners();
  }

  Future speak(Question question) async {
    await flutterTts.setLanguage("de-DE");
    await flutterTts.speak('${question.article} ${question.word}');
  }

  List<Widget> addNewCard(int index, List<Widget> flashCards) {
    final List<Widget> flashCardsList = [];
    flashCardsList.add(flashCards[index]);
    print(flashCardsList.length);
    return flashCardsList;
  }

  int get selectedIndex => _selectedIndex;
  String get selectedCardImage => _selectedCardImage;
  bool get buttonPressed => _buttonPressed;
  String get result => _result;
}
