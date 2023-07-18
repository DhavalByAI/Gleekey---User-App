import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

Widget ShimmerBox(int dheight, int dwidth) {
  return Shimmer(
    duration: Duration(seconds: 1),
    colorOpacity: 0.4,
    child: Container(
      height: dheight.toDouble(),
      width: dwidth.toDouble(),
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
    ),
  );
}

Widget FlexiShimmerBox(int dheight, int dwidth) {
  return Flexible(
    child: Shimmer(
      duration: Duration(seconds: 1),
      colorOpacity: 0.4,
      child: Container(
        height: dheight.toDouble(),
        width: dwidth.toDouble(),
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
      ),
    ),
  );
}
