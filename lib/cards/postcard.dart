import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/model/member.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';
import 'package:http/http.dart' as http;


class PostCard extends StatefulWidget {

  List<Member> mlist;
  int num;
  PostCard({required this.num,required this.mlist});

  @override
  _PostCardState createState() => _PostCardState(num1: num);
}

class _PostCardState extends State<PostCard> {
  int num1;
  _PostCardState({required this.num1});

  int pageLength=0;

  int currentPageIndex=0;

  List<Image> catList = [
    Image.asset("assets/image/catList/cat1.jpg",fit: BoxFit.cover,),
    Image.asset("assets/image/catList/cat2.jpg",fit: BoxFit.cover,),
    Image.asset("assets/image/catList/cat3.jpg",fit: BoxFit.cover,),
    Image.asset("assets/image/catList/cat4.jpg",fit: BoxFit.cover,),
    Image.asset("assets/image/catList/cat5.jpg",fit: BoxFit.cover,),
  ];

  List<String> userId = [
    "scv1","scv2","scv3","scv4","scv5","scv6","scv7","scv8","scv9","scv10",
    "scv11","scv12","scv13","scv14","scv15","scv16","scv17","scv18","scv19","scv20",
    "scv21","scv22","scv23","scv24","scv25","scv26","scv27","scv28","scv29","scv30",
  ];

  PageController _controller = PageController();



  @override
  void initState() {
    pageLength = 3+Random().nextInt(5);
    super.initState();

  }


  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,    //이걸하면 그다음에 오는건 맨 오른쪽으로 간다
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage("assets/image/profile/profile.jpg")
                    ),
                    SizedBox(width: 5,),
                    Text(userId[num1],style: TextStyle(fontSize: 20),),
                  ],
                ),
                Icon(Icons.subject),
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 1.5,
            child:Stack(
              alignment: Alignment.topRight,
              children: [
                PageView.builder(
                  itemBuilder: (BuildContext context,int index){
                    return Container(
                      child: catList[Random().nextInt(5)] ,
                    );
                  },
                  itemCount: pageLength,
                  controller: _controller,
                  onPageChanged: (value){
                    setState(() {
                      currentPageIndex=value;
                      print(value);
                    });
                  },
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(500),
                  ),

                  child: Text('${currentPageIndex+1} / ${pageLength}',style: TextStyle(color: Colors.white,),),
                ),
              ],
            )

          ),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            child:Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.favorite_border),
                        SizedBox(width: 7,),
                        Icon(Icons.chat_outlined),
                        SizedBox(width: 7,),
                        Icon(Icons.send),
                      ],
                    ),
                    Icon(Icons.bookmark_border),
                  ],
                ),
                ScrollingPageIndicator(
                  dotColor: Colors.grey,
                  dotSelectedColor: Colors.deepPurple,
                  dotSize: 6,
                  dotSelectedSize: 8,
                  dotSpacing: 12,
                  controller: _controller,
                  itemCount: pageLength,
                  orientation: Axis.horizontal,
                ),
              ],
            )
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 30,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Text("좋아요"+num1.toString()+"개",style: TextStyle(fontSize: 20),),
              ],
            )
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(userId[num1],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    SizedBox(width: 7,),
                    Text("제목을 적어주세요",style: TextStyle(fontSize: 20,color: Colors.black54),)
                  ],
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text("내용을 입력해 주세요 재미 없는이 야기가 펼쳐집니다 안녕 하세요 이쁜 고양이가 너무 많아요 고양이 사지 마시고 꼭 전화주세요"),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text("댓글 9개 모두 보기",style: TextStyle(fontSize: 20,color: Colors.grey),),
                ),
                Row(
                  children: [
                    Text(userId[num1],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    SizedBox(width: 7,),
                    Text("사용해보니 너무 좋군요",style: TextStyle(color: Colors.black54,fontSize: 18),)
                  ],
                ),
                Row(
                  children: [
                    Text(userId[num1],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    SizedBox(width: 7,),
                    Text("사용해보니 너무 좋군요",style: TextStyle(color: Colors.black54,fontSize: 18),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage("assets/image/profile/profile.jpg"),
                        ),
                        SizedBox(width: 7,),
                        Text("댓글달기...",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.favorite,color: Colors.red,size: 18,),
                        SizedBox(width: 7,),
                        Icon(Icons.thumb_up_alt_outlined,size: 18,),
                        SizedBox(width: 7,),
                        Icon(Icons.add_circle_outline,size: 18,),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
