import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/home_page.dart';
import 'package:flutter_demo/pages/my_page.dart';
import 'package:flutter_demo/pages/search_page.dart';
import 'package:flutter_demo/pages/trave_page.dart';

class Navergators extends StatefulWidget{
  @override
  _Navergators createState()  => _Navergators();
}
class _Navergators extends State<Navergators>{
  final _defaulColor = Colors.grey;
  final _activityColor = Colors.blue;
  int _currentIndex = 0;
  final PageController _controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          Home(),
          Search(),
          Trave(),
          My()
        ],
      ),
      bottomNavigationBar:  BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index){
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
       BottomNavigationBarItem(
         icon: Icon(Icons.home,color: _defaulColor),
         activeIcon: Icon(Icons.home,color: _activityColor),
         title: Text('首页',style: TextStyle(color: _currentIndex != 0 ? _defaulColor : _activityColor))
       ),
        BottomNavigationBarItem(
            icon: Icon(Icons.search,color: _defaulColor),
            activeIcon: Icon(Icons.search,color: _activityColor),
            title: Text('搜索',style: TextStyle(color: _currentIndex != 1 ? _defaulColor : _activityColor))
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt,color: _defaulColor),
            activeIcon: Icon(Icons.camera_alt,color: _activityColor),
            title: Text('旅拍',style: TextStyle(color: _currentIndex != 2 ? _defaulColor : _activityColor))
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.my_location,color: _defaulColor),
            activeIcon: Icon(Icons.my_location,color: _activityColor),
            title: Text('我的',style: TextStyle(color: _currentIndex != 3 ? _defaulColor : _activityColor))
        )

      ]),
    );
  }
}