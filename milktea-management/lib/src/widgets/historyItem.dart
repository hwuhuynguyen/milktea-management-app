import 'package:flutter/material.dart';
import 'package:ltdidong2/src/data/history.dart';

class HistoryDetail extends StatefulWidget {
  final History data;
  final Function() handleDelete;
  final Function() handleClick;

  const HistoryDetail(
      {super.key,
      required this.data,
      required this.handleDelete,
      required this.handleClick});

  @override
  State<StatefulWidget> createState() {
    return _StateHistoryDetail();
  }
}

class _StateHistoryDetail extends State<HistoryDetail> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onLongPress: () {},
        onTap: () {
          widget.handleClick();
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.0, color: Colors.grey),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order no: ${widget.data.index}",
                  ),
                  Text("Add whipped cream?: ${widget.data.cream}"),
                  Text("Add Chocolate: ${widget.data.chocolate}"),
                  Text("Quantity: ${widget.data.quantity}"),
                  Text("Price: ${widget.data.price}"),
                  Text("Status: ${widget.data.status}"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          widget.handleDelete();
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.blue,
                          size: 30.0,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          widget.handleClick();
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.blue,
                          size: 30.0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
