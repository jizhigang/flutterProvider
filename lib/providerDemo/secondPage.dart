import 'package:flutter/material.dart';
import 'package:jpush_login_demo/nameModel.dart';
import 'package:provider/provider.dart';
import 'package:jpush_login_demo/numModel.dart';


class SecondPage extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("PageB"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Text("name="+Provider.of<NameModel>(context).theName,style: TextStyle(fontSize: 20,color: Colors.red),),
              Text("num="+Provider.of<NumModel>(context).theNum.toString(),style: TextStyle(fontSize: 20,color: Colors.blue),),
              SizedBox(height: 20,),
              MaterialButton(onPressed: (){
                Provider.of<NameModel>(context).change("JSON");
              },child: Text("名字修改为JSON"),),
              MaterialButton(onPressed: (){
                Provider.of<NumModel>(context).add();
              },child: Text("num递增"),),
              MaterialButton(onPressed: (){
                Provider.of<NumModel>(context).reduction();
              },child: Text("num递减"),),
            ],
          )
        ),
      ),
    );
  }

}


