
import 'package:flutter/material.dart';
import 'package:flutter_demo/model/comment_model.dart';
import 'package:flutter_demo/model/sales_box_model.dart';

class SaleBox extends StatelessWidget{
  final SalesBoxModel salesBoxModel;

  const SaleBox({Key key, this.salesBoxModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: _items(context),
      ),
    );
  }
  _items(BuildContext context){
    List<Widget> view = [];
    if(salesBoxModel == null) return view;
    view.add(_doubleCard(context, salesBoxModel.bigCard1, salesBoxModel.bigCard2,true));
    view.add(_doubleCard(context, salesBoxModel.smallCard1, salesBoxModel.smallCard2,false));
    view.add(_doubleCard(context, salesBoxModel.smallCard3, salesBoxModel.smallCard4,false));
    return view;

  }

  Widget _doubleCard(BuildContext context,CommentModel leftMode,CommentModel rightMode,bool isBig){
    return Row(
      mainAxisAlignment:  MainAxisAlignment.spaceAround,
      children: <Widget>[
        _item(context,leftMode,isBig),
        _item(context, rightMode,isBig)
    ],);
  }
  Widget _item(BuildContext context,CommentModel model,bool isBig){
    return Expanded(flex: 1,child: Image.network(model.icon),);
  }
}