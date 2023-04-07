import 'package:flutter/material.dart';
import 'package:ltdidong2/src/utlis/format.dart';

class CartBottomBar extends StatefulWidget {
  final int total;
  final bool? disable;

  final void Function() onClick;

  const CartBottomBar(
      {Key? key, required this.onClick, this.disable, required this.total})
      : super(key: key);

  @override
  _CartBottomBarState createState() => _CartBottomBarState();
}

class _CartBottomBarState extends State<CartBottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 70,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              const Text(
                "Tổng cộng: ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                FormatValidator().formatPrice(widget.total.toString()),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.red),
              )
            ],
          ),
          widget.disable == null
              ? ElevatedButton(
                  onPressed: () {
                    if (widget.total > 0) {
                      widget.onClick();
                    }
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20)),
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  child: const Text(
                    "Đặt ngay",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ))
              : Container()
        ]),
      ),
    );
  }
}
