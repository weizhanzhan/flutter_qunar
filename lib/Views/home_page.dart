import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const APPBAR_SCROLL_OFFSET = 100;//滚动大于100时 appbar完全变白色
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _swiperImgs = [
    'http://mp-piao-admincp.qunarzz.com/mp_piao_admin_mp_piao_admin/admin/20196/ebf7306335a5e060dbbfe42b8e8ede9f.jpg_945x288_da043916.jpg',
    'http://mp-piao-admincp.qunarzz.com/mp_piao_admin_mp_piao_admin/admin/20197/a685001bbf5e77a203ff8815e953efbe.jpg_945x288_52b6ec01.jpg',
    'http://mp-piao-admincp.qunarzz.com/mp_piao_admin_mp_piao_admin/admin/20197/3f5ff03fa0c024b930f515e63ae2c702.jpg_945x288_7dff4510.jpg',
  ];

  double _appbarAlpha = 0;
  void _onScroll(offset){
    double alpha = offset/APPBAR_SCROLL_OFFSET;
    if(alpha<0){
      alpha =0;
    }else if(alpha>1){
       alpha=1;
    }
    setState(() {
      _appbarAlpha=alpha;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(//移除顶部的padding LiveView
            context: context,
            removeTop: true,
            child: NotificationListener(
              onNotification: (scrollNotification){
                if(scrollNotification is ScrollUpdateNotification && scrollNotification.depth==0){//滚动且是列表滚动 && 当child的第0个元素滚动时监听 主要是为了swiper滚动时不监听
                  _onScroll(scrollNotification.metrics.pixels);
                }
              },
              child:  ListView(
                children: <Widget>[
                  Container(
                    height: 160,
                    child: new Swiper(
                      itemBuilder: (BuildContext context,int index){
                        return new Image.network(_swiperImgs[index],fit: BoxFit.fill,);
                      },
                      autoplay: true,
                      itemCount: _swiperImgs.length,
                      pagination: new SwiperPagination(),
                      control: new SwiperControl(),
                    ),
                  ),
                  Container(
                    height: 800,
                    child: ListTile(
                      title: Text('Hello'),
                    ),
                  )
                ],
              ),
            )
        
          ),
          Opacity(
            opacity: _appbarAlpha,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text('首页'),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
