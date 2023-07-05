import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../domain/entities/products_entity.dart';

Widget buildProductWidget(Products product) {
  return Container(
    margin: const EdgeInsets.all(8), // Specify the desired height
    decoration: BoxDecoration(
      border: Border.all(
        color: const Color(0xFF004182),
        width: 1,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Stack(
      alignment: Alignment.topRight,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  product
                      .thumbnail!, // Replace product.imageUrl with the actual URL of the image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.title!, // Placeholder for the product title
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: Text(
                    'EGP${product.price}', // Placeholder for the product cost
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Text(
                    'EGP${(product.price! * 1.2).toString().substring(0, 4)}', // Placeholder for the product cost
                    style: const TextStyle(
                      color: Color(0x99004182),
                      fontSize: 14,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                const SizedBox(width: 4),
                Text(
                  'Review(${product.rating})', // Placeholder for product review count
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      color: const Color(0xFF06004F)),
                ),
                const Icon(
                  Icons.star, // Placeholder for product review
                  color: Colors.yellow,
                  size: 18,
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(right: 5.0),
                  child: Image(
                      image: AssetImage('assets/images/plus_circle.png'),
                      width: 20,
                      height: 20),
                ),
              ],
            ),
          ],
        ),
        const Image(
          image: AssetImage('assets/images/heart.png'),
          width: 50,
          height: 50,
        ),
      ],
    ),
  );
}
