import 'package:dio/dio.dart';
import 'package:ltdidong2/src/config/https/http_service.dart';
import 'package:ltdidong2/src/data/models/product.dart';

class ProductService {
  ProductService._privateConstructor();

  static final ProductService _instance = ProductService._privateConstructor();

  factory ProductService() {
    return _instance;
  }
  Product? itemSelect;
  final List<Product> dataProduct = [];
  final List<Product> dataProductNewest = [];
  final List<Product> dataProductPopular = [];
  Future<void> getById(String? id) async {
    dataProduct.forEach((element) {
      if (element.id == id) {
        itemSelect = element;
        return;
      }
    });
    dataProductNewest.forEach((element) {
      if (element.id == id) {
        itemSelect = element;
        return;
      }
    });
    dataProductPopular.forEach((element) {
      if (element.id == id) {
        itemSelect = element;
        return;
      }
    });
  }

  Future<void> getAll() async {
    try {
      final Response response = await HttpService()
          .request(url: "product", method: Method.GET, params: {});
      final dataProductResponse = response.data["data"]["product"] as List;
      List<Product> dataProductList =
          dataProductResponse.map((e) => Product.fromJson(e)).toList();
      dataProduct.addAll(dataProductList);
      final dataProductNewestResponse =
          response.data["data"]["productNewest"] as List;
      List<Product> dataProductNewestList =
          dataProductNewestResponse.map((e) => Product.fromJson(e)).toList();
      dataProductNewest.addAll(dataProductNewestList);
      final dataProductPopularResponse =
          response.data["data"]["productPopular"] as List;
      List<Product> dataProductPopularList =
          dataProductPopularResponse.map((e) => Product.fromJson(e)).toList();
      dataProductPopular.addAll(dataProductPopularList);
    } catch (e) {
      print(e);
    }
  }
}
