import 'package:flutter_modular/flutter_modular.dart';
import 'package:videosIn/src/modules/auth/presentation/auth/controller/controller.dart';
import 'package:videosIn/src/modules/auth/presentation/auth/index.dart';
import 'package:videosIn/src/modules/auth/presentation/sign_in/index.dart';
import 'package:videosIn/src/modules/auth/presentation/sign_up/index.dart';
import 'package:videosIn/src/modules/videos/module.dart';

class AuthModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => AuthController())];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => AuthenticationScreen()),
        ModularRouter(SIGNIN_SCREEN, child: (_, args) => SignInScreen()),
        ModularRouter(SIGNUP_SCREEN, child: (_, args) => SignUpScreen()),
        ModularRouter(VIDEOS, module: VideoModule()),
      ];

  static const SIGNIN_SCREEN = '/signin';
  static const SIGNUP_SCREEN = '/signup';
  static const VIDEOS = '/videos';
}
