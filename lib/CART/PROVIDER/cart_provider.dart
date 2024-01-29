import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../HOME_SCREEN/model/home_model.dart';

class CartProivder extends ChangeNotifier{


  List<Data?> cartList = [];


  addCart({val}){
    if(!cartList.contains(val)){
      cartList.add(val);
      notifyListeners();
    }
  }

  removeCart({Data? val}){

    cartList.forEach((element) {
      cartList.removeWhere((item) => item== val);
      notifyListeners();
    });

    print(cartList.length);
  }


}