import 'package:swipable_stack/swipable_stack.dart';

import '../../../app/parts/main_part/modules/quiz/data/models/quistion_model.dart';

mixin Controller {
  final controller = SwipableStackController();
  var questionObject = Question(
      word: "Der Vater",
      definition: 'أب',
      definitions: ['أب', 'أم', 'أخ', 'أخت'],
      question: "....... ist im work ",
      wrongImages: [
        "assets/images/woman.png",
        "assets/images/vater.png",
        "assets/images/woman.png",
        "assets/images/woman.png"
      ],
      wrongAnswers: ["Die Mutter", "Der Vater", "Das Kind", "Dos"]);
  void next() {
    Future.delayed(
        const Duration(seconds: 2),
        () => controller.next(
            ignoreOnWillMoveNext: true,
            swipeDirection: SwipeDirection.right,
            duration: const Duration(milliseconds: 500)));
  }
}
