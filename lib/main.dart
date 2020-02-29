import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/dao/home_dao.dart';

import 'package:flutter_demo/utils/api.dart';
import 'package:flutter_demo/utils/net_utils.dart';
import 'package:transparent_image/transparent_image.dart';

import 'navergator/tabbar_navergater.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Navergators(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

    String resultString = '';
//  List widgets = [];
//  HomeModel _homeModel;
  AnimationController ac;
  Animation<double> animation;
  AnimationStatus status;
  double animationSize;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadingDate();
    ac = AnimationController(vsync: this,duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 0,end: 300).animate(ac)..addListener((){
    setState(() {
      animationSize =  animation.value;
    });
  });
  }

  loadingDate()  {
     HomeDao.fetch().then((onValue){
       setState(() {
         resultString = json.encode(onValue);
       });
     });
  }
//  showLoadingDialog(){
//    return widgets.length == 0;
//  }
//  getBody(){
//    if(showLoadingDialog()){
//      return loadingDialog();
//    }else{
//      return getListView();
//    }
//  }
  loadingDialog(){
    return Center(child: CircularProgressIndicator());
  }
//  ListView getListView() => ListView.builder(
//      itemCount: widgets.length,
//      itemBuilder: (BuildContext context,int position){
//       return getRow(position);
//  });
//  getRow(int position){
//    return Padding(padding: EdgeInsets.all(10),child: Text(widgets[position]['title']));
//  }
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(

      ),
      body: FlutterLogo(),
//     body: Stack(children: <Widget>[
//       Center(child: CircularProgressIndicator(),),
//       Center(child: FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: Api.TRANSPARENT),)
//     ],)
    // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
