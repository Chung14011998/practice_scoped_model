import 'package:design_ui_simple/enums/view_state.dart';
import 'package:design_ui_simple/model/product_respository.dart';
import 'package:design_ui_simple/service/product_service.dart';
import 'base_model.dart';

class ProductModel extends BaseModel{
  ProductResponse productResponse;
  ProductResponse get getData => productResponse;
  ProductService productService = ProductService();
  Future<ProductService> fetchProductData() async{
    setState(ViewState.Busy);
    productResponse = await productService.fetchProductData();
    setState(ViewState.Retrieved);
  }
}