import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swipable_stack/swipable_stack.dart';
import 'package:zoulingo/core/config/mixins/card_controller.dart';
import '../../data/models/quistion_model.dart';
import '../widgets/image_choosing/choose_card.dart';
import '../widgets/word_choosing/choose_word.dart';
import '../widgets/sentance_choosing/sentece_choose.dart';
// import '../widgets/smilerties.dart';

// ignore: must_be_immutable
class QuizView extends ConsumerWidget with Controller {
  QuizView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> generateQuestionTypes(List<Question> questions) {
      return [
        for (var i = 0; i < 3; i++) ChooseCard(questionObject: questions[i]),
        for (var i = 0; i < 3; i++)
          ChooseWordCard(questionObject: questions[i]),
        for (var i = 0; i < 3; i++)
          ChooseWordSentenceCard(questionObject: questions[i]),
      ];
    }

    // List<Widget> generateQuestionTypes(List<Question> questions) {
    //   var random = Random();
    //   questions.shuffle(random);
    //   return [
    //     for (var i = 0; i < 3 && i < questions.length; i++)
    //       ChooseCard(questionObject: questions[i]),
    //     for (var i = 0; i < 3 && i < questions.length; i++)
    //       ChooseWordCard(questionObject: questions[i]),
    //     for (var i = 0; i < 3 && i < questions.length; i++)
    //       ChooseWordSentenceCard(questionObject: questions[i]),
    //   ];
    // }

    List<Widget> questionTypes = generateQuestionTypes(questions);
    // List<Widget> questionTypes = [
    //   ChooseCard(questionObject: quistioins.first),
    //   ChooseWordCard(questionObject: quistioins[1]),
    //   ChooseWordSentenceCard(questionObject: quistioins.last),
    //   ChooseCard(questionObject: quistioins[1]),
    //   ChooseWordCard(questionObject: quistioins.last),
    //   ChooseWordSentenceCard(questionObject: quistioins.first),
    //   ChooseCard(questionObject: quistioins.last),
    //   ChooseWordCard(questionObject: quistioins.first),
    //   ChooseWordSentenceCard(questionObject: quistioins[1]),
    // ];
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/logo.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              SwipableStack(
                itemCount: questionTypes.length,
                controller: controller,
                builder: (
                  context,
                  swipeProperty,
                ) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: questionTypes[swipeProperty.index],
                    ),
                  );
                },
              ),
              OutlinedButton(
                  onPressed: () {
                    controller.next(swipeDirection: SwipeDirection.right);
                  },
                  child: const Text("hahaha"))
            ],
          ),
        ),
      ),
    );
  }
}
