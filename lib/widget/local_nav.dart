
import 'package:flutter/material.dart';
import 'package:flutter_demo/common/common_void.dart';
import 'package:flutter_demo/model/comment_model.dart';
import 'package:flutter_demo/widget/web_view.dart';

class LocalNav extends StatelessWidget{
  final List<CommentModel> model;

  const LocalNav({Key key, @required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 64,
      decoration: BoxDecoration(color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Padding(padding: const EdgeInsets.all(7),
        child: items(context),
      ),
    );
  }
   items(BuildContext context){
     if(model == null) return null;
     List<Widget> lists = [];
     model.forEach((f){
       lists.add(item(context, f));
     });
     return Row(mainAxisAlignment:MainAxisAlignment.spaceAround,children: lists);
    }
    Widget item(BuildContext context,CommentModel model){
       return GestureDetector(
         onTap: (){
           CommonVoid.NAVIGATOR_VOID(context, model);
         },
         child:  Column(
           children: <Widget>[
             Image.network(model.icon,width: 32,height: 32),
             Text(model.title,style: TextStyle(color: Colors.black,fontSize: 12),)
           ],
         ),
       );
    }
}