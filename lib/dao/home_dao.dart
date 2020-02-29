import 'dart:convert';

import 'package:flutter_demo/model/home_model.dart';
import 'package:flutter_demo/utils/api.dart';
import 'package:flutter_demo/utils/net_utils.dart';

class HomeDao{
  static Future<HomeModel> fetch() async{
    Utf8Decoder utf8decoder = Utf8Decoder();
    var result;
    await NetUtils.get(Api.BASE_API).then((onValue){
      result = onValue;
    });
    return HomeModel.fromJson(result);
  }

}