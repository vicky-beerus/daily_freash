import 'package:flutter/material.dart';

import '../CONSTANT/constant.dart';
import 'custom_text.dart';


class CustomAppBar extends StatelessWidget {
   CustomAppBar({
    super.key,
    required this.h,
     this.leading,
     this.txt
  });

  final double h;
  String? txt;
  Function()? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
          onTap: leading == null ?(){
            Navigator.pop(context);
          }:leading,
          child: Image.asset(AppAssets.backArrow)),
      title: CustomText(txt:txt ?? "Tittle" ,clr: AppColors.primaryColor,fontWeight: FontWeight.w600,),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: Container(
          width: double.infinity,
          height: h*0.01,
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black.withOpacity(0.4)))
          ),

        ),
      ),
    );
  }
}