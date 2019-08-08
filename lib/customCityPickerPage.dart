import 'package:flutter/material.dart';

class CustomCityPickerPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CustomCityPickerPageState();
  }

}

class CustomCityPickerPageState extends State<CustomCityPickerPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义地址选择器"),
      ),
      body: Container(
        color: Colors.black12,
      ),
    );
  }

}