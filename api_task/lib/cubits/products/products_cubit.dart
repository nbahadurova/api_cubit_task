import 'dart:io';
import 'package:http/http.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_task/data/models/products_model.dart';
import 'package:api_task/data/services/products_service.dart';




part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  void getProducts() async {
    try {
      emit(ProductsLoading());
      final result = await ProductsService().getProducts();
      emit(ProductsSuccess(response: result)); 
    } on SocketException catch(e){
      emit(ProductsNetworkError(errorMessage: 'No internet'));
    }
    catch (e) {
      emit(ProductsFailure(errorMessage: 'Error'));
    }
  }
  @override
  Future<void> close() {
    return super.close();
  }
}
