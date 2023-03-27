import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ltdidong2/src/data/cart/cart_bloc.dart';
import 'package:ltdidong2/src/data/cart_service.dart';
import 'package:ltdidong2/src/data/models/cart.dart';
import 'package:ltdidong2/src/data/models/product.dart';
import 'package:ltdidong2/src/data/product_service.dart';
import 'package:ltdidong2/src/screens/cart/widget/cart_bottom_bar.dart';
import 'package:ltdidong2/src/screens/product/widget/cart_bottom_bar.dart';
import 'package:ltdidong2/src/utlis/format.dart';
import 'package:ltdidong2/src/widgets/app_bar_widget.dart';
import 'package:ltdidong2/src/widgets/drawer_widget.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Product? itemSelect = ProductService().itemSelect;
  int count = 1;
  int total = ProductService().itemSelect!.price!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppBarWidget(),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Image.network(
                          height: 300,
                          itemSelect!.image!,
                        ),
                      ),
                      Arc(
                          edge: Edge.TOP,
                          arcType: ArcType.CONVEY,
                          height: 30,
                          child: Container(
                            width: double.infinity,
                            color: Colors.white,
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 60, bottom: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            RatingBar(
                                              initialRating: 4,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              itemCount: 5,
                                              itemSize: 18,
                                              itemPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4),
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
                                            Text(
                                              "${FormatValidator().formatPrice(itemSelect!.price!.toString())}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Row(
                                            children: [
                                              Flexible(
                                                  child: Text(
                                                "${itemSelect!.name}",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 28,
                                                ),
                                              )),
                                              Container(
                                                width: 80,
                                                margin:
                                                    EdgeInsets.only(left: 5),
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            count = count == 0
                                                                ? count
                                                                : count - 1;
                                                            total = itemSelect!
                                                                    .price! *
                                                                count;
                                                          });
                                                        },
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  bottom: 12),
                                                          child: const Icon(
                                                            Icons
                                                                .minimize_outlined,
                                                            color: Colors.white,
                                                          ),
                                                        )),
                                                    Text(
                                                      "${count}",
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            count = count + 1;
                                                            total = itemSelect!
                                                                    .price! *
                                                                (count);
                                                          });
                                                        },
                                                        child: const Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                        )),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "${itemSelect!.description}",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  "Delievery Time:",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                Row(
                                                  children: const [
                                                    Icon(
                                                      Icons.access_time,
                                                      color: Colors.red,
                                                    ),
                                                    Text(
                                                      " 30 Minutes",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ))
                                      ],
                                    ))),
                          ))
                    ])))
      ]),
      drawer: const DrawerWidget(),
      bottomNavigationBar: ProductBottomBar(
          total: total,
          onClick: () {
            if (count > 0) {
              BlocProvider.of<CartBloc>(context)
                  .add(AddToCart(Cart(number: count, product: itemSelect)));
            }
          }),
    );
  }
}
