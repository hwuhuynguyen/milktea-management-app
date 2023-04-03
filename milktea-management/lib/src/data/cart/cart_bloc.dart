import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:ltdidong2/src/config/https/http_service.dart';
import 'package:ltdidong2/src/data/models/cart.dart';
import 'package:ltdidong2/src/data/models/product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends HydratedBloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<AddToCart>(_onAddToCart);
    on<IncreaseItem>(_onIncreaseItem);
    on<DecreaseItem>(_onDecreaseItem);
    on<OrderEvent>(_onOrderEvent);
  }
  @override
  CartState? fromJson(Map<String, dynamic> json) {
    List item = json["listItem"] as List;
    List<Cart> result = [];
    int total = 0;
    int count = 0;
    item.forEach((element) {
      Cart data = Cart.fromJson(element);
      result.add(data);
      count += data.number!;
      total += data.product!.price! * data.number!;
    });
    // TODO: implement fromJson
    return CartState(
      cartList: result,
      total: total,
      number: count,
    );
  }

  @override
  Map<String, dynamic>? toJson(CartState state) {
    // TODO: implement toJson
    List listItem = [];
    state.cartList.forEach((element) {
      listItem.add(element.toJson());
    });
    return {
      "listItem": listItem,
    };
  }

  void _onAddToCart(
    AddToCart event,
    emit,
  ) async {
    try {
      List<Cart> listCartResult = [];
      bool check = false;
      state.cartList.forEach((element) {
        if (element.product!.id == event.item.product!.id) {
          listCartResult.add(Cart(
              number: element.number! + event.item.number!,
              product: element.product));
          check = true;
        } else {
          listCartResult.add(element);
        }
      });
      if (!check) {
        listCartResult.add(event.item);
      }
      int number = 0;
      int total = 0;
      listCartResult.forEach((element) {
        number += element.number!;
        total += element.product!.price! * element.number!;
      });
      emit(state.copyWith(
          number: number, total: total, cartList: listCartResult));
    } catch (e) {
      print(e);
    }
  }

  void _onIncreaseItem(
    IncreaseItem event,
    emit,
  ) async {
    try {
      int number = 0;
      int total = 0;
      List<Cart> listCartResult = state.cartList.map((e) {
        if (e.product!.id == event.id) {
          number += e.number! + 1;
          total += e.product!.price! * (e.number! + 1);
          return Cart(number: e.number! + 1, product: e.product);
        } else {
          number += e.number!;
          total += e.product!.price! * (e.number!);
          return e;
        }
      }).toList();

      emit(state.copyWith(
          number: number, total: total, cartList: listCartResult));
    } catch (e) {
      print(e);
    }
  }

  void _onDecreaseItem(
    DecreaseItem event,
    emit,
  ) async {
    try {
      int number = 0;
      int total = 0;
      List<Cart> listCartResult = [];
      state.cartList.forEach((e) {
        if (e.product!.id == event.id) {
          number += e.number! - 1;
          total += e.product!.price! * (e.number! - 1);
          if (e.number! != 1) {
            listCartResult.add(Cart(
              number: e.number! - 1,
              product: e.product,
            ));
          }
        } else {
          number += e.number!;
          total += e.product!.price! * (e.number!);
          listCartResult.add(e);
        }
      });
      emit(state.copyWith(
          number: number, total: total, cartList: listCartResult));
    } catch (e) {
      print(e);
    }
  }

  void _onOrderEvent(
    OrderEvent event,
    emit,
  ) async {
    try {
      final Response response = await HttpService()
          .request(url: "order", method: Method.POST, params: {
        "amount": state.number,
        "price": state.total,
        "products": [
          ...state.cartList.map((e) => {
                "product": e.product!.id,
                "amount": e.number,
              })
        ],
      });
      emit(state.copyWith(
        cartList: [],
        number: 0,
        total: 0,
      ));
    } catch (e) {
      print(e);
    }
  }
}
