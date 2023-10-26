
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';
import 'package:shop_app/global_variables.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
 
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    // final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body:ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'] as String),
              radius: 30 ,
            ),
            trailing: IconButton(
              onPressed: () {
                   showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                      title: Text('Delete Product',
                      style: Theme.of(context).textTheme.titleMedium,
                      ),
                      content: Text('Are you sure you want to delete product from the Cart?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          }, 
                          child: Text('No',
                          style: TextStyle(
                            color: Colors.blue
                          ),)),
                          TextButton(
                          onPressed: () {
                            context.read<CartProvider>().removeProduct(cartItem);
                            //  Provider.of<CartProvider>(context,listen: false).removeProduct(cartItem);
                             Navigator.of(context).pop();
                          }, 
                          child: Text('Yes',
                          style: TextStyle(
                            color: Colors.red
                          )))
                      ],
                    );
                    }
                  );
              },
              icon: Icon(Icons.delete,
              color: Colors.red,
              )),
            title: Text(cartItem['title'] as String,
            style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text('Size: ${cartItem['size']}'),
          );
        },)
        );
  }
}