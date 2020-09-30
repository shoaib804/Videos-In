import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:videosIn/src/modules/auth/module.dart';
import 'package:videosIn/src/modules/videos/module.dart';

main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ModularApp(module: VideoIn()));
}

class VideoIn extends MainModule {
  final authModule = AuthModule();
  final videosModule = VideoModule();
  @override
  List<Bind> get binds => [
        ...authModule.binds,
        ...videosModule.binds,
      ];

  @override
  Widget get bootstrap => App();

  @override
  List<ModularRouter> get routers => [
        ...authModule.routers,
        ...videosModule.routers,
      ];
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Video In",
      onGenerateRoute: Modular.generateRoute,
      navigatorKey: Modular.navigatorKey,
      initialRoute: '/',
    );
  }
}
