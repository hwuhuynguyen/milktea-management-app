import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class NewestProductItem extends StatefulWidget {
  const NewestProductItem({Key? key}) : super(key: key);

  @override
  _NewestProductItemState createState() => _NewestProductItemState();
}

class _NewestProductItemState extends State<NewestProductItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Container(
        height: 150,
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
        child: GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Image.network(
                      height: 120,
                      width: 150,
                      "https://hopdungthucan.com/wp-content/uploads/2022/05/hinh-anh-ly-tra-sua-tran-chau-den_062227981.jpg"),
                ),
                Container(
                  width: 180,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      const Flexible(
                          child: Text(
                        "Trà sữa",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      )),
                      const Flexible(
                          child: Text(
                        "Trà sữa thơm ngon uống vào ngây ngất",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(fontSize: 16),
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
                        children: const [
                          Text(
                            "\$10",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.red),
                          ),
                          Padding(
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
            )),
      ),
    );
  }
}
