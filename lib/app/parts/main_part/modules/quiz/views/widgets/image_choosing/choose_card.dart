import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoulingo/app/parts/main_part/modules/quiz/views/widgets/image_choosing/controller.dart';
import 'package:zoulingo/core/config/utils/colors.dart';
import '../../../data/models/quistion_model.dart';

class CardChoice extends StatelessWidget {
  final bool isActive;
  final String image;
  const CardChoice({Key? key, required this.isActive, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: isActive
            ? Border.all(color: Colors.blue, width: 5)
            : const Border(),
        image: const DecorationImage(
          image: AssetImage(
            "assets/images/logo.jpg",
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Center(
        child: Image.asset(
          image,
          height: 120,
        ),
      ),
    );
  }
}

class ChooseCard extends ConsumerWidget {
  final Question questionObject;
  const ChooseCard({Key? key, required this.questionObject}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    final controller = ref.watch(cardQuizController);
    controller.questionObject1 = questionObject;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: h * 0.04),
      child: Container(
        height: h * 0.7,
        width: w * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: AppColors.primary),
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
                height: h * 0.02,
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
                height: h * 0.02,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        controller.onCardTapped(index,
                            controller.questionObject1!.wrongImages![index]);
                      },
                      child: CardChoice(
                        isActive: controller.selectedIndex == index,
                        image: controller.questionObject1!.wrongImages![index],
                      ),
                    );
                  },
                ),
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
