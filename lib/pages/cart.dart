import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecom_app/models/shop.dart';
import 'package:ecom_app/models/product.dart';
// import 'package:ecom_app/pages/home.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});
  
  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content:
                  const Text("Do you want to remove this item from the cart"),
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
                    context.read<Shop>().removeFromCart(product);
                    Navigator.pushNamed(context, '/cart');
                  },
                  child: const Text('Yes'),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Center(
            child: Text(
          'Cart Page',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary),
        )),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final item = cart[index];
              return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.price.toStringAsFixed(2)),
                  trailing: IconButton(
                    onPressed: () => removeItemFromCart(context,item),
                    icon: const Icon(Icons.remove),
                  ));
            },
          ))
        ],
      ),
    );
  }
}
