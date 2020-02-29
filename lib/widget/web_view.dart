
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
const CATCH_URL = ['m.ctrip.com/','m.ctrip.com/html5/','m.ctrip.com/html5'];
class WebView extends StatefulWidget{
  final String url;
  final String statusBarColor;
  final String title;
  final bool hideAppBar;
  final bool backForBid;
  const WebView({Key key, this.url, this.statusBarColor, this.title, this.hideAppBar,this.backForBid = false}) : super(key: key);
  @override
  _WebViewState createState() =>_WebViewState();
}

class _WebViewState extends State<WebView>{
  final flutterWebViewPlug = FlutterWebviewPlugin();
  StreamSubscription<String> _subscription;
  StreamSubscription<WebViewStateChanged> _webViewState;
  StreamSubscription<WebViewHttpError> _webViewError;
  bool exiting = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    flutterWebViewPlug.close();
    _subscription = flutterWebViewPlug.onUrlChanged.listen((onData){

    });
    _webViewState = flutterWebViewPlug.onStateChanged.listen((state){
      switch(state.type){
        case WebViewState.startLoad:
          if(_isToMain(state.url) && !exiting){
             if(widget.backForBid){
               flutterWebViewPlug.launch(widget.url);
             }else{
               Navigator.pop(context);
               exiting = true;
             }
          }
          break;
        default:
          break;
      }
    });
    _webViewError = flutterWebViewPlug.onHttpError.listen((error){
      print(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    String statusBarColorStr = widget.statusBarColor ?? 'ffffff';
    Color backButtonColor;
    if(statusBarColorStr == 'ffffff'){
      backButtonColor = Colors.black;
    }else{
      backButtonColor == Colors.white;
    }
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          _appBar(Color(int.parse('0xff'+statusBarColorStr)), backButtonColor),
          Expanded(child: WebviewScaffold(url: widget.url,
            withZoom: true,
            withLocalStorage: true,
            hidden: true,
//            initialChild: Container(
//              color: Colors.white,
//              child: Center(
//                child: Text('waitting'),
//              ),
//            ),
          ))
        ],
      ),
    );
  }
  _appBar(Color statusBarColor, Color backButtonColor){
      if(widget.hideAppBar ?? false)
        return Container(height: 30,color: statusBarColor);

        return Container(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
          color: statusBarColor,
          child: FractionallySizedBox(
            widthFactor: 1,
            child: Stack(
              children: <Widget>[
                GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Icon(Icons.close,
                          size: 26,
                          color: backButtonColor),
                    )
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(widget.title??'',
                          style: TextStyle(
                              color: statusBarColor,
                              fontSize: 20
                          )
                      ),
                    ))
              ],
            ),
          ),

        );


  }
  _isToMain(String url){
    bool contain = false;
    for(final value in CATCH_URL){
      if(url?.endsWith(value) ?? false){
        contain = true;
        break;
      }
    }
    return contain;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _subscription.cancel();
    _webViewState.cancel();
    _webViewError.cancel();
    flutterWebViewPlug.dispose();
    super.dispose();
  }
}