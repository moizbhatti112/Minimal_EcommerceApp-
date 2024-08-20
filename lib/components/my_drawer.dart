import 'package:ecom_app/components/mytile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          DrawerHeader(
              child: Icon(
            Icons.shopping_bag,
            size: 70.sp,
            color: Theme.of(context).colorScheme.inversePrimary,
          )),
          MyTile(
              icon: Icons.home,
              title: 'Home',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home');

              }),
          MyTile(
              icon: Icons.shopping_cart, title: 'Shopping Cart', onTap: () {  Navigator.pop(context);
                Navigator.pushNamed(context, '/cart');
                }),
        ],
      ),
    );
  }
}
