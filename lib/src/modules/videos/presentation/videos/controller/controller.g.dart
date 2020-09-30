// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VideoScreenController on _VideoScreenController, Store {
  final _$pageChangedAtom = Atom(name: '_VideoScreenController.pageChanged');

  @override
  bool get pageChanged {
    _$pageChangedAtom.reportRead();
    return super.pageChanged;
  }

  @override
  set pageChanged(bool value) {
    _$pageChangedAtom.reportWrite(value, super.pageChanged, () {
      super.pageChanged = value;
    });
  }

  final _$_VideoScreenControllerActionController =
      ActionController(name: '_VideoScreenController');

  @override
  bool showScreen(dynamic index) {
    final _$actionInfo = _$_VideoScreenControllerActionController.startAction(
        name: '_VideoScreenController.showScreen');
    try {
      return super.showScreen(index);
    } finally {
      _$_VideoScreenControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageChanged: ${pageChanged}
    ''';
  }
}
