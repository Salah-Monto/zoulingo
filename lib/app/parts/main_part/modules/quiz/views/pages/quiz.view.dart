import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoulingo/core/config/mixins/card_controller.dart';
import 'package:zoulingo/core/config/utils/colors.dart';
import '../../data/models/quistion_model.dart';
import '../widgets/image_choosing/choose_card.dart';
import '../widgets/image_choosing/controller.dart';
import '../widgets/true_false/true_false.dart';
import '../widgets/word_choosing/choose_word.dart';
import '../widgets/sentance_choosing/sentece_choose.dart';
// import '../widgets/smilerties.dart';

// ignore: must_be_immutable
class QuizView extends ConsumerWidget with Controller {
  QuizView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(cardQuizController);
    List<Widget> generateQuestionTypes(List<Question> questions) {
      // List<Question> wrongQuestions = controller.wrongQuistions;
      var questionTypes = [
        for (var i = 0; i < 3; i++) ChooseCard(questionObject: questions[i]),
        for (var i = 0; i < 3; i++)
          ChooseWordSentenceCard(questionObject: questions[i]),
        for (var i = 0; i < 3; i++)
          ChooseWordCard(questionObject: questions[i]),
        for (var i = 0; i < 3; i++) TrueFlaseCard(questionObject: questions[i]),
      ];
      // if (controller.wrongQuistions.isNotEmpty) {
      //   var wrongQuestionTypes = [
      //     for (var i = 0; i < 3; i++)
      //       ChooseWordCard(questionObject: wrongQuestions[i]),
      //   ];
      //   questionTypes.addAll(wrongQuestionTypes);
      // }
      return questionTypes;
    }

    List<Widget> questionTypes = generateQuestionTypes(questions);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            OutlinedButton(onPressed: () {}, child: const Text("Skip")),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/logo.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                      width: double.infinity,
                      height: 35,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFF3F4768), width: 3),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Stack(
                        children: [
                          LayoutBuilder(
                            builder: (context, constraints) => Container(
                              width: constraints.maxWidth *
                                  controller.quistionItemLentgh,
                              decoration: BoxDecoration(
                                color: AppColors.babyBlue,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ],
                        //     );
                        //   },
                      )),
                ),
                Expanded(
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller.pageController,
                    onPageChanged: controller.updateTheQnNum,
                    // itemCount: questionTypes.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: questionTypes[index],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
