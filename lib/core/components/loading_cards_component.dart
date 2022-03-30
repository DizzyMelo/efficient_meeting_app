import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'loading_row_container_component.dart';

class LoadingCardsComponent extends StatelessWidget {
  const LoadingCardsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 40;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // LoadingRowContainerComponent(),
            LoadingRowContainerComponent(
              height: 80,
              width: width,
            ),
            LoadingRowContainerComponent(
              height: 80,
              width: width,
            ),
            LoadingRowContainerComponent(
              height: 80,
              width: width,
            ),
          ],
        ),
      ),
    );
  }
}
