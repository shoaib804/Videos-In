import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:videosIn/src/modules/videos/domain/entities/video_categories_model.dart';
import 'package:videosIn/src/modules/videos/module.dart';
import 'package:videosIn/src/modules/videos/presentation/videos_categories/controller/controller.dart';
import 'package:videosIn/src/modules/videos/presentation/videos_categories/select_categories.dart';

// ignore: must_be_immutable
class VideosCategoriesScreen extends StatelessWidget {
  List<VideoCategoriesModel> categoryName = [
    VideoCategoriesModel('Funny'),
    VideoCategoriesModel('Music'),
    VideoCategoriesModel('Animals'),
    VideoCategoriesModel('Football'),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = VideosCategoriesController();
    return Scaffold(
      body: Observer(
        builder: (_) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(onPressed: () {
                controller.openDialog();
                if (controller.isClicked) {
                  showDialog(
                      context: context,
                      builder: (ctx) {
                        return AlertDialog(
                          title: Text('List'),
                          actions: <Widget>[
                            FlatButton(
                                onPressed: () {
                                  Modular.to
                                      .pushNamed(VideoModule.VIDEOS_SCREEN);
                                },
                                child: Text("Ok")),
                            FlatButton(
                                onPressed: () {
                                  Modular.to.pop();
                                },
                                child: Text(" Cancel")),
                          ],
                          content: Container(
                            width: 300,
                            height: 400,
                            child: SelectCategories(categoryName),
                          ),
                        );
                      });
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
