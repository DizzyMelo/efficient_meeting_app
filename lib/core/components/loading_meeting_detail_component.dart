import 'package:efficient_meeting_app/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'loading_row_container_component.dart';

class LoadingMeetingDetailComponent extends StatelessWidget {
  const LoadingMeetingDetailComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 20;
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: CustomColors.accent2,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 270,
                color: CustomColors.accent1,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadiusDirectional.circular(40)),
                        height: 80,
                        width: 80,
                      ),
                      const LoadingRowContainerComponent(),
                      const LoadingRowContainerComponent(
                        width: 200,
                      ),
                      const LoadingRowContainerComponent(
                        height: 50,
                        width: 220,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const LoadingRowContainerComponent(
                        width: 200,
                      ),
                      const LoadingRowContainerComponent(
                        width: 250,
                      ),
                      LoadingRowContainerComponent(
                        height: 130,
                        width: width,
                      ),
                      LoadingRowContainerComponent(
                        height: 130,
                        width: width,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
