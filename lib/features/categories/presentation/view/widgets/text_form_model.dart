import 'package:flutter/material.dart';

class TextFormFieldModel extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final double horiPadding;
  final double vertpadding;
  const TextFormFieldModel({super.key, required this.controller, required this.text, required this.horiPadding, required this.vertpadding});

  @override
  Widget build(BuildContext context) {
    return TextField(
          controller:controller ,
          decoration: InputDecoration(
            hintText: text,
            contentPadding:EdgeInsets.symmetric(horizontal:horiPadding,vertical: vertpadding),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
          style: const TextStyle(height: 1.5), // Adjusts the height of the text inside the TextField
          maxLines: 1,
        );
  }
}