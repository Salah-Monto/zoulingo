import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoulingo/core/config/mixins/card_controller.dart';
import 'package:zoulingo/core/config/utils/colors.dart';
import '../../data/models/quistion_model.dart';
import '../widgets/image_choosing/choose_card.dart';
import '../widgets/image_choosing/controller.dart';
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

    List<Widget> questionTypes = generateQuestionTypes(questions);
    final controller1 = ref.watch(cardQuizController);
    // final PageController controller = PageController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // Fluttter show the back button automatically
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ProgressBar(),
                ),
                Expanded(
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller1.pageController,
                    // onPageChanged: _questionController.updateTheQnNum,
                    itemCount: questionTypes.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: questionTypes[index],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Stack(
          //   children: [
          //     SwipableStack(
          //       itemCount: questionTypes.length,
          //       controller: controller,
          //       builder: (
          //         context,
          //         swipeProperty,
          //       ) {
          //         return Padding(
          //           padding: const EdgeInsets.all(16),
          //           child: Card(
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(30)),
          //             child: questionTypes[swipeProperty.index],
          //           ),
          //         );
          //       },
          //     ),
          //     OutlinedButton(
          //         onPressed: () {
          //           controller.next(swipeDirection: SwipeDirection.right);
          //         },
          //         child: const Text("hahaha"))
          //   ],
          // ),
        ),
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 35,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF3F4768), width: 3),
          borderRadius: BorderRadius.circular(50),
        ),
        child:
            //  GetBuilder<QuestionController>(
            //   init: QuestionController(),
            //   builder: (controller) {
            //     return
            Stack(
          children: [
            LayoutBuilder(
              builder: (context, constraints) => Container(
                // from 0 to 1 it takes 60s
                width: constraints.maxWidth * 0.5,
                decoration: BoxDecoration(
                  color: AppColors.babyBlue,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ],
          //     );
          //   },
        ));
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