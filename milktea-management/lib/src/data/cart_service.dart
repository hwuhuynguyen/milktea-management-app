import 'package:ltdidong2/src/data/models/cart.dart';

class CartService {
  CartService._privateConstructor();

  static final CartService _instance = CartService._privateConstructor();

  factory CartService() {
    return _instance;
  }
  List<Cart> listCart = [];
  Future<void> addToCart(Cart item) async {
    List<Cart> listCartResult = [];
    bool check = false;
    listCart.forEach((element) {
      if (element.product == item.product) {
        listCartResult.add(Cart(
            number: element.number! + item.number!, product: element.product));
        check = true;
      } else {
        listCartResult.add(element);
      }
    });
    if (!check) {
      listCartResult.add(item);
    }
    listCart = listCartResult;
    print(listCart);
  }
}
