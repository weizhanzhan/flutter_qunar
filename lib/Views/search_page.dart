import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
 
  ScrollController _scrollController = ScrollController();

  @override
  void initState() { 
    _scrollController.addListener((){
   
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
   
        _loadData();
      }
    });
    super.initState();
    
  }

  @override
  void dispose() { 
    _scrollController.dispose();
    super.dispose();
  }

  List<String> _cities = [
    "北京市","天津市","石家庄市","唐山市","秦皇岛市","邯郸市","邢台市","保定市","张家口市","承德市","衡水市","廊坊市","沧州市","太原市","大同市","阳泉市","长治市","晋城市","朔州市","晋中市","运城市","忻州市",
  ];
  _buildList(){
    return _cities.map((city){
      return Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey[200],width: 1.0)) //设置单边边框
        ),
        child: Center(
          child: Text(city),
        ),
      );
    }).toList();
  }

  _loadData() async {
    await Future.delayed(Duration(seconds:2));
    setState(() {
      List<String> list = List<String>.from(_cities);
      list.addAll(_cities);
     _cities = list;
    });
  }
  Future<Null> _onRefresh() async {//下拉刷新必须是future类型的函数
    await Future.delayed(Duration(seconds:2));
    setState(() {
     _cities=_cities.reversed.toList(); 
    });
    return null;
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView( 
          controller: _scrollController,
          children: _buildList(),
        ),
      )
    );
  }
}