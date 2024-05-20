import 'package:flutter/material.dart';

class TableShimmerPlaceholderRow extends StatelessWidget {
  final Size size;
  const TableShimmerPlaceholderRow({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: Container(
            height: size.height * 0.03,
            color: Colors.white,
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(
            height: size.height * 0.03,
            color: Colors.white,
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            height: size.height * 0.03,
            color: Colors.white,
          ),
        ),
        if (size.width > 1200)
          Flexible(
            flex: 4,
            child: Container(
              height: size.height * 0.03,
              color: Colors.white,
            ),
          ),
      ],
    );
  }
}
