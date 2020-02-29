import 'package:flutter/material.dart';
import 'package:flutter_demo/dao/home_dao.dart';
import 'package:flutter_demo/model/home_model.dart';
import 'package:flutter_demo/widget/grid_nav.dart';
import 'package:flutter_demo/widget/local_nav.dart';
import 'package:flutter_demo/widget/sale_box.dart';
import 'package:flutter_demo/widget/sub_nav.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
final SCROLL_UP = 10;
class Home extends StatefulWidget{
  @override
  _Home createState()  => _Home();
}
class _Home extends State<Home>{

  HomeModel homeModel;
  double opacity = 0;
  _scroll(offSet){
    double value = offSet/SCROLL_UP;
    print(value);
    if(value < 0){
      value = 0;
    }else if(value>1){
      value = 1;
    }
    setState(() {
      opacity = value;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState');
    loadingDate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('dispose');
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: NotificationListener(
                  onNotification: (value){
                    if(value is ScrollUpdateNotification && value.depth == 0){
                      _scroll(value.metrics.pixels);
                    }
                  },
                  child: ListView(
                    children: <Widget>[
                      Container(
                        height: 180,
                        child: Swiper(
                            itemCount: homeModel != null ? homeModel.bannerList.length : 0,
                            autoplay: true,
                            pagination: SwiperPagination(),
                            itemBuilder: (BuildContext context,int position){
                              return Image.network(homeModel.bannerList[position].icon,fit: BoxFit.fill);
                            }),
                      ),

                      Padding(padding: EdgeInsets.fromLTRB(5, 5, 5,5),
                        child: LocalNav(model: homeModel != null ? homeModel.localNavList : null)
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(5, 5, 5, 5),child: GridNav(gridNavModel: homeModel != null ? homeModel.gridNav : null,)),
                      Padding(padding: EdgeInsets.fromLTRB(5, 5, 5, 5),child: SubNav(subList: homeModel != null ? homeModel.subNavList : null)),
                      SaleBox(salesBoxModel:  homeModel != null ? homeModel.salesBox : null)
                    ],
                  ))
          ),
          Opacity(
            opacity: opacity,
            child: Container(
              height: 80,
              color: Colors.white,
              child: Center(child: Text('首页'))
            ),
          )
        ],
      )
    );
  }

  //网络请求
loadingDate() async{
    await HomeDao.fetch().then((onValue){
      setState(() {
        homeModel = onValue;
        print(homeModel.configModel.searchUrl);
      });
    });
}
}