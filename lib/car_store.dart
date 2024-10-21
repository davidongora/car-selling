import 'package:carselling/sell_car.dart';
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu),
                  Text(
                    'Car Store',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.notification_important_rounded,
                    color: Color.fromARGB(255, 14, 13, 13),
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
                            borderSide: const BorderSide(color: Colors.orange)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.orange,
                            )),
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
              // const Checkbox(value: true), onChanged: onChanged),
              const SizedBox(
                height: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ImageCard(
                          carPlate: 'kba1',
                          imageUrl:
                              'https://i.postimg.cc/KYQ0X1M3/stroller.jpg'),
                      SizedBox(width: 2),
                      ImageCard(
                          carPlate: 'kba8',
                          imageUrl:
                              'https://i.postimg.cc/KYQ0X1M3/stroller.jpg'),
                      SizedBox(width: 2),
                      ImageCard(
                          carPlate: 'kba2',
                          imageUrl:
                              'https://i.postimg.cc/KYQ0X1M3/stroller.jpg'),
                      SizedBox(width: 2),
                      ImageCard(
                          carPlate: 'kba3',
                          imageUrl:
                              'https://i.postimg.cc/KYQ0X1M3/stroller.jpg'),
                      SizedBox(width: 2),
                      ImageCard(
                          carPlate: 'kba4',
                          imageUrl:
                              'https://i.postimg.cc/KYQ0X1M3/stroller.jpg'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Row(children: [
                Text('Recommended',
                    style: TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.bold)),
                Spacer(),
                Text(
                  'See all',
                  style: TextStyle(color: Colors.grey),
                )
              ]),
              const SizedBox(height: 10),
              const SizedBox(
                height: 300,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          FavoriteCard1(
                              imageUrl:
                                  'https://i.postimg.cc/KYQ0X1M3/stroller.jpg'),
                          SizedBox(height: 10),
                          FavoriteCard(
                              imageUrl:
                                  'https://i.postimg.cc/KYQ0X1M3/stroller.jpg'),
                          SizedBox(height: 10),
                        ],
                      ),
                      Row(
                        children: [
                          FavoriteCard(
                              imageUrl:
                                  'https://i.postimg.cc/KYQ0X1M3/stroller.jpg'),
                          SizedBox(height: 10),
                          FavoriteCard1(
                              imageUrl:
                                  'https://i.postimg.cc/KYQ0X1M3/stroller.jpg'),
                          SizedBox(height: 10),
                        ],
                      ),
                      Row(
                        children: [
                          ImageCard(
                              carPlate: 'kba5',
                              imageUrl:
                                  'https://i.postimg.cc/KYQ0X1M3/stroller.jpg'),
                          SizedBox(height: 10),
                          ImageCard(
                              carPlate: 'kba6',
                              imageUrl:
                                  'https://i.postimg.cc/KYQ0X1M3/stroller.jpg'),
                          SizedBox(height: 10),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class ImageCard extends StatelessWidget {
  final String imageUrl;
  final String carPlate;
  final String price = '1';

  const ImageCard(
      {super.key, required this.imageUrl, required this.carPlate, price});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Car Details'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(imageUrl, height: 150),
                  const SizedBox(height: 10),
                  const Text('This is a high-quality car.'),
                  const SizedBox(height: 20),
                  const Text('Select Price Range'),
                  Text(
                    price,
                    style: TextStyle(
                        color: Colors.blue.shade900,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    carPlate,
                    style: TextStyle(
                        color: Colors.blue[600], fontWeight: FontWeight.bold),
                  ),
                  Slider(
                      value: 10,
                      min: 1,
                      max: 5000,
                      divisions: 10,
                      label: 'price',
                      onChanged: (double value) {})
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SellCar()),
                    );
                  },
                  child: const Text('Buy'),
                ),
              ],
            );
          },
        );
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Container(
              width: 150,
              height: 200,
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
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final String imageUrl;

  const FavoriteCard({super.key, required this.imageUrl});

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
            height: 200,
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
            right: 10,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
                child: const Icon(Icons.favorite_border_outlined)),
          ),
          //   ),
          // ),
          const SizedBox(
            width: 20,
          ),
          // Positioned(
          //   top: 10,
          //   left: 10,
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          //     decoration: const BoxDecoration(
          //       // color: Colors.orange,
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(15),
          //         bottomRight: Radius.circular(15),
          //       ),
          //     ),
          //     child: const Text(
          //       '360 View',
          //       style: TextStyle(
          //         color: Colors.orange,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class FavoriteCard1 extends StatelessWidget {
  final String imageUrl;

  const FavoriteCard1({super.key, required this.imageUrl});

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
            height: 200,
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
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              child: const Icon(
                Icons.favorite,
                color: Colors.orange,
              ),
            ),
          ),
          //   ),
          // ),
          const SizedBox(
            width: 20,
          ),
          // Positioned(
          //   top: 10,
          //   left: 10,
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          //     decoration: const BoxDecoration(
          //       // color: Colors.orange,
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(15),
          //         bottomRight: Radius.circular(15),
          //       ),
          //     ),
          //     child: const Text(
          //       '360 View',
          //       style: TextStyle(
          //         color: Colors.orange,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
