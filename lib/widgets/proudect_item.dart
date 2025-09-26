
import 'package:flutter/material.dart';
import '../Model/category_list.dart';

class ProductItem extends StatelessWidget {
  final ProductCard product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      margin: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
              product.image,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  product.slug,
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
                SizedBox(height: 12),
                Text(
                  "\$${product.price}",
                  style: TextStyle(fontSize: 19, color: Colors.blue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}