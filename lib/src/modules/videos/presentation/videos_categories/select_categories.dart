import 'package:flutter/material.dart';
import 'package:videosIn/src/modules/videos/domain/entities/video_categories_model.dart';

// ignore: must_be_immutable
class SelectCategories extends StatefulWidget {
  List<VideoCategoriesModel> selectCategory;

  SelectCategories(this.selectCategory);
  @override
  _SelectCategoriesState createState() => _SelectCategoriesState();
}

class _SelectCategoriesState extends State<SelectCategories> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            widget.selectCategory[index].isSelected =
                !widget.selectCategory[index].isSelected;
            setState(() {});
          },
          child: Container(
            color: widget.selectCategory[index].isSelected
                ? Colors.green[100]
                : null,
            child: Row(
              children: <Widget>[
                Checkbox(
                    value: widget.selectCategory[index].isSelected,
                    onChanged: (s) {
                      widget.selectCategory[index].isSelected =
                          !widget.selectCategory[index].isSelected;
                      setState(() {});
                    }),
                Text(widget.selectCategory[index].categoryName)
              ],
            ),
          ),
        );
      },
      itemCount: widget.selectCategory.length,
    );
  }
}
