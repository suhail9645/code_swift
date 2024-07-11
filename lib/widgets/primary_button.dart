
import 'package:code_swift/manager/color_manager.dart';
import 'package:code_swift/manager/font_manager.dart';
import 'package:flutter/material.dart';


class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key, required this.title, this.backgroundColor, this.height, this.width, required this.onTap, this.titleStyle, this.radius,
  });
    final String title;
    final Color? backgroundColor;
    final double? height;
    final double? width;
    final Function() onTap;
    final TextStyle? titleStyle;
    final double? radius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
     height: height,
     width: width,
     decoration: BoxDecoration(color:backgroundColor?? Colors.white,borderRadius: BorderRadius.circular(radius??5)),
     child: Center(child: Text(title,style:titleStyle?? appFont.f12w500Black.copyWith(color: appColors.primary),),),
    ),);
  }
}
