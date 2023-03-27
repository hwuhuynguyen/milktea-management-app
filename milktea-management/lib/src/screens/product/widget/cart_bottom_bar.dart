import 'package:flutter/material.dart';
import 'package:ltdidong2/src/utlis/format.dart';

class ProductBottomBar extends StatefulWidget {
  final int total;
  final void Function() onClick;

  const ProductBottomBar({Key? key, required this.onClick, required this.total})
      : super(key: key);

  @override
  _ProductBottomBarState createState() => _ProductBottomBarState();
}

class _ProductBottomBarState extends State<ProductBottomBar> {
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
                "${FormatValidator().formatPrice(widget.total.toString())}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.red),
              )
            ],
          ),
          ElevatedButton(
              onPressed: () {
                widget.onClick();
              },
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: const Text(
                "Đặt ngay",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ))
        ]),
      ),
    );
  }
}
