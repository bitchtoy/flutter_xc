
import 'package:flutter/material.dart';
import 'package:flutter_demo/model/comment_model.dart';
import 'package:flutter_demo/widget/web_view.dart';

class CommonVoid{
  static void NAVIGATOR_VOID(BuildContext context,CommentModel model){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>
        WebView(url: model.url,
          statusBarColor: model.statusBarColor,
          title: model.title,
          hideAppBar: model.hideAppBar)
    ));
  }

}