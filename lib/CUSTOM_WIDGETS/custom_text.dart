import 'package:flutter/material.dart';


class CustomText extends StatelessWidget {

   String txt;
   Color? clr;
   double? size,space;
   FontWeight? fontWeight;
   bool? underLn;


   CustomText({required this.txt,this.size,this.fontWeight,this.clr,this.underLn,this.space});

  @override
  Widget build(BuildContext context) {
    return Text(txt,style: TextStyle(
      fontFamily: "Montserrat",
      color:clr ,
      fontWeight:fontWeight ,
      fontSize: size,
      letterSpacing:space ,
      decoration: underLn == true? TextDecoration.underline:null
    ),);
  }
}
