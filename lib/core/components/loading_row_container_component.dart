import 'package:flutter/material.dart';

class LoadingRowContainerComponent extends StatelessWidget {
  final double height, width;
  const LoadingRowContainerComponent(
      {Key? key, this.height = 15, this.width = 150})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadiusDirectional.circular(5)),
      height: height,
      width: width,
    );
  }
}
