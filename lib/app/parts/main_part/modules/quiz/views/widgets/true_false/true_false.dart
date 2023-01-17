import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoulingo/app/parts/main_part/modules/quiz/views/widgets/true_false/controller.dart';
import 'package:zoulingo/core/config/utils/colors.dart';

class TrueFlaseCard extends ConsumerWidget {
  const TrueFlaseCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(trueFalseQuistion);

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: h * 0.04),
      child: Container(
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
                      color: AppColors.secondPrimary),
                ),
              ),
              Image.asset("assets/images/vater.png"),
              Text(
                controller.difin,
                style: Theme.of(context).textTheme.headline5,
              ),
              const Divider(
                endIndent: 20,
                indent: 20,
              ),
              Text(
                controller.word,
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
                        // controller.trueButton();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                      ),
                      child: const Text('True'),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.07,
                    width: w * 0.35,
                    child: ElevatedButton(
                      onPressed: () {
                        // controller.s();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: Colors.red,
                      ),
                      child: const Text('Flase'),
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
