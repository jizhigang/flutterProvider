import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:city_picker/city_picker.dart';
import 'package:jpush_login_demo/providerDemo/firstPage.dart';
import 'package:jpush_login_demo/safeAreaPage.dart';
import 'package:provider/provider.dart';
import 'addressSelePickerPage.dart';
import 'customCityPickerPage.dart';
import 'nameModel.dart';
import 'numModel.dart';

main() {
  runApp(
      MultiProvider(providers: [
      ChangeNotifierProvider<NumModel>.value(value: NumModel(1)),
      ChangeNotifierProvider<NameModel>.value(value:NameModel("json"))
  ],
  child:MyApp(),),);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String str = "选择城市";
  CityResult _cityResult = CityResult();

  @override
  void initState() {
    // TODO: implement initState
    _cityResult.province = "北京市";
    _cityResult.city = "市辖区";
    _cityResult.county = "海淀区";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PageA"),
      ),
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            MaterialButton(
              onPressed: () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return FirstPage();
                }));
              },
              child: Text("跳转状态管理页面"),
            ),

            MaterialButton(onPressed: () {
              Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) {
                return AddressSelePickerPage();
              }));
            }, child: Text("CityPickers页面"),),


            MaterialButton(onPressed: (){
              Navigator.of(context).push(new MaterialPageRoute(builder: (ctx){
                return CustomCityPickerPage();
              }));
            },child: Text("自定义地址选择器页面"),),


            MaterialButton(onPressed: (){
              Navigator.of(context).push(new MaterialPageRoute(builder: (ctx){
                return SafeAreaPage();
              }));
            },child: Text("safeArea"),)
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
