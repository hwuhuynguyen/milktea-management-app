import 'package:flutter/material.dart';
import 'package:ltdidong2/src/data/models/cart.dart';
import 'package:ltdidong2/src/utlis/format.dart';

class OrderItem extends StatefulWidget {
  final Cart cart;
  final void Function() onPlus;
  final bool? disable;
  final void Function() onDecrease;

  const OrderItem(
      {Key? key,
      required this.cart,
      this.disable,
      required this.onPlus,
      required this.onDecrease})
      : super(key: key);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
        child: Row(
          children: [
            Container(
                alignment: Alignment.center,
                child: Image.network(
                  widget.cart.product!.image!,
                  height: 80,
                  width: 140,
                )),
            Container(
              width: 190,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.cart.product!.name!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    widget.cart.product!.description!,
                    style: const TextStyle(fontSize: 14),
                  ),
                  Text(
                    "\$ ${FormatValidator().formatPrice(widget.cart.product!.price!.toString())}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.red),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 12),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.disable == null
                          ? GestureDetector(
                              onTap: () {
                                widget.onPlus();
                              },
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            )
                          : Container(),
                      Text(
                        "${widget.cart.number}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      widget.disable == null
                          ? GestureDetector(
                              onTap: () {
                                widget.onDecrease();
                              },
                              child: const Icon(
                                Icons.minimize,
                                color: Colors.white,
                              ))
                          : Container(),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
