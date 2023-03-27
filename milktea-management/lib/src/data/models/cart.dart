import 'package:equatable/equatable.dart';
import 'package:ltdidong2/src/data/models/product.dart';

class Cart extends Equatable {
  final int? number;
  final Product? product;

  const Cart({
    this.number,
    this.product,
  });
  List<Object?> get props => [number, product];
  Map<String, dynamic> toJson() => {
        "number": this.number,
        "product": this.product!.toJson(),
      };
  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        number: json["number"],
        product: Product.fromJson(json["product"]),
      );
}
