import 'package:fixer_admin_panel_app/features/Dashboard/presentation/view/widget/charts_shimmer_place_holder.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ChartsShimmer extends StatelessWidget {
  const ChartsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SizedBox(
        width: double.infinity,
        height: size.height * 0.3,
        child: size.width > 700
            ? const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShimmerPlaceholder(),
                  ShimmerPlaceholder(),
                  ShimmerPlaceholder(),
                ],
              )
            : const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShimmerPlaceholder(),
                  SizedBox(height: 20),
                  ShimmerPlaceholder(),
                  SizedBox(height: 20),
                  ShimmerPlaceholder(),
                ],
              ),
      ),
    );
  }
}
