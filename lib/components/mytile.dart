import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? onTap;

  const MyTile({super.key, 
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 70.sp),
      child: ListTile(
        leading: Icon(icon,color:Theme.of(context).colorScheme.inversePrimary),
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}
