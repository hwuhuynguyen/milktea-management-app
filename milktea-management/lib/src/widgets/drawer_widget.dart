import 'package:flutter/material.dart';
import 'package:ltdidong2/src/data/user_service.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserService().user != null
              ? DrawerHeader(
                  padding: EdgeInsets.zero,
                  child: UserAccountsDrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.red,
                    ),
                    accountName: Text(
                      UserService().user!.name.toString(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    accountEmail: Text(
                      UserService().user!.email.toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: Image.network(
                              "https://kynguyenlamdep.com/wp-content/uploads/2022/06/anh-gai-xinh-cuc-dep.jpg")
                          .image,
                    ),
                  ))
              : ListTile(
                  leading: const Icon(
                    Icons.login,
                    color: Colors.red,
                  ),
                  onTap: () {
                    // Scaffold.of(context).closeDrawer();
                    Navigator.pushNamed(context, '/login');
                  },
                  title: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: Colors.red,
            ),
            onTap: () {
              // Scaffold.of(context).closeDrawer();
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
            title: const Text(
              "Home",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // UserService().user != null
          //     ? const ListTile(
          //         leading: Icon(
          //           Icons.account_box,
          //           color: Colors.red,
          //         ),
          //         title: Text(
          //           "My Account",
          //           style: TextStyle(
          //             fontSize: 18,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //       )
          //     : Container(),
          UserService().user != null
              ? ListTile(
                  leading: const Icon(
                    Icons.shopping_cart,
                    color: Colors.red,
                  ),
                  title: const Text(
                    "Orders List",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    // Scaffold.of(context).closeDrawer();
                    Navigator.pushNamed(context, '/orders');
                  },
                )
              : ListTile(
                  leading: const Icon(
                    Icons.shopping_cart,
                    color: Colors.red,
                  ),
                  title: const Text(
                    "My Orders",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    // Scaffold.of(context).closeDrawer();
                    Navigator.pushNamed(context, '/cart');
                  },
                ),
          UserService().user != null
              ? ListTile(
                  leading: const Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                  ),
                  title: const Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    UserService().user = null;
                    // Scaffold.of(context).closeDrawer();
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                )
              : Container(),
        ],
      ),
    );
  }
}
