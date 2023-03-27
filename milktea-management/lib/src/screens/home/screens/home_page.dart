import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:ltdidong2/src/data/cart/cart_bloc.dart';
import 'package:ltdidong2/src/data/cart_service.dart';
import 'package:ltdidong2/src/data/history.dart';
import 'package:ltdidong2/src/data/history_service.dart';
import 'package:ltdidong2/src/data/product_service.dart';
import 'package:ltdidong2/src/screens/home/widget/newest_list_widget.dart';
import 'package:ltdidong2/src/screens/home/widget/popular_list_widget.dart';
import 'package:ltdidong2/src/screens/home/widget/search_list_widget.dart';
import 'package:ltdidong2/src/widgets/LoadingScreen.dart';
import 'package:ltdidong2/src/widgets/app_bar_widget.dart';
import 'package:ltdidong2/src/screens/home/widget/categories_widget.dart';
import 'package:ltdidong2/src/widgets/drawer_widget.dart';

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
  bool loadingSearch = false;
  bool search = false;
  Timer? _debounce;
  String searchInput = "";

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
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingScreen()
        : KeyboardDismisser(
            child: Scaffold(
                drawer: DrawerWidget(),
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
                  child: Stack(
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/cart");
                        },
                        child: const Icon(
                          Icons.shopping_cart,
                          size: 28,
                          color: Colors.red,
                        ),
                        backgroundColor: Colors.white,
                      ),
                      Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.red,
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 5),
                            alignment: Alignment.center,
                            child: BlocBuilder<CartBloc, CartState>(
                                buildWhen: (previous, current) =>
                                    (previous.cartList != current.cartList),
                                builder: ((context, state) {
                                  return Text(
                                    state.cartList.length.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Open Sans',
                                        fontSize: 15),
                                  );
                                })),
                          )),
                    ],
                  ),
                ),
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
                                      onChanged: (value) async {
                                        setState(() {
                                          loadingSearch = true;
                                        });
                                        if (_debounce?.isActive ?? false)
                                          _debounce?.cancel();
                                        _debounce = Timer(
                                            const Duration(milliseconds: 500),
                                            () {
                                          // do something with query
                                          searchInput = value;
                                          productService.searchByTitle(value);
                                          if (value.length > 0) {
                                            setState(() {
                                              search = true;
                                              loadingSearch = false;
                                            });
                                          } else {
                                            setState(() {
                                              search = false;
                                              loadingSearch = false;
                                            });
                                          }
                                        });
                                      },
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
                    search
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  child: const Text(
                                    "Kết quả",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                loadingSearch
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : const SearchListWidget(),
                              ])
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(20),
                                child: const Text(
                                  "Sản phẩm",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              CategoriesWidget(),
                              Container(
                                padding: const EdgeInsets.all(15),
                                child: const Text(
                                  "Phổ biến",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              PopularListWidget(),
                              Container(
                                padding: const EdgeInsets.all(15),
                                child: const Text(
                                  "Mới nhất",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              NewestListWidget(),
                            ],
                          ),
                    SizedBox(
                      height: 60,
                    ),
                  ],
                )));
  }
}
