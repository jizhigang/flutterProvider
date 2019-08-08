import 'package:city_picker/city_picker.dart';
import 'package:city_pickers/city_pickers.dart';
import 'package:flutter/material.dart';

class AddressSelePickerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddressSelePickerPageState();
  }
}

class AddressSelePickerPageState extends State<AddressSelePickerPage> {
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
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("地址选择器"),
      ),
      body: Container(
        margin: const EdgeInsets.only(bottom: 300),
        color: Colors.black12,
        child: Center(
          child: MaterialButton(
            onPressed: () {
              //很好，但是没有办法传入默认地址
              CityPickers.showCityPicker(
                context: context,
                barrierOpacity: 0.5, //背景遮罩的透明度
                height: 300,
              ).then((result) {
                String provinceName = result.provinceName ?? ""; //省份名称
                String provinceId = result.provinceId ?? ""; //省份id
                String cityName = result.cityName ?? ""; //市名称
                String cityId = result.cityId ?? ""; //市id
                String areaName = result.areaName ?? ""; //县名称
                String areaId = result.areaId ?? ""; //县id
                setState(() {
                  str = provinceName + " " + cityName + " " + areaName;
                });
              });
            },
            child: Text(str),
          ),
        ),
      ),
    );
  }
}
