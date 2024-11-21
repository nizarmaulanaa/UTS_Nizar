import 'package:flutter/material.dart';

class ProductCategoryPage extends StatelessWidget {
  const ProductCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'title': 'Sepatu',
        'description': 'Kategori Sepatu yang ada di toko kami.',
        'products': [
          'Sneakers',
          'Sport',
          'Formal',
          'Casual',
        ],
      },
      {
        'title': 'Tas',
        'description': 'Kategori Tas yang ada di toko kami',
        'products': [
          'Sling bag',
          'Goody Bag',
          'Backpack',
          'Ransel',
        ],
      },
      {
        'title': 'T-Shirt',
        'description': 'Kategori T-shirt yang ada di toko Kami.',
        'products': [
          'Long T-Shirt',
          'Short T-Shirts',
          
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Categories'),
        backgroundColor: Color(0xFFFFDAB9),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category['title']!,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    category['description']!,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 3, 
                    ),
                    itemCount: category['products'].length,
                    itemBuilder: (context, productIndex) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFDAB9),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          category['products'][productIndex],
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProductCategoryPage(),
  ));
}
