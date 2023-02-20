import 'package:flutter_riverpod/flutter_riverpod.dart';

final homePageStateProvider =
    StateNotifierProvider<HomePageState, int>((ref) => HomePageState());

class HomePageState extends StateNotifier<int> {
  HomePageState() : super(0);

  void setIndex(int index) {
    state = index;
  }
}
