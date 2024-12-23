import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage(
      {super.key, this.productname, this.productimage, this.productprice});
  final String? productname;
  final String? productimage;
  final double? productprice;
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 220, 222, 224),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 13, left: 10),
              child: Text(widget.productname!,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                "\$${widget.productprice!}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            // Image(
            //   image: AssetImage(widget.productimage!),

            // ),

            Center(
              child: Image.asset(
                widget.productimage!,
                height: 175,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
