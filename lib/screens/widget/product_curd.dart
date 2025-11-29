import 'package:api/model/productModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({super.key, required this.productMap});
  final ProductModel productMap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        width: 200,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
              ),
              child: Image.network(
                productMap.image.toString(),
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                children: [
                  Text(
                    productMap.title.toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    productMap.price.toString(),
                    style: TextStyle(fontSize: 18, color: Colors.green[700]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
