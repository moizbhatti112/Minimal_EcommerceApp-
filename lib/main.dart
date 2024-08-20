import 'package:ecom_app/models/shop.dart';
import 'package:ecom_app/pages/cart.dart';
import 'package:ecom_app/pages/home.dart';
import 'package:ecom_app/pages/intro_page.dart';
import 'package:ecom_app/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main()
{
  runApp(
    ChangeNotifierProvider(create: (context) =>  Shop(),
  child: const MyApp(),)
  );

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   
  @override
  Widget build(BuildContext context) {
  //      var wid = MediaQuery.of(context).size.width;
  // var hei = MediaQuery.of(context).size.height;

//   print('Screen width: $wid');
// print('Screen height: $hei');
    return ScreenUtilInit(
      designSize:   const Size(356,600),
      minTextAdapt: true,
      // useInheritedMediaQuery: true,
      ensureScreenSize: true,
      splitScreenMode: true,
      builder: (context, child) =>
      
       MaterialApp(
        debugShowCheckedModeBanner: false,
              home: const IntroPage(),
             theme: lightmode,
           
             routes: {
               '/intro': (context) => const IntroPage(),
                '/home': (context) => const HomePage(), 
                '/cart':(context)=>const MyCart()
                // intro page
             },
             
      ),
    );
    
  }
}