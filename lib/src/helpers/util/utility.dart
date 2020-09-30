import 'package:flutter/material.dart';

class Utility {
  static screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top;
  }
}
