import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:ltdidong2/src/data/history.dart';
import 'package:ltdidong2/src/data/history_service.dart';
import 'package:ltdidong2/src/data/product_service.dart';
import 'package:ltdidong2/src/screens/home/widget/newest_list_widget.dart';
import 'package:ltdidong2/src/screens/home/widget/popular_list_widget.dart';
import 'package:ltdidong2/src/widgets/LoadingScreen.dart';
import 'package:ltdidong2/src/widgets/app_bar_widget.dart';
import 'package:ltdidong2/src/screens/home/widget/categories_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StateHomePage();
  }
}

class _StateHomePage extends State<HomePage> {
  ProductService productService = ProductService();
  bool loading = true;
  void initData() async {
    await productService.getAll();
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingScreen()
        : KeyboardDismisser(
            child: Scaffold(
                floatingActionButton: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          )
                        ]),
                    child: FloatingActionButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.shopping_cart,
                        size: 28,
                        color: Colors.red,
                      ),
                      backgroundColor: Colors.white,
                    )),
                body: ListView(
                  children: [
                    const AppBarWidget(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                )
                              ]),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.search,
                                  color: Colors.red,
                                ),
                                Container(
                                  height: 50,
                                  width: 280,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: TextFormField(
                                      decoration: const InputDecoration(
                                          hintText: "Bạn muốn tìm gì",
                                          border: InputBorder.none)),
                                ),
                                const Icon(
                                  Icons.filter_list,
                                ),
                              ],
                            ),
                          )),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: const Text(
                        "Sản phẩm",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    CategoriesWidget(),
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: const Text(
                        "Phổ biến",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    PopularListWidget(),
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: const Text(
                        "Mới nhất",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    NewestListWidget()
                  ],
                )));
  }
}
