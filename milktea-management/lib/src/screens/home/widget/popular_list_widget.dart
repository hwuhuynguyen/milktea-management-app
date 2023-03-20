import 'package:flutter/material.dart';
import 'package:ltdidong2/src/data/product_service.dart';
import 'package:ltdidong2/src/screens/home/widget/popular_product_item.dart';
import 'package:ltdidong2/src/screens/home/widget/product_category_item.dart';

class PopularListWidget extends StatefulWidget {
  const PopularListWidget({Key? key}) : super(key: key);

  @override
  _PopularListWidgetState createState() => _PopularListWidgetState();
}

class _PopularListWidgetState extends State<PopularListWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 5,
        ),
        child: Row(
          children: [
            for (int i = 0; i < ProductService().dataProductPopular.length; i++)
              PopularProductItem(
                  product: ProductService().dataProductPopular[i]),
          ],
        ),
      ),
    );
  }
}
