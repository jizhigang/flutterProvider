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
