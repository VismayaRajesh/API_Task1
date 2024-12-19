import 'package:api_task/service/apiservice.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../model/ProductResp.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  Apiservice apiservice = Apiservice();
  ProductBloc() : super(ProductInitial(plist: [])) {
    on<fetchproducts>((event, emit) async {
      final products = await apiservice.getAllproducts() ?? [];
      emit(ProductState(plist: products));
    });
  }
}
