import 'package:swipable_stack/swipable_stack.dart';

import '../../../app/parts/main_part/modules/quiz/data/models/quistion_model.dart';

mixin Controller {
  final controller1 = SwipableStackController();
  // final PageController controller = PageController();
  List<Question> questions = [
    Question(
        word: "Vater",
        definition: 'أب',
        definitions: ['أب', 'أم', 'أخ', 'أخت'],
        question: "....... ist im work ",
        wrongImages: [
          "assets/images/woman.png",
          "assets/images/vater.png",
          "assets/images/woman.png",
          "assets/images/woman.png"
        ],
        options: ["Die Mutter", "Vater", "Das Kind", "Dos"]),
    Question(
        word: "Haus",
        definition: 'المنزل',
        definitions: ['المنزل', 'الشارع', 'الجامعة', 'المدرسة'],
        question: "Ich wohne in einem .......",
        wrongImages: [
          "assets/images/woman.png",
          "assets/images/vater.png",
          "assets/images/woman.png",
          "assets/images/woman.png"
        ],
        options: ["Haus", "Cafe", "Bibliothek", "Fitnessstudio"]),
    Question(
        word: "Hund",
        definition: 'الكلب',
        definitions: ['الكلب', 'القط', 'الزجاج', 'الجداول'],
        question: "Ich habe einen .......",
        wrongImages: [
          "assets/images/woman.png",
          "assets/images/vater.png",
          "assets/images/woman.png",
          "assets/images/woman.png"
        ],
        options: ["Katze", "Glas", "Tisch", "Hund"])
  ];

  // void next() {
  //   Future.delayed(
  //       const Duration(seconds: 2),
  //       () => controller.nextPage(
  //           duration: const Duration(milliseconds: 250), curve: Curves.ease));
  // }
}
