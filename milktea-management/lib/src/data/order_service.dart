import 'package:dio/dio.dart';
import 'package:ltdidong2/src/config/https/http_service.dart';
import 'package:ltdidong2/src/data/models/order.dart';

class OrderService {
  OrderService._privateConstructor();

  static final OrderService _instance = OrderService._privateConstructor();

  factory OrderService() {
    return _instance;
  }
  List<OrderObject> listOrder = [];
  OrderObject? itemSelected;
  Future<void> getOrderDetail(String id) async {
    try {
      final Response response = await HttpService()
          .request(url: "order/detail", method: Method.GET, params: {'id': id});
      itemSelected = OrderObject.fromJson(response.data['order']);
      print(itemSelected);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getList() async {
    try {
      final Response response = await HttpService()
          .request(url: "order", method: Method.GET, params: {});
      List listOrders = response.data["orders"] as List;
      List<OrderObject> result = [];

      listOrders.forEach((element) {
        OrderObject data = OrderObject.fromJson(element);
        result.add(data);
      });
      listOrder = result;
    } catch (e) {
      print(e);
    }
  }
}
