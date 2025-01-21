import 'package:flutter/material.dart';

import '../widgets/colors.dart';


class CustomBorderButton extends StatelessWidget {
  void Function()? onPressed;
  // TextStyle? style;
  String? text;
  Color? textcolor;
  Color? color;
  double? height;
  double? width;
  //EdgeInsetsGeometry? margin;
  double? borderRadius;
  Widget? child;
  CustomBorderButton(
      {super.key,
        this.text,
        this.onPressed,
        this.textcolor,
        this.height,
        this.color,
        // this.margin,
        this.borderRadius,
        this.width,
        this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 60,
      // margin: margin ?? EdgeInsets.fromLTRB(15, 25, 15, 5),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
          backgroundColor: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 20),side: BorderSide(color:ColorSelect.pinkColor,width: 2))),
          child: child),
    );
  }
}