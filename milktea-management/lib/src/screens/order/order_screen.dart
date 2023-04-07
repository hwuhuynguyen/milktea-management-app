import 'package:flutter/material.dart';
import 'package:ltdidong2/src/data/order_service.dart';
import 'package:ltdidong2/src/utlis/format.dart';
import 'package:ltdidong2/src/widgets/app_bar_widget.dart';
import 'package:ltdidong2/src/widgets/drawer_widget.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool loading = true;

  void init() async {
    await OrderService().getList();

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    init();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
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
                      loading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Container(),
                      for (int i = 0; i < OrderService().listOrder.length; i++)
                        GestureDetector(
                          onTap: () async {
                            await OrderService().getOrderDetail(
                                OrderService().listOrder[i].id!);
                            Navigator.pushNamed(context, '/orders/detail');
                          },
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Container(
                                  width: 380,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 3,
                                          blurRadius: 10,
                                          offset: Offset(0, 10),
                                        )
                                      ]),
                                  child: Row(children: [
                                    Image.asset(
                                      'assets/images/logo.jpeg',
                                      height: 150,
                                      width: 150,
                                    ),
                                    Column(
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'Số lượng: ${OrderService().listOrder[i].amount}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'Giá tiền:${FormatValidator().formatPrice(OrderService().listOrder[i].price.toString())}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ],
                                    )
                                  ]))),
                        )
                    ]))),
      ]),
      drawer: const DrawerWidget(),
    );
  }
}
