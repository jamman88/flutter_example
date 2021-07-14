import 'package:flutter/material.dart';
import 'package:flutter_example/test/next.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("안녕하세요 저는",style: TextStyle(color: Colors.red),),
        centerTitle: true,
      ),
      body: Row(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context) => NextPage(name: "마이클",isKorean: true,gender: "여자",age: 20,)),
              );
            },
            child: Container(
              child: Text("여기를 누르세요"),
              color: Colors.pink,
              height: 50,
            ),
          ),
          Container(
            width: 400,
            height: 400,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.yellow,
                  )
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.cyanAccent,
                    )
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.grey,
                    )
                ),
              ],
            ),
          ),
          Container(
            width: 400,
            height: 400,
            color: Colors.blue,
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.green,
          )
        ],
      ),
    );
  }
  

}
