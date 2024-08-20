import 'package:ecom_app/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    // var _width = MediaQuery.of(context).size.width;
    // ignore: no_leading_underscores_for_local_identifiers
    // var _height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      ensureScreenSize: true,
      splitScreenMode:true,
      designSize: const Size(356, 800),
      builder: (context, child) =>  Scaffold(
        // ignore: deprecated_member_use
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_bag,
                color: Theme.of(context).colorScheme.inversePrimary,
                size: 100.dg,
              ),
              20.verticalSpace,
              Text(
                'Minimal Shop',
                style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w900),
              ),
              Text(
                'Premium Quality Products',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              20.verticalSpace,
              MyButton(
                  onTap: () => Navigator.pushNamed(context,'/home'),
                  child: const Icon(Icons.forward))
            ],
          ),
        ),
      ),
    );
  }
}
