import 'package:flutter/material.dart';

class SafeAreaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SafeAreaPageState();
  }
}

class SafeAreaPageState extends State<SafeAreaPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.yellow, //可以用来设置底部安全区域的背景颜色（当bottom: true时）
      appBar: AppBar(
        title: Text("SafeArea"),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.red,
        ),
        bottom: true, //true不将内容显示到底部安全区域內，false将内容显示到底部安全区域
      ),
    );
  }
}
