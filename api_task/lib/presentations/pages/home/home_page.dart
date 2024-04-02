import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_task/data/models/products_model.dart';
import 'package:api_task/cubits/products/products_cubit.dart';
import 'package:api_task/data/services/products_service.dart';
import 'package:api_task/utilities/extensions/num_extensions.dart';
import 'package:api_task/presentations/pages/home/widgets/app_bar_widget.dart';
import 'package:api_task/presentations/pages/home/widgets/products_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(30), child: AppBarWidget()),
      body: Column(
        children: [
          20.h,
          ProductsWidget(),
        ],
      ),
    );
  }
}
