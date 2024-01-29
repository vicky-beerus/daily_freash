import 'package:dailyfreash/HOME_SCREEN/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

class HomeRepository{
  
  
  getData()async{
    final url = Uri.parse("http://pg.dailefresh.com/WebApi/ListProductByCategoryorSubCategory_Page?Cat=FNV&Sub=FV&StoreId=1&User_id=1&R_Number=1");

    var response = await http.get(url);
    return  HomeModel.fromJson(json.decode(response.body));

  }


  getQuan({val})=>val;

  // add({val})=>val+=1;

  add({val}){
    val++;
    return val;
  }

  remove({val})=>val-=1;
  
  
}