import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_task/data/models/products_model.dart';
import 'package:api_task/cubits/products/products_cubit.dart';
import 'package:api_task/utilities/constants/app_paddings.dart';
import 'package:api_task/presentations/pages/home/widgets/title_widget.dart';
import 'package:api_task/presentations/pages/home/widgets/description_widget.dart';
import 'package:api_task/presentations/pages/home/widgets/product_container_widget.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is ProductsInitial || state is ProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductsNetworkError) {
              return Text(state.errorMessage);
            } else if (state is ProductsFailure) {
              return Text(state.errorMessage);
            } else if (state is ProductsSuccess) {
              final List<Welcome> count = state.response;
              return SizedBox(
                height: MediaQuery.of(context).size.height - 110,
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: count.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      mainAxisExtent: 235,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return ProductContainerWidget(
                        child: Padding(
                      padding: AppPaddings.all5,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                            width: 60,
                            child: Image.network(state.response[index].image!),
                          ),
                          TitleWidget(title: state.response[index].title!),
                          DescriptionWidget(
                              descriptionText:
                                  state.response[index].description!),
                        ],
                      ),
                    ));
                  },
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        )
      ],
    );
  }
}
