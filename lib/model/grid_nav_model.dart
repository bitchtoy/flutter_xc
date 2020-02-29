import 'package:flutter_demo/model/comment_model.dart';


class GridNavModel{
   final GridNavItem hotel;
   final GridNavItem flight;
   final GridNavItem travel;

  GridNavModel({this.hotel, this.flight, this.travel});
  factory GridNavModel.formJson(Map<String,dynamic> json){
    return json != null ?
    GridNavModel(hotel: GridNavItem.formJson(json['hotel']),
      flight: GridNavItem.formJson(json['flight']),
      travel: GridNavItem.formJson(json['travel'])
    ):null;
  }
   
   
}
class GridNavItem{
  final String startColor;
  final String endColor;
  final CommentModel mainItem;
  final CommentModel item1;
  final CommentModel item2;
  final CommentModel item3;
  final CommentModel item4;

  GridNavItem({this.startColor,
    this.endColor,
    this.mainItem,
    this.item1,
    this.item2,
    this.item3,
    this.item4});
  factory GridNavItem.formJson(Map<String,dynamic> json){
    return GridNavItem(
      startColor: json['startColor'],
      endColor: json['endColor'],
      mainItem: CommentModel.formJson(json['mainItem']),
      item1: CommentModel.formJson(json['item1']),
      item2: CommentModel.formJson(json['item2']),
      item3: CommentModel.formJson(json['item3']),
      item4: CommentModel.formJson(json['item4']),
    );
  }

}