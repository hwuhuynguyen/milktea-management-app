import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ltdidong2/src/data/models/product.dart';
import 'package:ltdidong2/src/utlis/format.dart';

class NewestProductItem extends StatefulWidget {
  final Product product;
  final void Function() onClick;

  const NewestProductItem(
      {required this.product, required this.onClick, Key? key})
      : super(key: key);

  @override
  _NewestProductItemState createState() => _NewestProductItemState();
}

class _NewestProductItemState extends State<NewestProductItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: GestureDetector(
          onTap: () {
            widget.onClick();
          },
          child: Container(
            height: 175,
            width: MediaQuery.of(context).size.width - 50,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: const Offset(0, 3))
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 150,
                    height: 130,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Image.network(
                          fit: BoxFit.cover,
                          widget.product.image ??
                              "https://hopdungthucan.com/wp-content/uploads/2022/05/hinh-anh-ly-tra-sua-tran-chau-den_062227981.jpg"),
                    )),
                Container(
                  width: 180,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Flexible(
                          child: Text(
                        widget.product.name!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      )),
                      Flexible(
                          child: Text(
                        widget.product.description!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: const TextStyle(fontSize: 16),
                      )),
                      RatingBar(
                        initialRating: 4,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemSize: 18,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                        onRatingUpdate: (index) {},
                        ratingWidget: RatingWidget(
                          full: const Icon(
                            Icons.star,
                            color: Colors.red,
                          ),
                          half: const Icon(
                            Icons.star_half,
                            color: Colors.red,
                          ),
                          empty: const Icon(
                            Icons.star_border,
                            color: Colors.red,
                          ),
                        ),
                      ),
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
                          const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(Icons.shopping_cart_outlined,
                                size: 20, color: Colors.red),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
