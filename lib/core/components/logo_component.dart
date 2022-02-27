import 'package:flutter/material.dart';

class LogoComponent extends StatelessWidget {
  final double height;
  final double width;
  final EdgeInsetsGeometry margin;

  const LogoComponent(
      {Key? key,
      this.height = 120,
      this.width = 120,
      this.margin = const EdgeInsets.all(10)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Image.asset(
        'assets/img/logo.png',
        height: height,
        width: width,
      ),
    );
  }
}
