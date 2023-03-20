import 'package:flutter/material.dart';
import 'package:ltdidong2/src/data/product_service.dart';
import 'package:ltdidong2/src/screens/home/widget/newest_product_item.dart';
import 'package:ltdidong2/src/screens/home/widget/popular_product_item.dart';
import 'package:ltdidong2/src/screens/home/widget/product_category_item.dart';

class NewestListWidget extends StatefulWidget {
  const NewestListWidget({Key? key}) : super(key: key);

  @override
  _NewestListWidgetState createState() => _NewestListWidgetState();
}

class _NewestListWidgetState extends State<NewestListWidget> {
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
            for (int i = 0; i < ProductService().dataProductNewest.length; i++)
              NewestProductItem(product: ProductService().dataProductNewest[i])
          ],
        ),
      ),
    );
  }
}
