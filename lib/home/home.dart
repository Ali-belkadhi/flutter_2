import 'package:flutter/material.dart';
import 'package:workshop_4sim2_2526/home/product_details.dart';

import '../models/product.dart';


class Home extends StatelessWidget {
  Home({super.key});

  final _products = const <Product>[
    Product(
      title: 'Devil May Cry 5',
      image: 'assets/images/dmc5.jpg',
      price: 200,
      description:
      'Jeu d’action nerveux. Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
          'Ut enim ad minim veniam, quis nostrud exercitation.',
    ),
    Product(
      title: 'FIFA 22',
      image: 'assets/images/fifa.jpg',
      price: 100,
      description:
      'Football ultime. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    ),
    Product(
      title: 'Resident Evil Village',
      image: 'assets/images/minecraft.jpg',
      price: 200,
      description:
      'Survival horror. Duis aute irure dolor in reprehenderit in voluptate.',
    ),
    Product(
      title: 'RDR 2',
      image: 'assets/images/nfs.jpg',
      price: 150,
      description:
      'Western épique. Excepteur sint occaecat cupidatat non proident.',
    ),
    Product(
      title: 'Need For Speed Heat',
      image: 'assets/images/rdr2.jpg',
      price: 100,
      description:
      'Course urbaine. Itaque earum rerum hic tenetur a sapiente delectus.',
    ),
    Product(
      title: 'Need For Speed Heat',
      image: 'assets/images/re8.jpg',
      price: 100,
      description:
      'Course urbaine. Itaque earum rerum hic tenetur a sapiente delectus.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('G-STORE ESPRIT')),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: _products.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final p = _products[index];
          return InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailsPage(product: p),
                ),
              );
            },
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    child: Image.asset(
                      p.image,
                      width: 150,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ListTile(
                      title: Text(p.title),
                      subtitle: Text('${p.price} TND'),
                      trailing: const Icon(Icons.chevron_right),
                    ),
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
