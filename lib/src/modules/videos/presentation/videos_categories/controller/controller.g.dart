// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VideosCategoriesController on _VideosCategoriesController, Store {
  final _$isClickedAtom = Atom(name: '_VideosCategoriesController.isClicked');

  @override
  bool get isClicked {
    _$isClickedAtom.reportRead();
    return super.isClicked;
  }

  @override
  set isClicked(bool value) {
    _$isClickedAtom.reportWrite(value, super.isClicked, () {
      super.isClicked = value;
    });
  }

  final _$_VideosCategoriesControllerActionController =
      ActionController(name: '_VideosCategoriesController');

  @override
  bool openDialog() {
    final _$actionInfo = _$_VideosCategoriesControllerActionController
        .startAction(name: '_VideosCategoriesController.openDialog');
    try {
      return super.openDialog();
    } finally {
      _$_VideosCategoriesControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isClicked: ${isClicked}
    ''';
  }
}
