import 'package:flutter/material.dart';
import 'package:flutter_demo/common/common_void.dart';
import 'package:flutter_demo/model/comment_model.dart';

class SubNav extends StatelessWidget{
  final List<CommentModel> subList;

  const SubNav({Key key, this.subList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6)
      ),
      child: Padding(padding: EdgeInsets.all(7),child: _items(context),),
    );
  }
  _items(BuildContext context){
    if(subList == null) return null;
    List<Widget> widget = [];
    subList.forEach((f){
      widget.add(_buildItem(context, f));
    });
    int separate = (subList.length/2+0.5).toInt();
    return Column(children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: widget.sublist(0,separate)),
      Padding(padding: EdgeInsets.only(top: 10),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: widget.sublist(separate,subList.length)),
      )
    ],);
  }
  Widget _buildItem(BuildContext context,CommentModel commentModel){
    return Expanded(
        flex: 1,
        child: GestureDetector(
          onTap: (){
            CommonVoid.NAVIGATOR_VOID(context, commentModel);
            },
          child: Column(children: <Widget>[
            Image.network(commentModel.icon,width: 18,height: 18),
            Text(commentModel.title,style: TextStyle(fontSize: 12),),
        ],
      ),
    ));
  }
}