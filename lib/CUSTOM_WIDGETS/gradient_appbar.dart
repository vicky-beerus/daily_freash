import 'package:flutter/material.dart';

import 'custom_widgets.dart';


class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? lead;
  final String? title;
  final List<Widget>? act;




  GradientAppBar({required this.title,this.act,this.lead});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(gradient: LinearGradient(colors: [
        Colors.blueAccent,Colors.green
      ])),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Center(child: CustomText(txt: title ?? "Title",clr: Colors.white,fontWeight: FontWeight.w600),),
        leading: lead ,
        actions: act,
      ),
    );
  }
}