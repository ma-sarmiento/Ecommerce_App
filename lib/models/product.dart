class Product {
  final int id;
  final String nombre;
  final String descripcion;
  final double precio;
  final String imagen;
  final String categoria;
  final int stock;

  Product({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.imagen,
    required this.categoria,
    required this.stock,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"] ?? 0,
      nombre: json["title"] ?? json["nombre"] ?? "Sin nombre",
      descripcion: json["description"] ?? json["descripcion"] ?? "Sin descripción",
      precio: (json["price"] ?? json["precio"]).toDouble(),
      imagen: json["image"] ?? json["imagen"],
      categoria: json["category"] ?? json["categoria"] ?? "General",
      stock: json["stock"] ?? 10, // Simulado para API
    );
  }
}
