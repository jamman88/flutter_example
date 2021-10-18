
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_example/cards/postcard.dart';
import 'package:flutter_example/model/member.dart';
import 'package:http/http.dart' as http;

Future<List<Member>> fetchPost() async {

  String url = "http://192.168.1.245/ad.list";
  final response = await http.post(
    Uri.parse(url),
  );

  Map data = json.decode(response.body);

  print(">>>"+response.statusCode.toString());
  List list = data["result"];
  print("리스트>>>"+list.toString());
  var memberList  = list.map((element) => Member.fromJson(element)).toList();
  print("처음아이asas디11>>>"+memberList[1].adId);

  return memberList;
}

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Future<List<Member>> memberList;

  @override
  void initState() {
    super.initState();
    memberList = fetchPost();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: memberList,
        builder: (context,snapshot){
          if(snapshot.hasData){
            List<Member>? mList = snapshot.data as List<Member>?;
            return ListView.separated(
              itemCount: mList!.length,
              itemBuilder: (BuildContext context,int index){
                return PostCard(
                  num: index,
                 mlist: mList,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 20,);
              },
            );
          }else if(snapshot.hasError){
            return Text('${snapshot.error}');
          }
          return CircularProgressIndicator();
        },
      ),

    );
  }
}
