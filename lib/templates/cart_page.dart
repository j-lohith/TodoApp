import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_mart_app/templates/data/data_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<DataProvider>(context).cart;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Delete Product"),
                      content: const Text(
                          "Are you sure you want to remove the product from you cart?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Provider.of<DataProvider>(context, listen: false)
                                .deleteCardDetails(cartItem);
                            Navigator.pop(context);
                          },
                          child: const Text( 
                            "Yes",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            return Navigator.pop(context);
                          },
                          child: const Text(
                            "No",
                            style: TextStyle(color: Colors.blue),
                          ),
                        )
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            leading: CircleAvatar(
              backgroundImage: AssetImage("${cartItem["img_url"]}"),
              backgroundColor: Colors.transparent,
              radius: 30,
            ),
            title: Text("${cartItem["title"]}",
                style: const TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text("${cartItem["sizes"]}"),
          );
        },
      ),
    );
  }
}
