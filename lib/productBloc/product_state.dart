part of 'product_bloc.dart';

class ProductState {
  var plist = <ProductResp>[];

  ProductState({required this.plist});
}

final class ProductInitial extends ProductState {
  ProductInitial({required super.plist});
}
