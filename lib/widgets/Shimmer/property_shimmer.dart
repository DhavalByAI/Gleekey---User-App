import 'package:flutter/material.dart';


import '../../utils/style/constants.dart';
import 'shimmer_box.dart';

class PropertyShimmer extends StatelessWidget {
  const PropertyShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShimmerBox(160, dwidth),
        const SizedBox(
          height: 12,
        ),
        Row(
          children: [
            FlexiShimmerBox(20, dwidth),
            const SizedBox(
              width: 20,
            ),
            ShimmerBox(20, 40),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          children: [
            FlexiShimmerBox(20, dwidth),
            const SizedBox(
              width: 20,
            ),
            ShimmerBox(20, 100),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        ShimmerBox(45, dwidth)
      ],
    );
  }
}
