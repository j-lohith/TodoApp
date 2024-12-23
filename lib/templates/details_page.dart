import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_mart_app/templates/data/data_provider.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.productDetails});

  final Map<String, dynamic> productDetails;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int selectedSize = 0;

  void onTap() {
    if (selectedSize != 0) {
      Provider.of<DataProvider>(context, listen: false).addCartDetails(
        {
          "id": widget.productDetails['id'],
          "title": widget.productDetails['title'],
          'price': widget.productDetails['price'],
          "img_url": widget.productDetails['img_url'],
          "company": widget.productDetails['company'],
          "sizes": selectedSize,
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Successfully added"),
          duration: Duration(milliseconds: 700),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select a size"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Details",
          style: TextStyle(fontSize: 28),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              widget.productDetails['title'],
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 250,
              color: Colors.transparent,
              child: Image.asset(widget.productDetails['img_url']),
            ),
          ),
          const Spacer(),
          Text(
            "\$${widget.productDetails['price']}",
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.productDetails['sizes'].length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSize = widget.productDetails['sizes'][index];
                        });
                      },
                      child: Chip(
                        backgroundColor: selectedSize ==
                                widget.productDetails['sizes'][index]
                            ? const Color.fromARGB(255, 237, 206, 32)
                            : const Color.fromARGB(255, 220, 222, 224),
                        label: Text(
                          "${widget.productDetails['sizes'][index]}",
                          style: const TextStyle(fontSize: 15),
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        side: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.amber)),
              onPressed: onTap,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart),
                  SizedBox(
                    width: 8,
                  ),
                  Text("Add to Cart"),
                ],
              ),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
