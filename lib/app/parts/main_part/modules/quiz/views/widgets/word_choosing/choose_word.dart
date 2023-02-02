import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoulingo/app/parts/main_part/modules/quiz/views/widgets/image_choosing/controller.dart';
import 'package:zoulingo/core/config/utils/colors.dart';

import '../../../data/models/quistion_model.dart';

class ChooseWordCard extends ConsumerWidget {
  final Question questionObject;
  const ChooseWordCard({Key? key, required this.questionObject})
      : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    // final controller = ref.watch(wordQuizController);
    final controller = ref.watch(cardQuizController);
    controller.questionObject1 = questionObject;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: h * 0.04),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  "إختر الإجابة الصحيحه",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 15,
                      // color: Colors.white70,
                      color: AppColors.secondPrimary),
                ),
              ),
              SizedBox(
                height: h * 0.05,
              ),
              Text(
                controller.questionObject1!.word,
                style: Theme.of(context).textTheme.headline5,
              ),
              const Divider(
                indent: 20,
                endIndent: 20,
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(children: [
                  ...controller.questionObject1!.definitions!
                      .map((option) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: h * 0.07,
                              width: w * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                  image: AssetImage("assets/images/logo.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Center(
                                child: RadioListTile(
                                  value: option,
                                  groupValue: controller.selectedAnswer,
                                  activeColor: AppColors.primary,
                                  dense: false,
                                  onChanged: (value) {
                                    controller.selectOption2(value!);
                                  },
                                  title: Text(
                                    option,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(color: AppColors.primary),
                                  ),
                                ),
                              ),
                            ),
                          )),
                  Visibility(
                    visible: controller.buttonPressed,
                    child: Text(
                      controller.result,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ]),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
