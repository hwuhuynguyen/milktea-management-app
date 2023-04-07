import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:ltdidong2/src/data/models/cart.dart';

class OrderObject extends Equatable {
  final int? price;
  final int? amount;
  final String? id;
  final List<Cart> cartList;
  const OrderObject(
      {this.price, this.amount, this.id, this.cartList = const []});
  factory OrderObject.fromJson(Map<String, dynamic> json) {
    List<Cart> ListCart = [];
    if (json["products"] != null) {
      List listHistories = json["products"] as List;

      listHistories.forEach((element) {
        if (element['product']['name'] != null) {
          Cart data = Cart.fromJson(element);
          ListCart.add(data);
        }
      });
    }
    return OrderObject(
      price: json["price"],
      amount: json["amount"],
      cartList: ListCart,
      id: json["_id"],
    );
  }
  List<Object?> get props => [price, amount, id, cartList];
}
