import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '';
import 'package:new_quiz/main.dart';

import '../../enums/data_type.dart';
import '../models/apis/token_info.dart';
import '../models/cart_model.dart';

class sharedPreferenceRepository{
  SharedPreferences globalSharedPrefs = Get.find();
   String PREF_FIRST_LUANCH='first_launch';
   String PREF_IS_LOGGEDIN="is_logged _in";
  String PREF_TOKEN_INFO = 'token_info';
  String PREF_APP_LANG = 'app_language';
  String PREF_CART_LIST = 'cart_list';
  String PREF_ORDER_PLACED = 'order_placed';
  String PREF_SUB_STATUS = 'sub_status';
  String PREF_USER = 'USER';


  setSubStatus(bool value) {
    setPrefrence(
      dataType: DataType.BOOL,
      key: PREF_SUB_STATUS,
      value: value,
    );
  }

  setUser(String value) {
    setPrefrence(
      dataType: DataType.STRING,
      key: PREF_USER,
      value: value,
    );
  }

  String getUser() {
    if (globalSharedPrefs.containsKey(PREF_USER)) {
      return getPrference(key: PREF_USER);
    } else {
      return "";
    }
  }
  bool getSubStatus() {
    if (globalSharedPrefs.containsKey(PREF_SUB_STATUS)) {
      return getPrference(key: PREF_SUB_STATUS);
    } else {
      return true;
    }
  }



  setAppLanguage(String value) {
    setPrefrence(
      dataType: DataType.STRING,
      key: PREF_APP_LANG,
      value: value,
    );
  }

  String getAppLanguage() {
    if (globalSharedPrefs.containsKey(PREF_APP_LANG)) {
      return getPrference(key: PREF_APP_LANG);
    } else {
      return 'ar';//هالشي بحددو الكلاينت انو اول ما يأقلع التطبيق شو رح تكون اللغة
    }
  }

  void setCartList(List<CartModel> list) {
    setPrefrence(
        dataType: DataType.STRING,
        key: PREF_CART_LIST,
        value: CartModel.encode(list));
  }

  List<CartModel> getCartList() {
    if (globalSharedPrefs.containsKey(PREF_CART_LIST)) {
      return CartModel.decode(getPrference(key: PREF_CART_LIST));
    } else {
      return [];
    }
  }

  setOrderPlaced(bool value) {
    setPrefrence(
      dataType: DataType.BOOL,
      key: PREF_ORDER_PLACED,
      value: value,
    );
  }

  bool getOrderPlaced() {
    if (globalSharedPrefs.containsKey(PREF_ORDER_PLACED)) {
      return getPrference(key: PREF_ORDER_PLACED);
    } else {
      return false;
    }
  }

   setTokenInfo(TokenInfo value) {
    setPrefrence(
      dataType: DataType.STRING,
      key: PREF_TOKEN_INFO,
      value: jsonEncode(value),
    );
  }

   TokenInfo? getTokenInfo() {
    if (globalSharedPrefs.containsKey(PREF_TOKEN_INFO)) {
      return TokenInfo.fromJson(jsonDecode(getPrference(key: PREF_TOKEN_INFO)));
    } else {
      return null;
    }
  }
   setLoggedIn(bool value)
  {  //globalSharedPrefs!.setBool(PREF_FIRST_LUANCH,value);
    setPrefrence(dataType: DataType.BOOL, key: PREF_IS_LOGGEDIN, value: value);
  }

   bool getLoggedIn()
  {
    if(globalSharedPrefs.containsKey(PREF_IS_LOGGEDIN))
      return getPrference(key: PREF_FIRST_LUANCH);
    else
      return false;
  }

   setFirstLuanch(bool value){
    setPrefrence(dataType:DataType.BOOL, key: PREF_FIRST_LUANCH, value: value);
  }
   bool getFirstLuanch()
  {
    if(globalSharedPrefs.containsKey(PREF_FIRST_LUANCH))
      return getPrference(key: PREF_FIRST_LUANCH);
    else
      return true;

  }


   setPrefrence({required DataType dataType,required String key,required dynamic value}) async {

    switch(dataType){
      case DataType.INT:
        await  globalSharedPrefs.setInt(key, value);
        break;

      case DataType.STRING:
        await  globalSharedPrefs.setString(key, value);
        break;

      case DataType.BOOL:
        await  globalSharedPrefs.setBool(key, value);
        break;

      case DataType.DOUBLE:
        await  globalSharedPrefs.setDouble(key, value);
        break;
      case DataType.LISTSTRING:
        await  globalSharedPrefs.setStringList(key, value);
        break;
    }

    // ignore: unused_element


  }
   dynamic getPrference({required String key}){
    return  globalSharedPrefs!.get(key);

  }
}