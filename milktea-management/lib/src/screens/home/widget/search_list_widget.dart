import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ltdidong2/src/data/cart/cart_bloc.dart';
import 'package:ltdidong2/src/data/models/cart.dart';
import 'package:ltdidong2/src/data/product_service.dart';
import 'package:ltdidong2/src/screens/home/widget/newest_product_item.dart';
import 'package:ltdidong2/src/screens/home/widget/popular_product_item.dart';
import 'package:ltdidong2/src/screens/home/widget/product_category_item.dart';

class SearchListWidget extends StatefulWidget {
  const SearchListWidget({Key? key}) : super(key: key);

  @override
  _SearchListWidgetState createState() => _SearchListWidgetState();
}

class _SearchListWidgetState extends State<SearchListWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: Column(
          children: [
            for (int i = 0; i < ProductService().dataSearch.length; i++)
              NewestProductItem(
                  onClick: () {
                    ProductService().getById(ProductService().dataSearch[i].id);
                    Navigator.of(context).pushNamed("/detail");
                  },
                  onPlus: (() {
                    BlocProvider.of<CartBloc>(context).add(AddToCart(Cart(
                        number: 1, product: ProductService().dataSearch[i])));
                  }),
                  product: ProductService().dataSearch[i])
          ],
        ),
      ),
    );
  }
}
