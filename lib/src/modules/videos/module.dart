import 'package:flutter_modular/flutter_modular.dart';
import 'package:videosIn/src/modules/videos/presentation/videos/index.dart';
import 'package:videosIn/src/modules/videos/presentation/videos_categories/index.dart';
import 'package:videosIn/src/modules/videos/presentation/videos_categories/select_categories.dart';

class VideoModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(VIDEOS_SCREEN, child: (_, __) => VideoScreen()),
        ModularRouter(CATEGORIES_SCREEN,
            child: (_, __) => VideosCategoriesScreen()),
      ];

  static const VIDEOS_SCREEN = '/videos';
  static const CATEGORIES_SCREEN = '/videos_categories';
}
