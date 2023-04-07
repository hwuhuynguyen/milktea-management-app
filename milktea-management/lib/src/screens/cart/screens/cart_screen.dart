import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ltdidong2/src/data/cart/cart_bloc.dart';
import 'package:ltdidong2/src/screens/cart/widget/cart_bottom_bar.dart';
import 'package:ltdidong2/src/screens/cart/widget/order_item.dart';
import 'package:ltdidong2/src/utlis/format.dart';
import 'package:ltdidong2/src/widgets/app_bar_widget.dart';
import 'package:ltdidong2/src/widgets/drawer_widget.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

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
                onClick: (() async {
                  var dataRegular = await rootBundle
                      .load("assets/fonts/vietnamese/BeVietnamPro-Regular.ttf");
                  var dataBold = await rootBundle
                      .load("assets/fonts/vietnamese/BeVietnamPro-Bold.ttf");
                  final ttfRegular = pw.Font.ttf(dataRegular);
                  final ttfBold = pw.Font.ttf(dataRegular);
                  final theme =
                      pw.ThemeData.withFont(base: ttfRegular, bold: ttfBold);
                  final pdf = pw.Document(theme: theme);
                  // final netImage = await networkImage(
                  //     'https://img5.thuthuatphanmem.vn/uploads/2022/01/13/logo-cua-hang-tra-sua_082029941.jpg');
                  final response = await http.get(Uri.parse(
                      'https://img5.thuthuatphanmem.vn/uploads/2022/01/13/logo-cua-hang-tra-sua_082029941.jpg'));

                  final image = pw.MemoryImage(response.bodyBytes);
                  pdf.addPage(
                    pw.Page(
                      margin: pw.EdgeInsets.all(30),
                      build: (pw.Context context) {
                        return pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Center(
                                child: pw.Image(
                              image,
                              height: 50,
                              width: 50,
                            )),
                            pw.SizedBox(height: 50),
                            pw.Center(
                                child: pw.Text('Hoá Đơn',
                                    style: pw.TextStyle(fontSize: 30))),
                            pw.SizedBox(height: 20),
                            pw.Center(
                                child: pw.Text('Trà Sữa DUT',
                                    style: pw.TextStyle(fontSize: 30))),
                            pw.SizedBox(height: 20),
                            pw.Table.fromTextArray(
                              context: context,
                              data: [
                                ['Tên', 'Giá tiền', 'Số lượng'],
                                ...state.cartList.map((e) => [
                                      e.product!.name,
                                      e.product!.price,
                                      e.number
                                    ])
                              ],
                            ),
                            pw.SizedBox(height: 20),
                            pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.Text('Tổng cộng:',
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Text('\$${state.total}'),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  );
                  Directory? appDocDir =
                      Directory('/storage/emulated/0/Download');
                  var uuid = Uuid();

                  final file = File(appDocDir.path + '/' + uuid.v4() + '.pdf');
                  await file.writeAsBytes(await pdf.save());
                  BlocProvider.of<CartBloc>(context).add(OrderEvent());
                })),
          );
        }));
  }
}
