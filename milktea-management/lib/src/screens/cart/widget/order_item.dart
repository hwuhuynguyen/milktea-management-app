import 'package:flutter/material.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({Key? key}) : super(key: key);

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
                  "https://img1.kienthucvui.vn/uploads/2020/08/26/anh-tra-sua-dep_024925777.jpg",
                  height: 80,
                  width: 140,
                )),
            Container(
              width: 190,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    "Trà sữa siêu ngon",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "Trà sữa siêu ngon",
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    "\$10",
                    style: TextStyle(
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
                    children: const [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      Text(
                        "2",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.minimize,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
