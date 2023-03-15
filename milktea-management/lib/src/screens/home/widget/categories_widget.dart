import 'package:flutter/material.dart';
import 'package:ltdidong2/src/screens/home/widget/product_category_item.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
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
            for (int i = 0; i < 10; i++) ProductItem(),
          ],
        ),
      ),
    );
  }
}
