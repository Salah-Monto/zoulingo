import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoulingo/app/parts/quizes_part/data/models/quistion_model.dart';
import 'package:zoulingo/app/parts/quizes_part/modules/quiz/controller/quiz.controller.dart';
import 'package:zoulingo/core/config/utils/colors.dart';

class TrueFlaseCard extends ConsumerWidget {
  final bool _questionSelected = false;
  final Question questionObject;
  const TrueFlaseCard({super.key, required this.questionObject});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;

    final controller = ref.watch(cardQuizController);
    controller.questionObject1 = questionObject;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: h * 0.04),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  "صح ام خطأ",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 15,
                        // color: Colors.white70,
                        color: AppColors.secondPrimary,
                      ),
                ),
              ),
              // Image.asset("assets/images/vater.png"),
              Text(
                questionObject.definition!,
                style: Theme.of(context).textTheme.headline5,
              ),
              const Divider(
                endIndent: 20,
                indent: 20,
              ),
              Text(
                controller.chooseRandomQuestion(),
                style: Theme.of(context).textTheme.headline5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: h * 0.07,
                    width: w * 0.35,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.checkAnswer(true);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                      ),
                      child: const Text('صح'),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.07,
                    width: w * 0.35,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.checkAnswer(false);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: Colors.red,
                      ),
                      child: const Text('خطأ'),
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: controller.buttonPressed,
                child: Text(
                  controller.result,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
