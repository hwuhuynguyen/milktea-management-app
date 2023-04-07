import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ltdidong2/src/data/cart/cart_bloc.dart';
import 'package:ltdidong2/src/data/order_service.dart';
import 'package:ltdidong2/src/screens/cart/widget/cart_bottom_bar.dart';
import 'package:ltdidong2/src/screens/cart/widget/order_item.dart';
import 'package:ltdidong2/src/utlis/format.dart';
import 'package:ltdidong2/src/widgets/app_bar_widget.dart';
import 'package:ltdidong2/src/widgets/drawer_widget.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenDetailState createState() => _OrderScreenDetailState();
}

class _OrderScreenDetailState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppBarWidget(),
                      Container(
                        padding: const EdgeInsets.all(15),
                        child: const Text(
                          "Hoá đơn",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      for (int i = 0;
                          i < OrderService().itemSelected!.cartList.length;
                          i++)
                        OrderItem(
                          disable: true,
                          onPlus: () {},
                          onDecrease: () {},
                          cart: OrderService().itemSelected!.cartList[i],
                        ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Số lượng",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Text(
                                          OrderService()
                                              .itemSelected!
                                              .amount
                                              .toString(),
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.black,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Tiền trà sữa",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Text(
                                          FormatValidator().formatPrice(
                                              OrderService()
                                                  .itemSelected!
                                                  .price
                                                  .toString()),
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.black12,
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.symmetric(
                                  //       vertical: 10),
                                  //   child: Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.spaceBetween,
                                  //     children: const [
                                  //       Text(
                                  //         "Tiền thêm",
                                  //         style: TextStyle(fontSize: 20),
                                  //       ),
                                  //       Text(
                                  //         "0",
                                  //         style: TextStyle(fontSize: 20),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  // const Divider(
                                  //   color: Colors.black12,
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Tổng cộng",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Text(
                                          FormatValidator().formatPrice(
                                              OrderService()
                                                  .itemSelected!
                                                  .price
                                                  .toString()),
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )))
                    ]),
              ),
            )
          ],
        ),
        drawer: const DrawerWidget(),
        bottomNavigationBar: CartBottomBar(
          total: OrderService().itemSelected!.price!,
          onClick: () {},
          disable: true,
        ));
  }
}
