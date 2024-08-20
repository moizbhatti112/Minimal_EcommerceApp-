import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;

const MyButton({
 super.key,
 required this.onTap,
 required this.child,
 });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.h),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
        ),
        child: child,  // Replace this with your desired button content
      ), // Replace this with your desired button content
    );
  }
}