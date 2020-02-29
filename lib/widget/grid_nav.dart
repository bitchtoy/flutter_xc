
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/common/common_void.dart';
import 'package:flutter_demo/model/comment_model.dart';
import 'package:flutter_demo/model/grid_nav_model.dart';
import 'package:flutter_demo/widget/web_view.dart';

class GridNav extends StatelessWidget{
  final GridNavModel gridNavModel;

  const GridNav({Key key, this.gridNavModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PhysicalModel(clipBehavior: Clip.antiAlias,borderRadius: BorderRadius.circular(6),
     color: Colors.transparent,child: Column(children: _gridNavItems(context)));
  }
  _gridNavItems(BuildContext context){
    List<Widget> items = [];
    if(gridNavModel == null) return items;
    if(gridNavModel.hotel != null){
      items.add(_gridNavItem(context,gridNavModel.hotel,true));
    }
    if(gridNavModel.flight != null){
      items.add(_gridNavItem(context,gridNavModel.flight,false));
    }
    if(gridNavModel.travel != null){
      items.add(_gridNavItem(context,gridNavModel.travel,false));
    }
    return items;
  }
  _gridNavItem(BuildContext context,GridNavItem item,bool first){
     List<Widget> items = [];
     items.add(_mainItem(context, item.mainItem));
     items.add(_doubleItem(context, item.item1,item.item2));
     items.add(_doubleItem(context, item.item3,item.item4));
     List<Widget> expandItems = [];
     items.forEach((f){
       expandItems.add(Expanded(child: f,flex: 1));
     });
     Color startColor = Color(int.parse('0xff'+item.startColor));
     Color endColor = Color(int.parse('0xff'+item.endColor));
     return Container(
       height: 88,
       margin: first?null:EdgeInsets.only(top: 3),
       decoration: BoxDecoration(
         gradient: LinearGradient(colors: [startColor,endColor]),
       ),
       child: Row(children: expandItems),
     );
  }
  _mainItem(BuildContext context,CommentModel model){
    return GestureDetector(
      onTap: (){
        _gestureRoute(context, model);
      },
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Image.network(model.icon,fit: BoxFit.contain,height: 88,width: 121,alignment: AlignmentDirectional.bottomEnd),
          Container(child: Text(model.title,style: TextStyle(fontSize: 14,color: Colors.white)),
            padding: EdgeInsets.only(top: 15),)
        ],
      ),
    );
  }
  _doubleItem(BuildContext context,CommentModel topItem,CommentModel bottomItem){
     return Column(
       children: <Widget>[
         Expanded(child: _item(context, topItem, true)),
         Expanded(child: _item(context, bottomItem, false))
       ],
     );
  }
  _item(BuildContext context,CommentModel model,bool isFirst){
    BorderSide borderSide = BorderSide(width: 0.8,color: Colors.white);
    return FractionallySizedBox(
      widthFactor: 1,
      child: _wrapGesture(context, Container(
        decoration: BoxDecoration(
          border: Border(
              left: borderSide,
              bottom: isFirst ? borderSide : BorderSide.none
          ),
        ),
        child: Center(
          child: Text(model.title,style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
        ),
      ), model),
    );
  }
  _wrapGesture(BuildContext context,Widget widget,CommentModel model){
    return GestureDetector(
      onTap: (){
        _gestureRoute(context, model);
      },
      child: widget,
    );
  }
  //跳转
  _gestureRoute(BuildContext context,CommentModel model){
    CommonVoid.NAVIGATOR_VOID(context, model);
  }
}