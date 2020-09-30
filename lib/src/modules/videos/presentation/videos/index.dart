import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:videosIn/src/modules/videos/presentation/videos/controller/controller.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final controller = VideoScreenController();

  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Observer(
        builder: (_) => Column(children: [
          Expanded(
            child: PageView(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              children: [
                PageView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      child: Center(
                        child: Text(
                          "Videos 1",
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          "Videos 2",
                          style: TextStyle(color: Colors.blue, fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          "Videos 3",
                          style: TextStyle(color: Colors.green, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
                PageView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      child: Center(
                        child: Text(
                          "Videos 1",
                          style: TextStyle(color: Colors.brown, fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          "Videos 2",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          "Videos 3",
                          style:
                              TextStyle(color: Colors.blueAccent, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            color: Colors.yellow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    pageController.animateToPage(1,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.bounceInOut);
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text("Funny"),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    pageController.animateToPage(2,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.bounceInOut);
                  },
                  child: Container(
                      margin: EdgeInsets.only(left: 10), child: Text("Music")),
                ),
                GestureDetector(
                  onTap: () {
                    pageController.animateToPage(3,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.bounceInOut);
                  },
                  child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text("Football")),
                ),
                GestureDetector(
                  onTap: () {
                    pageController.animateToPage(4,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.bounceInOut);
                  },
                  child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text("Animals")),
                )
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}
