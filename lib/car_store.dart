import 'package:flutter/material.dart';

class CarStore extends StatelessWidget {
  const CarStore({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Features(),
    );
  }
}

class Features extends StatelessWidget {
  const Features({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.menu),
              Text(
                'Car Store',
                style: TextStyle(fontSize: 20, color: Colors.orange),
              ),
              Icon(
                Icons.notification_important_rounded,
                color: Color.fromARGB(255, 236, 10, 10),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: const Icon(Icons.tune),
                    hintText: 'Enter search data',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const SizedBox(
            height: 200,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ImageCard(
                      imageUrl: 'https://i.postimg.cc/KYQ0X1M3/stroller.jpg'),
                  SizedBox(width: 10),
                  ImageCard(
                      imageUrl: 'https://i.postimg.cc/KYQ0X1M3/stroller.jpg'),
                  SizedBox(width: 10),
                  ImageCard(
                      imageUrl: 'https://i.postimg.cc/KYQ0X1M3/stroller.jpg'),
                  SizedBox(width: 10),
                  ImageCard(
                      imageUrl: 'https://i.postimg.cc/KYQ0X1M3/stroller.jpg'),
                  SizedBox(width: 10),
                  ImageCard(
                      imageUrl: 'https://i.postimg.cc/KYQ0X1M3/stroller.jpg'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final String imageUrl;

  const ImageCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Container(
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: const BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: const Text(
                'Featured',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
