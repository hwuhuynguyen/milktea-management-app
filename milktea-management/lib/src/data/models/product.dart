import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? id;
  final String? name;
  final String? image;
  final String? description;
  final bool? isPopular;
  final int? price;
  const Product({
    this.price,
    this.isPopular,
    this.description,
    this.name,
    this.id,
    this.image,
  });
  List<Object?> get props => [
        id,
        description,
        price,
        isPopular,
        image,
        name,
      ];
  Map<String, dynamic> toJson() => {
        "_id": this.id,
        "description": this.description,
        "price": this.price,
        "isPopular": this.isPopular,
        "name": this.name,
        "image": this.image,
      };
  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        isPopular: json["isPopular"] == 1 ? true : false,
        description: json["description"],
        price: json["price"],
        image: json["image"],
        name: json["name"],
      );
}
