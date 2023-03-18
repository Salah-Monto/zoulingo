import 'package:flash_card/flash_card.dart';
import 'package:flashcardplus/flashcardplus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoulingo/app/parts/quizes_part/data/models/quistion_model.dart';
import 'package:zoulingo/app/parts/quizes_part/modules/quiz/controller/quiz.controller.dart';
import 'package:zoulingo/core/config/mixins/card_controller.dart';
import 'package:zoulingo/core/config/utils/colors.dart';

// ignore: must_be_immutable
class FLashCardsView extends ConsumerWidget with Controller {
  FLashCardsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainController = ref.watch(cardQuizController);
    List<Widget> generateFlashCards(List<Question> questions) {
      final list = [
        for (var i = 0; i < questions.length; i++)
          [FlashCards(questionObject: questions[i])], // wrap in list
      ];
      return list
          .expand((element) => element)
          .toList(); // flatten list of lists
    }

    final List<Widget> flashCards = generateFlashCards(questions);
    final FlashCardController controller = FlashCardController();
    return Stack(
      children: [
        FlashCardPlus(
          cards: flashCards,
          controller: controller,
          size: const Size(500, 700),
          onForward: (index, info) {
            if (info.direction == SwipeDirection.left) {
              controller.append(mainController.addNewCard(index, flashCards));
            }
          },
        )
      ],
    );
  }
}

class FlashCards extends ConsumerWidget {
  final Question questionObject;
  const FlashCards({super.key, required this.questionObject});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(cardQuizController);
    controller.questionObject1 = questionObject;
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: h * 0.03),
      child: FlashCard(
        height: h * 0.81,
        width: w * 0.9,
        frontWidget: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                controller.questionObject1!.article,
                style: const TextStyle(
                  color: AppColors.babyBlue,
                  fontSize: 35,
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                controller.questionObject1!.word,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                " 'mein vater ist im werk' ",
                style: Theme.of(context).textTheme.headline5,
              ),
              InkWell(
                onTap: () {
                  controller.speak(
                    controller.questionObject1!,
                  );
                },
                child: const Icon(
                  Icons.record_voice_over,
                  size: 40,
                  color: AppColors.white,
                ),
              )
            ],
          ),
        ),
        backWidget: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(controller.questionObject1!.image!),
              Text(
                controller.questionObject1!.definition!,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                " 'والدي في العمل' ",
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// SwipableStack(
        //   controller: controller,
        //   itemCount: flashCards.length,
        //   onSwipeCompleted: (index, direction) {
        //     if (direction == SwipeDirection.left) {}
        //   },
        //   builder: (context, swipeProperty) {
        //     return flashCards[swipeProperty.index];
        //   },
        // )