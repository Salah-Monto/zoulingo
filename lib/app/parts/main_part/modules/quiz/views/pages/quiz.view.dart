import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swipable_stack/swipable_stack.dart';
import 'package:zoulingo/core/config/mixins/card_controller.dart';
import '../widgets/image_choosing/choose_card.dart';
import '../widgets/word_choosing/choose_word.dart';
import '../widgets/flash_card.dart';
import '../widgets/sentance_choosing/sentece_choose.dart';
// import '../widgets/smilerties.dart';
import '../widgets/true_false/true_false.dart';

class QuizView extends ConsumerWidget with Controller {
  QuizView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> questionTypes = [
      const FlashCards(),
      ChooseCard(questionObject: questionObject),
      ChooseWordCard(questionObject: questionObject),
      const TrueFlaseCard(),
      ChooseWordSentenceCard(questionObject: questionObject),
    ];
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
