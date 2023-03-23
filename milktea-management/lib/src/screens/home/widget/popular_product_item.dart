import 'package:flutter/material.dart';
import 'package:ltdidong2/src/data/models/product.dart';
import 'package:ltdidong2/src/utlis/format.dart';

class PopularProductItem extends StatefulWidget {
  final Product product;
  final void Function() onClick;

  const PopularProductItem(
      {required this.product, required this.onClick, Key? key})
      : super(key: key);

  @override
  _PopularProductItemState createState() => _PopularProductItemState();
}

class _PopularProductItemState extends State<PopularProductItem> {
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
              width: 170,
              height: 283,
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.network(
                          height: 130,
                          widget.product.image ??
                              "https://hopdungthucan.com/wp-content/uploads/2022/05/hinh-anh-ly-tra-sua-tran-chau-den_062227981.jpg"),
                    ),
                    SizedBox(height: 10),
                    Flexible(
                        child: Text(
                      widget.product.name!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                    const SizedBox(height: 10),
                    Flexible(
                      child: Text(
                        widget.product.description!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$ ${FormatValidator().formatPrice(widget.product.price!.toString())}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.red),
                        ),
                        const Icon(Icons.favorite_border,
                            size: 16, color: Colors.red)
                      ],
                    )
                  ],
                ),
              )),
        ));
  }
}
