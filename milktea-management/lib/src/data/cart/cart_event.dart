part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
  @override
  List<Object> get props => [];
}

class AddToCart extends CartEvent {
  final Cart item;
  const AddToCart(this.item);

  @override
  List<Object> get props => [item];
}

class IncreaseItem extends CartEvent {
  final String id;
  const IncreaseItem(this.id);

  @override
  List<Object> get props => [id];
}

class DecreaseItem extends CartEvent {
  final String id;
  const DecreaseItem(this.id);

  @override
  List<Object> get props => [id];
}
