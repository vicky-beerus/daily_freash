import 'package:flutter/material.dart';


import '../CONSTANT/constant.dart';
import 'custom_text.dart';



class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    this.h,
    this.w,
    this.txt,
    this.tap,this.radius,
    this.brClr,
    this.txtClr,
    this.bgClr,
    this.shadowWant,
    this.brWidth
  });

  final double? h;
  final double? w,radius,brWidth;
  String? txt;
  Function()? tap;
  Color? bgClr,txtClr,brClr;
  bool? shadowWant;


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: tap,
      child: Container(
        height: h ?? height*0.06,
        width: w ?? width*0.45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgClr ?? AppColors.primaryColor,
            boxShadow: shadowWant == false ? []: [

              BoxShadow(
                color: AppColors.primaryColor.withOpacity(0.7),
                blurRadius: 7,
                offset: Offset(0, 5),
              )
            ],

            border: Border.all(
              width: brWidth ?? 1,
                color: brClr ?? AppColors.primaryColor),

            borderRadius: BorderRadius.circular(
               radius ?? 15,

            )
        ),
        child: CustomText(txt: txt.toString(),fontWeight: FontWeight.bold,clr: txtClr ?? Colors.white,size: 18,),
      ),
    );
  }
}