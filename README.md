# jpush_login_demo

A new Flutter application.

之前学习RN的时候就接触过redux，但是由于后来没有用于项目开发就搁置了，现在使用flutter开发项目之后没有一个全局状态管理器是很别扭的， 2019 Google IO大会上已经宣布弃用provide，现在官方推荐的是一个和这个很相似的库 Provider

### 一、创建两个model

数量变化的model
```
import 'package:flutter/cupertino.dart';

class NumModel with ChangeNotifier{
  int _theNum;
  NumModel(this._theNum);
  /*_theNum递增*/
  void add() {
    _theNum++;
    notifyListeners();//通知所有监听的页面，如果写在runapp中那么通知所有页面重新加载
  }
  /*_theNum递减*/
  void reduction(){
    _theNum--;
    notifyListeners();
  }
  /*获取_theNum*/
  int get theNum => _theNum;
}
```
修改名字的model
```
import 'package:flutter/cupertino.dart';

class NameModel with ChangeNotifier {
  String _theName;
  NameModel(this._theName);
  /*修改名字*/
  void change(String a){
    this._theName=a;
    notifyListeners();//通知所有监听的页面，如果写在runapp中那么通知所有页面重新加载
  }
  String get theName => _theName;
}
```

### 二、项目中集成Provider

如果只监听一个model
```
main() {
  runApp(ChangeNotifierProvider<NumModel>.value(
    value: NumModel(1), 
    child: MyApp(),
  ));
}
```

如果监听多个model
```
main() {
  runApp(
      MultiProvider(providers: [
      ChangeNotifierProvider<NumModel>.value(value: NumModel(1)),
      ChangeNotifierProvider<NameModel>.value(value: NameModel("json"))
  ],
      child: MyApp()
  ));
}
```

我们的项目中很多情况下监听一个model是不够的，所以我们默认使用MultiProvider


### 三、使用Provider
我们新建两个页面pageA和pageB，分别为
```
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PageA"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "name=" + Provider.of<NameModel>(context).theName,
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
            Text(
              "num=" + Provider.of<NumModel>(context).theNum.toString(),
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
            MaterialButton(
              onPressed: () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return PageB();
                }));
              },
              child: Text("跳转到PageB"),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
```

```
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
```

![Provider.gif](https://upload-images.jianshu.io/upload_images/3305752-d8b539f84ceb9b56.gif?imageMogr2/auto-orient/strip)

