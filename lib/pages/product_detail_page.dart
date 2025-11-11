import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/product.dart';

// ✅ Formato COP global
final NumberFormat formatoCOP = NumberFormat.currency(
  locale: "es_CO",
  symbol: "\$",
  decimalDigits: 0,
);

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  // ✅ Detecta si es URL o asset y maneja errores
  Widget buildProductImage(String image) {
    final esURL = image.startsWith("http");

    return esURL
        ? Image.network(
      image,
      width: 200,
      height: 200,
      fit: BoxFit.contain,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const SizedBox(
          width: 200,
          height: 200,
          child: Center(child: CircularProgressIndicator()),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.broken_image,
            size: 100, color: Colors.red);
      },
    )
        : Image.asset(
      image,
      width: 200,
      height: 200,
      fit: BoxFit.contain,
      errorBuilder: (_, __, ___) =>
      const Icon(Icons.broken_image, size: 100, color: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.nombre),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ✅ Imagen segura
              Center(child: buildProductImage(product.imagen)),

              const SizedBox(height: 20),

              // ✅ Nombre
              Text(
                product.nombre,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // ✅ Precio formateado
              Text(
                "Precio: ${formatoCOP.format(product.precio)}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),

              const SizedBox(height: 20),

              // ✅ Descripción
              Text(
                product.descripcion,
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 20),

              // ✅ Categoría
              Text(
                "Categoría: ${product.categoria}",
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 10),

              // ✅ Stock
              Text(
                "Stock disponible: ${product.stock}",
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 30),

              // ✅ Botón agregar al carrito
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_outlined),
                  label: const Text("Agregar al carrito"),
                  style: ElevatedButton.styleFrom(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
