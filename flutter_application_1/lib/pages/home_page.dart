import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage1(),
    );
  }
}

class HomePage1 extends StatelessWidget {
  final List<Map<String, String>> products = [
    {"name": "Casual shoes", "image": "assets/aero1.jpg", "description": "AERO STREET SEPATU PRIA 37-44 CLASSIC PUTIH HITAM SNEAKERS"},
    {"name": "Formal Shoes", "image": "assets/formal.jpg", "description": "PAULMAY – Sepatu Formal Pria"},
    {"name": "Sport Shoes", "image": "assets/sport.jpg", "description": "SEPATU RUNNING ORTUSEIGHT HYPERGLIDE 2.0 - WHITE"},
    {"name": "Sling Bag", "image": "assets/slempang.jpg", "description": "CONSINA BLED TAS SELEMPANG"},
    {"name": "Long T-Shirt", "image": "assets/Lshirt.jpg", "description": "The Dove Collection Short Sleeve T-Shirt"},
    {"name": "Short T-Shirt", "image": "assets/Stshirt.jpg", "description": "The Dove Collection Short Sleeve T-Shirt"},
  ];

  HomePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Catalogs"),
        backgroundColor: Color(0xFFFFDAB9),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _showProductDetails(context, products[index]);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: Image.asset(
                          products[index]["image"]!,  
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        products[index]["name"]!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // Deskripsi Produk
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        products[index]["description"]!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showProductDetails(BuildContext context, Map<String, String> product) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(product["name"]!),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(product["image"]!, height: 200, fit: BoxFit.cover),
              const SizedBox(height: 10),
              Text(product["description"]!),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
