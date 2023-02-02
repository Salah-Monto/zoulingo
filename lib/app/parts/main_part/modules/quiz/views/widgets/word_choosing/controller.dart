import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoulingo/app/parts/main_part/modules/quiz/data/models/quistion_model.dart';

final wordQuizController =
    ChangeNotifierProvider<ChooseWordQuistion>((ref) => ChooseWordQuistion());

class ChooseWordQuistion extends ChangeNotifier {
  Question? questionObject1;
}
