import 'package:swipable_stack/swipable_stack.dart';

mixin Controller {
  final controller = SwipableStackController();
  void next() {
    Future.delayed(
        const Duration(seconds: 2),
        () => controller.next(
            ignoreOnWillMoveNext: true,
            swipeDirection: SwipeDirection.right,
            duration: const Duration(milliseconds: 500)));
  }
}
