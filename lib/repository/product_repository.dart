import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/product.dart';
import '../services/api_service.dart';

class ProductRepository {
  final ApiService api;

  ProductRepository(this.api);

  Future<List<Product>> getProducts() async {
    try {
      final data = await api.getProducts();
      return data.map((p) => Product.fromJson(p)).toList();
    } catch (_) {
      // ✅ Fallback al JSON local
      final response = await rootBundle.loadString('assets/data/productos.json');
      final List<dynamic> dataLocal = json.decode(response);
      return dataLocal.map((p) => Product.fromJson(p)).toList();
    }
  }
}
