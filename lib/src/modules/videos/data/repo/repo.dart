import 'package:videosIn/src/modules/videos/data/model/videos.dart';

abstract class VideosRepo {
  Future<VideosModel> getVideos(String videosUrl, String thumbnailUrl);
  Future<VideosModel> get url;
}
