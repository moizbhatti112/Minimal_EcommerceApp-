import 'package:ecom_app/components/my_button.dart';
import 'package:ecom_app/components/my_drawer.dart';
import 'package:ecom_app/components/myproducttile.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:ecom_app/themes/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecom_app/models/shop.dart';
// import 'package:ecom_app/models/product.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    
    final products = context.watch<Shop>().shop;
    // var wid = MediaQuery.of(context).size.width;
    // var hei = MediaQuery.of(context).size.height;

//     print('Screen width: $wid');
//  print('Screen height: $hei');
    return ScreenUtilInit(
      designSize:    const Size(356, 850),
      minTextAdapt: true,
      // useInheritedMediaQuery: true,
      ensureScreenSize: true,
      splitScreenMode: true,
      builder: (context, child) => SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.surface,
            actions: [
              Padding(
                  padding: EdgeInsets.only(right: 10.sp),
                  child: MyButton(
                      onTap: () {},
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.black87,
                      )))
            ],
          ),
          drawer: const MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 17.sp),
                child: Text('Shop',
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    )),
              ),
              8.verticalSpace,
              Padding(
                padding: EdgeInsets.only(left: 17.sp),
                child: Text('Pick from A Selected List of Premium Products',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    )),
              ),
              // 20.verticalSpace,
              Flexible(
                child: SizedBox(
                  height: 550.h,
                  child: ListView.builder(
                    itemCount: products.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return MyProductTile(product: product);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
