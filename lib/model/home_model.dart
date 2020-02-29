import 'package:flutter_demo/model/comment_model.dart';
import 'package:flutter_demo/model/config_model.dart';
import 'package:flutter_demo/model/grid_nav_model.dart';
import 'package:flutter_demo/model/sales_box_model.dart';


class HomeModel{
 final ConfigModel configModel;
 final List<CommentModel> bannerList;
 final List<CommentModel> localNavList;
 final GridNavModel gridNav;
 final List<CommentModel> subNavList;
 final SalesBoxModel salesBox;
 HomeModel({this.configModel,
   this.bannerList,
   this.localNavList,
   this.gridNav,
   this.subNavList,
   this.salesBox});
 factory HomeModel.fromJson(Map<String,dynamic> json){
   var bannerListJson = json['bannerList'] as List;
   List<CommentModel> bannerList = bannerListJson.map((i)=>CommentModel.formJson(i)).toList();
   var localNavListJson = json['localNavList'] as List;
   List<CommentModel> localNavList = localNavListJson.map((i)=>CommentModel.formJson(i)).toList();
   var subNavListJson = json['subNavList'] as List;
   List<CommentModel> subNavList = subNavListJson.map((i)=>CommentModel.formJson(i)).toList();
   return HomeModel(
     configModel: ConfigModel.formJson(json['config']),
     bannerList: bannerList,
     localNavList: localNavList,
     gridNav: GridNavModel.formJson(json['gridNav']),
     subNavList: subNavList,
     salesBox: SalesBoxModel.fromJson(json['salesBox'])
   );
 }

}