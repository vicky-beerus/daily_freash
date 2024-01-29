import 'package:flutter/material.dart';

import '../CONSTANT/constant.dart';


class CustomTextFormField extends StatelessWidget {

  TextEditingController? controller;
  String? hintTxt;
  double? h,w,radius;
  Widget? suffix;
  Color? fillClr;

  CustomTextFormField(
      {this.controller,
      this.hintTxt,
      this.h,
      this.w,
      this.radius,
        this.fillClr,
      this.suffix});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w ?? 20,vertical: h ??1),
      child: TextFormField(

        decoration: InputDecoration(
          labelText: hintTxt, // Hint text
          suffixIcon: suffix, //// Suffix Icon
          fillColor: fillClr == null ?AppColors.fillColor:fillClr,
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color:AppColors.fillColor),
              borderRadius: BorderRadius.circular(radius ?? 7,)
          ),
          focusedBorder:OutlineInputBorder(
              borderSide: BorderSide(color:AppColors.primaryColor),
              borderRadius: BorderRadius.circular(radius ?? 7,)
          ),
          helperStyle: TextStyle(
            color: Color(0xff626262),
            fontWeight: FontWeight.w800,
            fontSize: 12
          ),

          border: OutlineInputBorder(
            borderSide: BorderSide(color:Colors.transparent),
              borderRadius: BorderRadius.circular(radius ?? 7,)), //
          // Outlined border
        ),
      ),
    );
  }
}