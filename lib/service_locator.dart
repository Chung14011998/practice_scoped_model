
import 'package:design_ui_simple/scoped_model/product_model.dart';
import 'package:design_ui_simple/service/product_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt();

void setupLocator() {
  // Register services
  locator.registerLazySingleton<ProductService>( () => ProductService());
  // Register models
  //Register HomeModel as a Factory with locator
  //every time you request a type of HomeModel from the locator
  //return you a new instance of ProductModel
  locator.registerFactory<ProductModel>(() => ProductModel());
}