import 'package:mobx/mobx.dart';

part 'controller.g.dart';

class VideoScreenController extends _VideoScreenController
    with _$VideoScreenController {}

abstract class _VideoScreenController with Store {
  int pageCounter = 0;

  @observable
  bool pageChanged = true;

  @action
  // ignore: missing_return
  bool showScreen(index) {
    pageCounter = index;
    if (pageCounter > 0 && pageCounter < 5) {
      index--;
      index = index;
      return pageChanged = true;
    } else {
      pageChanged = false;
    }
  }
}
