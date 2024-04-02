import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {

  const DescriptionWidget({ super.key, required this.descriptionText });
  final String descriptionText;
   @override
   Widget build(BuildContext context) {
       return Expanded(
                          child: Text(
                            descriptionText,
                            style: const TextStyle(fontSize: 9),
                          ),
                        );
  }
}