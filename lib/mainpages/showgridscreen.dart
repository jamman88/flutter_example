
import 'dart:convert';

import 'package:flutter/material.dart';
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
  print("처음아이디>>>"+memberList[1].adId);

  return memberList;
}



class ShowGrids extends StatefulWidget {

  @override
  _ShowGridsState createState() => _ShowGridsState();
}

class _ShowGridsState extends State<ShowGrids> {

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
            List<Member>? mlist = snapshot.data as List<Member>?;
            print(mlist!.length);

          }

          print(snapshot.data);
          return Text("dd");
        },
      ),
    );
  }
}
