import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:videosIn/src/modules/auth/presentation/sign_in/index.dart';
import 'package:videosIn/src/modules/videos/presentation/videos_categories/index.dart';

import 'controller/controller.dart';

class AuthenticationScreen extends WidgetModule {
  @override
  List<Bind> get binds => [Bind((i) => AuthController())];

  @override
  Widget get view => _AuthenticationScreen();
}

class _AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState
    extends ModularState<_AuthenticationScreen, AuthController> {
  final controller = Modular.get<AuthController>();
  @override
  void initState() {
    controller.getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return controller.userModel == null
          ? SignInScreen()
          : VideosCategoriesScreen();
    });
  }
}
