import 'package:mobx/mobx.dart';

part 'controller.g.dart';

class VideosCategoriesController extends _VideosCategoriesController
    with _$VideosCategoriesController {}

abstract class _VideosCategoriesController with Store {
  @observable
  bool isClicked = false;

  @action
  bool openDialog() {
    isClicked = true;
    return isClicked;
  }
}
