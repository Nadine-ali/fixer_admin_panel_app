import 'package:fixer_admin_panel_app/features/Dashboard/presentation/view/widget/table_shimmer_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TableShimmer extends StatelessWidget {
  const TableShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;  
     return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: SizedBox(
              width: double.infinity,
              height: size.height * 0.3, // Adjust the height as needed
              child: Column(
                children: List.generate(
                  7,
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