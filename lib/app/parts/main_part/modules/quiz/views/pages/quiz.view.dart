import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import 'package:zoulingo/app/parts/main_part/modules/quiz/views/widgets/image_choosing/controller.dart';
import 'package:zoulingo/app/parts/main_part/modules/quiz/views/widgets/true_false/controller.dart';
import 'package:zoulingo/app/parts/main_part/modules/quiz/views/widgets/word_choosing/controller.dart';
import 'package:zoulingo/core/config/utils/colors.dart';

import '../../../../../../../core/config/utils/enums.dart';
import '../../controller/quiz.controller.dart';
import '../widgets/image_choosing/choose_card.dart';
import '../widgets/word_choosing/choose_word.dart';
import '../widgets/complate_word.dart';
import '../widgets/flash_card.dart';
import '../widgets/sentance_choosing/sentece_choose.dart';
// import '../widgets/smilerties.dart';
import '../widgets/true_false/true_false.dart';

class QuizView extends ConsumerWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    final controller = ref.watch(trueFalseQuistion);
    final controller1 = ref.watch(wordQuizController);
    final controller2 = ref.watch(senteceQuizController);
    final controller3 = ref.watch(cardQuizController);
    List<Widget> myCards = const [ChooseWordSentenceCard()];
    QuistionType questionType = QuistionType.wordChoose;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/logo.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SwipeableCardsSection(
                cardController: controller.cardController,
                context: context,
                items: const [ChooseCard(), ChooseWordCard(), TrueFlaseCard()],
                onCardSwiped: (dir, index, widget) {
                  switch (widget.runtimeType) {
                    case ChooseCard:
                      questionType = QuistionType.cardChoose;
                      break;
                    case ChooseWordCard:
                      questionType = QuistionType.wordChoose;
                      break;
                    case TrueFlaseCard:
                      questionType = QuistionType.trueFalse;
                      break;
                    default:
                      controller.isChecked;
                      break;
                  }

                  controller.cardController
                      .addItem(const ChooseWordSentenceCard());
                },
                cardHeightBottomMul: 1,
                cardHeightTopMul: 1,
                cardHeightMiddleMul: 1,
                enableSwipeUp: false,
                enableSwipeDown: false,
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  try {
                    switch (questionType) {
                      case QuistionType.wordChoose:
                        controller3.submiteAnswer();
                        // controller1.submitAnswer();
                        break;
                      case QuistionType.sentenceChoose:
                        controller2.submitAnswer2();
                        break;
                      case QuistionType.cardChoose:
                        controller1.submitAnswer();
                        // controller3.submiteAnswer();
                        break;
                      case QuistionType.trueFalse:
                        controller.submet();
                        break;
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: Container(
                  width: w * 0.85,
                  height: h * 0.07,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [AppColors.primary, AppColors.babyBlue],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Center(
                    child: Text(
                      'التالي ',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
