import 'package:flutter/material.dart';
class DefaultColorButton extends StatelessWidget {
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
  DefaultColorButton(
      {this.color,
        this.text,
        this.onPressed,
        this.textcolor,
        this.height,
       // this.margin,
        this.borderRadius,
        this.width,
        this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height?? 60,
     // margin: margin ?? EdgeInsets.fromLTRB(15, 25, 15, 5),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              elevation: 3,
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 20))),
          child: child),
    );
  }
}