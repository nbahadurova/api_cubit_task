import 'package:flutter/material.dart';
import 'package:api_task/utilities/constants/app_colors.dart';

class ProductContainerWidget extends StatelessWidget {
  const ProductContainerWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: AppColors.grey,
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 2),
            )
          ]),
      child: child,
    );
  }
}
