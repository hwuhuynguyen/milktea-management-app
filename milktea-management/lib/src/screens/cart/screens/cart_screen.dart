import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ltdidong2/src/data/cart/cart_bloc.dart';
import 'package:ltdidong2/src/screens/cart/widget/cart_bottom_bar.dart';
import 'package:ltdidong2/src/screens/cart/widget/order_item.dart';
import 'package:ltdidong2/src/utlis/format.dart';
import 'package:ltdidong2/src/widgets/app_bar_widget.dart';
import 'package:ltdidong2/src/widgets/drawer_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
        buildWhen: (previous, current) =>
            (previous.cartList != current.cartList),
        builder: ((context, state) {
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
                          for (int i = 0; i < state.cartList.length; i++)
                            OrderItem(
                              onPlus: () {
                                BlocProvider.of<CartBloc>(context).add(
                                    IncreaseItem(
                                        state.cartList[i].product!.id!));
                              },
                              onDecrease: () {
                                BlocProvider.of<CartBloc>(context).add(
                                    DecreaseItem(
                                        state.cartList[i].product!.id!));
                              },
                              cart: state.cartList[i],
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
                                              state.number.toString(),
                                              style:
                                                  const TextStyle(fontSize: 20),
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
                                                  state.total.toString()),
                                              style:
                                                  const TextStyle(fontSize: 20),
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
                                                  state.total.toString()),
                                              style:
                                                  const TextStyle(fontSize: 20),
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
              total: state.total,
            ),
          );
        }));
  }
}
