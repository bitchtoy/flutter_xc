
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';

var dio = Dio(BaseOptions(connectTimeout: 3000));

class NetUtils{
  static Future get(String baseUrl,[Map<String,dynamic> params]) async {
    Response response;
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String directory = documentDirectory.path;
    Directory file =  Directory('$directory/cookies');
    await file.create();
    dio.interceptors.add(CookieManager(PersistCookieJar(dir: file.path)));
    if(params != null){
      response = await dio.get(baseUrl,queryParameters: params);
    }else{
      response = await dio.get(baseUrl);
    }
    return response.data;
  }
  static Future post(String baseUrl,Map<String,dynamic> params) async {
    Response response;
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String directory = documentDirectory.path;
    Directory file =  Directory('$directory/cookies');
    await file.create();
    dio.interceptors.add(CookieManager(PersistCookieJar(dir: file.path)));
    response = await dio.post(baseUrl,queryParameters: params);
    return response.data;
  }
}