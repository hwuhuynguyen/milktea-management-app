import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ltdidong2/src/data/history.dart';
import 'package:ltdidong2/src/data/history_service.dart';
import 'package:ltdidong2/src/widgets/historyItem.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StateHistoryScreen();
  }
}

class _StateHistoryScreen extends State<HistoryScreen> {
  List<History> data = HistoryService().data;
  void setUp() async {
    await HistoryService().getAll();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // setUp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: IconButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/add',
            ).then((value) => setState(
                  () {
                    data = HistoryService().data;
                  },
                ));
          },
          icon: const Icon(
            Icons.add,
            color: Colors.blue,
            size: 30.0,
          ),
        ),
        // appBar: AppBar(
        //   elevation: 0,
        //   title: const Text(
        //     'Lịch sử giao dịch',
        //   ),
        //   titleTextStyle: const TextStyle(
        //     fontSize: 20,
        //     color: Colors.black,
        //     fontFamily: "Open Sans",
        //     fontWeight: FontWeight.w600,
        //   ),
        //   centerTitle: true,
        //   actions: [
        //     IconButton(
        //       onPressed: () {
        //         HistoryService().deleteAll();
        //         setState(() {
        //           data = [];
        //         });
        //       },
        //       icon: const Icon(
        //         Icons.delete,
        //         color: Colors.blue,
        //         size: 30.0,
        //       ),
        //     ),
        //   ],
        //   leading: IconButton(
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //     icon: const Icon(
        //       Icons.arrow_back_ios_new,
        //       color: Colors.blue,
        //       size: 30.0,
        //     ),
        //   ),
        //   backgroundColor: Colors.transparent,
        //   shadowColor: Colors.transparent,
        // ),
        body: Container(
          child: Column(
            children: [
              TextField(
                onChanged: (value) async {
                  if (value.length > 0) {
                    data = await HistoryService().searchItem(int.parse(value));
                    setState(() {});
                  } else {
                    setState(() {
                      data = HistoryService().data;
                    });
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.blue,
                    size: 30.0,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Flexible(
                  flex: 1,
                  child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return HistoryDetail(
                            data: data[index],
                            handleDelete: () {
                              HistoryService().deleteByIndex(index);
                              setState(() {
                                data = HistoryService().data;
                              });
                            },
                            handleClick: () {
                              HistoryService().updateStatus(index);
                              setState(() {
                                data = HistoryService().data;
                              });
                            });
                      })),
            ],
          ),
        ));
  }
}
