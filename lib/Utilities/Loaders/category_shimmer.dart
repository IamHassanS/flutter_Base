import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/Utilities/Loaders/shimmer_effect.dart';
import 'package:my_first_flutter_app/Utilities/constants/sizes.dart';
import 'package:shimmer/shimmer.dart';

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: AppSizes.spaceBtwItems),
        itemBuilder: (_, __) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TShimmerEffect(width: 55, height: 55, radius: 55), // Image
              SizedBox(height: AppSizes.spaceBtwItems / 2),
              TShimmerEffect(width: 55, height: 8), // Text
            ],
          );
        },
      ),
    );
  }
}