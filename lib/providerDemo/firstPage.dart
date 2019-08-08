import 'package:flutter/material.dart';
import 'package:jpush_login_demo/nameModel.dart';
import 'package:jpush_login_demo/numModel.dart';
import 'package:provider/provider.dart';
import 'secondPage.dart';

class FirstPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FirstPageState();
  }

}

class FirstPageState extends State<FirstPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("PageA"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "name=" + Provider
                  .of<NameModel>(context)
                  .theName,
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
            Text(
              "num=" + Provider
                  .of<NumModel>(context)
                  .theNum
                  .toString(),
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),

            SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                Provider.of<NameModel>(context).change("tom");
              },
              child: Text("名字修改为tom"),
            ),
            MaterialButton(
              onPressed: () {
                Provider.of<NumModel>(context).add();
              },
              child: Text("num递增"),
            ),
            MaterialButton(
              onPressed: () {
                Provider.of<NumModel>(context).reduction();
              },
              child: Text("num递减"),
            ),

            MaterialButton(onPressed: (){
              Navigator.of(context).push(new MaterialPageRoute(builder: (ctx){
                return SecondPage();
              }));
            },child: Text("跳转到PageB"),)
          ],
        ),
      ),
    );
  }

}

