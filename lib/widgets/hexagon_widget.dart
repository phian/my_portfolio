import 'package:flutter/material.dart';

import '../utils/utils.dart';

class HexagonWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color? backgroundColor;
  final EdgeInsets? margin;
  final Widget? child;

  const HexagonWidget({
    Key? key,
    this.width = 56.0,
    this.height = 56.0,
    this.backgroundColor,
    this.margin,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: const HexagonClipper(),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(color: backgroundColor),
        margin: margin,
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
