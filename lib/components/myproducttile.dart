// import 'package:ecom_app/components/my_button.dart';
import 'package:ecom_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ecom_app/models/shop.dart';

class MyProductTile extends StatefulWidget {
  final Product product;
  const MyProductTile({
    super.key,
    required this.product,
  });

  @override
  State<MyProductTile> createState() => _MyProductTileState();
}

class _MyProductTileState extends State<MyProductTile> {
  void addToCart(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text("Do you want to add this item to the cart"),
              actions: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<Shop>().addToCart(widget.product);
                    Navigator.pushNamed(context, '/cart');
                  },
                  child: const Text('Yes'),
                ),
              ],
            )
          
            
            );
  }

  @override
  Widget build(BuildContext context) {
    //    var wid = MediaQuery.of(context).size.width;
    // var hei = MediaQuery.of(context).size.height;
    // ignore: avoid_unnecessary_containers
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(20.sp),
      padding: EdgeInsets.all(20.sp),
      width: 300.w,
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Product Image
          AspectRatio(
            aspectRatio: 1,
            child: Container(
                color: Theme.of(context).colorScheme.secondary,
                width: double.infinity,
                child: Image.asset(widget.product.imagepath)
                ),
          ),
          // 18.verticalSpace,
          //Product Name
          Text(
              widget.product.name,
              style:  TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
 

          //Product Description
          Text(widget.product.description,style: TextStyle(fontSize: 11.sp),),
          //Product Price + Description
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$${widget.product.price.toStringAsFixed(2)}'),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(15)),
                  child: IconButton(
                    onPressed: () {
                      addToCart(context);
                      
                    },
                    icon: const Icon(Icons.add),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
