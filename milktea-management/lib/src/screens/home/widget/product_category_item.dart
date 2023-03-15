import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            "https://hopdungthucan.com/wp-content/uploads/2022/05/hinh-anh-ly-tra-sua-tran-chau-den_062227981.jpg"),
      ),
    );
  }
}
