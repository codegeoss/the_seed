import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:{{project_name.snakeCase()}}/core/core.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget.rectangular({
    required this.height,
    super.key,
    this.width = double.infinity,
    this.shimmerColor,
  }) : shapeBorder = const RoundedRectangleBorder(
         borderRadius: BorderRadius.all(Radius.circular(AppSizes.cardRadiusMd)),
       );

  const ShimmerWidget.circular({
    required this.width,
    required this.height,
    super.key,
    this.shapeBorder = const CircleBorder(),
    this.shimmerColor = AppColors.lightContainer,
  });

  final double width;
  final double height;
  final ShapeBorder shapeBorder;
  final Color? shimmerColor;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode;
    return Shimmer.fromColors(
      baseColor:
          shimmerColor ??
          (isDarkMode ? AppColors.darkContainer : AppColors.lightContainer),
      highlightColor: Colors.grey.shade100,
      period: const Duration(seconds: 2),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color:
              shimmerColor ??
              (isDarkMode ? AppColors.darkContainer : AppColors.lightContainer),
          shape: shapeBorder,
        ),
      ),
    );
  }
}
