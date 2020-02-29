
import 'package:flutter_demo/model/comment_model.dart';

class SalesBoxModel{
  final String icon;
  final String moreUrl;
  final CommentModel bigCard1;
  final CommentModel bigCard2;
  final CommentModel smallCard1;
  final CommentModel smallCard2;
  final CommentModel smallCard3;
  final CommentModel smallCard4;
  SalesBoxModel({this.icon,
    this.moreUrl,this.bigCard1,
    this.bigCard2,this.smallCard1,
    this.smallCard2,this.smallCard3,this.smallCard4
  });
  factory SalesBoxModel.fromJson(Map<String,dynamic> json){
    return SalesBoxModel(
      icon: json['icon'],
      moreUrl: json['moreUrl'],
      bigCard1: CommentModel.formJson(json['bigCard1']),
      bigCard2: CommentModel.formJson(json['bigCard2']),
      smallCard1: CommentModel.formJson(json['smallCard1']),
      smallCard2: CommentModel.formJson(json['smallCard2']),
      smallCard3: CommentModel.formJson(json['smallCard3']),
      smallCard4: CommentModel.formJson(json['smallCard4']),
    );
  }

}