import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import '../repository/product_repository.dart';
import '../services/api_service.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onToggleTheme;

  const HomePage({super.key, required this.onToggleTheme});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductRepository _repo = ProductRepository(ApiService());

  bool cargando = true;
  String? error;
  List<Product> productos = [];

  @override
  void initState() {
    super.initState();
    _cargarProductos();
  }

  Future<void> _cargarProductos() async {
    try {
      final lista = await _repo.getProducts();
      setState(() {
        productos = lista;
        cargando = false;
      });
    } catch (e) {
      setState(() {
        error = "Error al cargar productos: $e";
        cargando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tienda EANX"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: widget.onToggleTheme,
          ),
        ],
      ),

      body: cargando
          ? const Center(child: CircularProgressIndicator())

          : error != null
          ? Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(error!, textAlign: TextAlign.center),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  cargando = true;
                  error = null;
                });
                _cargarProductos();
              },
              child: const Text("Reintentar"),
            ),
          ],
        ),
      )

          : ListView.builder(
        itemCount: productos.length,
        itemBuilder: (_, index) {
          return ProductCard(product: productos[index]);
        },
      ),
    );
  }
}
