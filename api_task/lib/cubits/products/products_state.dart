part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState{}

final class ProductsNoData extends ProductsState{}

final class ProductsSuccess extends ProductsState {
  ProductsSuccess({required this.response});
  final List<Welcome> response;
}

final class ProductsNetworkError extends ProductsState {
  ProductsNetworkError({required this.errorMessage});
  final String errorMessage;
}

final class ProductsFailure extends ProductsState {
  ProductsFailure({required this.errorMessage});
  final String errorMessage;
}
