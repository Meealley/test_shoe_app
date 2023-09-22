import 'package:flutter/material.dart';
import 'package:min_shop/global_variable.dart';
import 'package:min_shop/product_card.dart';
import 'package:min_shop/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const [
    'All',
    "Addidas",
    "Nike",
    "Balenciaga",
    "Louis Vuitton"
  ];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(),
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    );

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  "Shoes 👟\nCollection",
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
                SizedBox(width: 18),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Chip(
                        backgroundColor: selectedFilter == filter
                            ? const Color.fromRGBO(250, 220, 12, 1)
                            : const Color.fromRGBO(230, 247, 249, 1),
                        label: Text(
                          filter,
                          style: const TextStyle(fontSize: 17),
                        ),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ProductDetails(product: product);
                          },
                        ),
                      );
                    },
                    child: ProductCard(
                      title: product['title'] as String,
                      price: product['price'] as double,
                      image: product['imageUrl'] as String,
                      backgroundColor: index.isEven
                          ? const Color.fromRGBO(148, 194, 220, 1)
                          : const Color.fromRGBO(195, 208, 215, 1),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
