
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/mainpages/homescreen.dart';
import 'package:flutter_example/mainpages/mylikescreen.dart';
import 'package:flutter_example/mainpages/myscreen.dart';
import 'package:flutter_example/mainpages/showgridscreen.dart';
import 'package:http/http.dart' as http;

Future<Map<String,Object>> fetchPost() async {

  String url = "http://192.168.1.245/json.do";
  print("여기");
  Map data = {"id" : "jamnm","pw" : "pw123"};
  var body = json.encode(data);

  var response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body:body,

  );
  var responseBody = utf8.decode(response.bodyBytes);

  print(json.decode(response.body));

  Map daee = json.decode(response.body);

  return json.decode(response.body);
}


class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectedIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        label: '홈',
        icon: Icon(Icons.home_filled)
    ),
    BottomNavigationBarItem(
        label: '모아보기',
        icon: Icon(Icons.grid_view)
    ),
    BottomNavigationBarItem(
        label: '내가 라이크 누른 콘텐츠',
        icon: Icon(Icons.favorite)
    ),
    BottomNavigationBarItem(
        label: '내 페이지',
        icon: Icon(Icons.account_circle)
    ),
  ];

  List pages=[
    HomeScreen(),
    ShowGrids(),
    MyLikeScreen(),
    MyScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    


    return Scaffold(
      appBar: AppBar(
        title: Text("야옹이그램",style: TextStyle(fontFamily:'Jua',color: Colors.black,fontSize: 30),),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon : Icon(Icons.print,color: Colors.black,),
          onPressed: (){
            fetchPost();
          },

        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.6),
        selectedFontSize: 14,
        unselectedFontSize: 10,
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (int index){
          setState(() {
            _selectedIndex = index;
          });
        },

        items:bottomItems,
      ),
      body: pages[_selectedIndex],
    );
  }
}
