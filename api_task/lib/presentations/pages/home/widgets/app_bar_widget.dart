import 'package:flutter/material.dart';
import 'package:api_task/utilities/constants/app_texts.dart';
import 'package:api_task/utilities/constants/app_colors.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Center(
        child: Text(
          AppTexts.appBarTitle,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}
