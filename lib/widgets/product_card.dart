import 'package:flutter/material.dart';
import '../models/product.dart';
import 'package:intl/intl.dart';
import '../pages/product_detail_page.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  // ✅ Detecta si es asset o URL
  Widget buildProductImage(String image) {
    final esURL = image.startsWith("http");

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: esURL
          ? Image.network(
        image,
        width: 90,
        height: 90,
        fit: BoxFit.cover,
      )
          : Image.asset(
        image,
        width: 90,
        height: 90,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailPage(product: product),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // ✅ Imagen corregida
              buildProductImage(product.imagen),

              const SizedBox(width: 16),

              // ✅ Info del producto
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.nombre,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),

                    Text(
                      product.descripcion,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey[700]),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      formatoCOP.format(product.precio),
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),

              // Botón carrito
              IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                color: Colors.blueAccent,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ✅ Formato COP global
final NumberFormat formatoCOP = NumberFormat.currency(
  locale: "es_CO",
  symbol: "\$",
  decimalDigits: 0,
);
