import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 160,
              child: new Swiper(
                itemBuilder: (BuildContext context,int index){
                  return new Image.network(_swiperImgs[index],fit: BoxFit.fill,);
                },
                itemCount: _swiperImgs.length,
                pagination: new SwiperPagination(),
                control: new SwiperControl(),
              ),
            )
          ],
        )
      ),
    );
  }
}

  // itemCount: _swiperImgs.length,
  //               autoplay: true,
  //               itemBuilder: (BuildContext context,int index){
  //                 return Image.network(
  //                   _swiperImgs[index],
  //                   fit: BoxFit.fill,
  //                 );
  //               },