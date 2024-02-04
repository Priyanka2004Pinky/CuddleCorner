import 'package:flutter/material.dart';
import 'package:cuddle_corner/Helpers/color_helper.dart';

class ShadowContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final bool? isCircle;
  final Widget? child;
  final Color? color;
  final double radius;

  const ShadowContainer(
      {super.key,
      this.height,
      this.width,
      this.isCircle = false,
      this.child,
      this.color,
      this.radius = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,

      decoration: BoxDecoration(
          color: color ?? ColorHelper.whiteColor,
          shape: isCircle! ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: isCircle! ? null : BorderRadius.all(Radius.circular(radius)),
          boxShadow: const [
            BoxShadow(
                color: ColorHelper.shadowColor,
                blurRadius: 5,
                spreadRadius: 1,
                offset: Offset(4, 4)),
            // BoxShadow(
            //     color: ColorHelper.whiteColor,
            //     blurRadius: 4,
            //     spreadRadius: 1,
            //     offset: Offset(-4, -4)),
          ]),
      child: child,
    );
  }
}
