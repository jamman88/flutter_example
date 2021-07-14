

import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {

  String name;
  int age;
  String gender;
  bool isKorean;

  NextPage({required this.name,required this.age,required this.gender,required this.isKorean});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("두번째 페이지입니다."),),
      body: Column(
        children: [
          Container(child: Text(name),),
          Container(child: Text(age.toString()),),
          Container(child: Text(gender),),
          Container(child: Text(isKorean.toString()),)
        ],
      ),

    );
  }
}
