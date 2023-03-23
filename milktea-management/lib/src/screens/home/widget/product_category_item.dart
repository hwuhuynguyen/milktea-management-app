import 'package:flutter/material.dart';
import 'package:ltdidong2/src/data/models/product.dart';

class ProductItem extends StatefulWidget {
  final Product product;
  final void Function() onClick;

  const ProductItem({required this.product, required this.onClick, Key? key})
      : super(key: key);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          widget.onClick();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Container(
            padding: const EdgeInsets.all(
              5,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3))
                ]),
            child: Image.network(
                width: 50,
                height: 50,
                widget.product.image ??
                    "https://hopdungthucan.com/wp-content/uploads/2022/05/hinh-anh-ly-tra-sua-tran-chau-den_062227981.jpg"),
          ),
        ));
  }
}
