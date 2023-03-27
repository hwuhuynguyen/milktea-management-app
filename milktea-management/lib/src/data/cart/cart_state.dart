part of 'cart_bloc.dart';

class CartState extends Equatable {
  const CartState({
    this.cartList = const [],
    this.number = 0,
    this.total = 0,
  });
  final List<Cart> cartList;
  final int number;
  final int total;
  CartState copyWith({
    List<Cart>? cartList,
    int? number,
    int? total,
  }) {
    return CartState(
        number: number ?? this.number,
        total: total ?? this.total,
        cartList: cartList ?? this.cartList);
  }

  @override
  List<Object?> get props => [number, total, cartList];
}
