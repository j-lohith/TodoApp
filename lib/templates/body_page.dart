import 'package:flutter/material.dart';
import 'package:shoe_mart_app/templates/data/static_data.dart';
import 'package:shoe_mart_app/templates/details_page.dart';
import 'package:shoe_mart_app/templates/product_page.dart';

class BodyPage extends StatefulWidget {
  const BodyPage({super.key});

  @override
  State<BodyPage> createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  final List<String> filters = const [
    "All",
    "Addidas",
    "Nike",
    "Puma",
  ];
  late String selector;
  @override
  void initState() {
    super.initState();
    selector = filters[0];
  }

  final border = const OutlineInputBorder(
    borderRadius: BorderRadius.horizontal(
      left: Radius.circular(50),
    ),
    borderSide: BorderSide(
      color: Color.fromRGBO(54, 52, 52, 0.4),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Shoes\nCollection",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: 220,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: const Icon(Icons.search),
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 65,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selector = filter;
                      });
                    },
                    child: Chip(
                      backgroundColor: selector == filter
                          ? const Color.fromARGB(255, 225, 193, 7)
                          : const Color.fromARGB(255, 220, 222, 224),
                      label: Text(
                        filters[index],
                        style: const TextStyle(fontSize: 15),
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
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
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailsPage(
                            productDetails: products[index],
                          );
                        },
                      ),
                    );
                  },
                  child: ProductPage(
                      productname: products[index]["title"] as String,
                      productimage: products[index]["img_url"] as String,
                      productprice: products[index]["price"] as double),
                );
              },
            ),
          ),
        ],
      ),
    ),);
  }
}
