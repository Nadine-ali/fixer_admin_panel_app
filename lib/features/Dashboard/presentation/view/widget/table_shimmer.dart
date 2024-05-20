import 'package:fixer_admin_panel_app/features/Dashboard/presentation/view/widget/table_shimmer_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TableShimmer extends StatelessWidget {
  final int count;
  const TableShimmer({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SizedBox(
        width: double.infinity,
        height: count * size.height * 0.05,
        child: Column(
          children: List.generate(
            count,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: TableShimmerPlaceholderRow(size: size),
            ),
          ),
        ),
      ),
    );
  }
}
