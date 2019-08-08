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