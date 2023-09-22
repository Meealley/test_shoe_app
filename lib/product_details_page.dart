import 'package:flutter/material.dart';
import 'package:min_shop/cart_provider.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int selectSize = 0;

  void onTap() {
    if (selectSize != 0) {
      Provider.of<CartProvider>(context, listen: false).addProduct({
        "id": widget.product['id'],
        'title': widget.product['title'],
        'price': widget.product['price'],
        'size': selectSize,
        'imageUrl': widget.product['imageUrl'],
        "company": widget.product['company'],
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Product added successfully"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select a size"),
        ),
      );
    }
    // print("Add to cart clicked");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['imageUrl'] as String),
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$${widget.product['price']}',
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 17),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.product['sizes'] as List<int>).length,
                      itemBuilder: (context, index) {
                        final size =
                            (widget.product['sizes'] as List<int>)[index];
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectSize = size;
                              });
                              // print("Tappout");
                            },
                            child: Chip(
                              label: Text(
                                size.toString(),
                              ),
                              backgroundColor: selectSize == size
                                  ? const Color.fromRGBO(250, 220, 12, 1)
                                  : null,
                            ),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                      onPressed: onTap,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber[300],
                          foregroundColor: Colors.black,
                          minimumSize: const Size(double.infinity, 50)),
                      child: const Text(
                        "Add to Cart ",
                        style: TextStyle(fontSize: 20),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
