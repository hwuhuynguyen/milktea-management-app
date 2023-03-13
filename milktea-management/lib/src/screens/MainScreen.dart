import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ltdidong2/src/data/history.dart';
import 'package:ltdidong2/src/data/history_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StateMainScreen();
  }
}

enum ChooseOption { chocolate, cream }

class _StateMainScreen extends State<MainScreen> {
  String result = "";
  String action = "";
  bool chocolate = false;
  bool cream = false;
  int quantity = 0;
  double price = 0;
  String input = "";

  void handleValue() {
    price = 0;
    if (cream) {
      price += 0.5;
    }
    if (chocolate) {
      price += 1;
    }
    if (quantity > 0) {
      price += 4 * quantity;
    } else {
      price = 0;
    }
    HistoryService().addHistory(History(
        chocolate: chocolate,
        cream: cream,
        index: HistoryService().data.length + 1,
        quantity: quantity,
        price: price,
        status: "Đang chế biến"));
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.blue,
              size: 30.0,
            ),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: Image.asset(
                  "assets/images/caphe.jpeg",
                  height: 100,
                )),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                    child: Text(
                  "Choose Toppings",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: "Open Sans",
                    fontWeight: FontWeight.w600,
                  ),
                )),
                Center(
                  child: Container(
                    width: 250,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          value: cream,
                          onChanged: (bool? value) {
                            setState(() {
                              cream = value!;
                            });
                          },
                        ),
                        const Text("Cream"),
                        Checkbox(
                          checkColor: Colors.white,
                          value: chocolate,
                          onChanged: (bool? value) {
                            setState(() {
                              chocolate = value!;
                            });
                          },
                        ),
                        const Text("Chocolate"),
                      ],
                    ),
                  ),
                ),
                const Text("Quantity"),
                Center(
                    child: Container(
                        width: 250,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (quantity > 0) {
                                    setState(() {
                                      quantity--;
                                    });
                                  }
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  color: Colors.blue,
                                  size: 30.0,
                                ),
                              ),
                              Text(quantity.toString()),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.blue,
                                  size: 30.0,
                                ),
                              ),
                            ]))),
                Center(
                    child: GestureDetector(
                        onTap: () {
                          handleValue();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 45,
                          width: 120,
                          decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: const Text(
                            "Order",
                            style: TextStyle(
                                fontFamily: "Open Sans",
                                fontSize: 17,
                                color: Colors.black),
                          ),
                        ))),
                const Text(
                  "Order Summary : ",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: "Open Sans",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Add whipped cream?: ${cream.toString()}"),
                        Text("Add Chocolate: ${chocolate.toString()}"),
                        Text("Quantity: ${quantity.toString()}"),
                        Text("Price: ${price.toString()}"),
                        const Text("Thank You"),
                      ]),
                ),
              ],
            )));
  }
}

Future alertDialogError(BuildContext context, String content) async {
  await showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            contentPadding: const EdgeInsets.fromLTRB(20, 27, 20, 19),
            actionsPadding: const EdgeInsets.fromLTRB(30, 10, 30, 40),
            backgroundColor: Colors.white.withOpacity(0.95),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24.0))),
            content: Row(
              children: [
                Text(content,
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: "Open Sans"),
                    textAlign: TextAlign.center)
              ],
            ),
          )));
}
