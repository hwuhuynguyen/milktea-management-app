import 'package:equatable/equatable.dart';

class History extends Equatable {
  final int? index;
  final bool? cream;
  final bool? chocolate;
  final int? quantity;
  final String? status;
  final double? price;
  const History({
    this.index,
    this.cream,
    this.chocolate,
    this.quantity,
    this.status,
    this.price,
  });
  List<Object?> get props => [
        cream,
        index,
        price,
        status,
        quantity,
        chocolate,
      ];
  Map<String, dynamic> toJson() => {
        "index": this.index,
        "cream": this.cream,
        "chocolate": this.chocolate,
        "quantity": this.quantity,
        "status": this.status,
        "price": this.price,
      };
  factory History.fromJson(Map<String, dynamic> json) => History(
        index: json["index"],
        cream: json["cream"],
        chocolate: json["chocolate"],
        quantity: json["quantity"],
        status: json["status"],
        price: json["price"],
      );
}
