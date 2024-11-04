import 'package:flutter/material.dart';

class CoffeeTiles extends StatelessWidget {
  const CoffeeTiles(
      {super.key,
      required this.coffeeImagePath,
      required this.coffeeName,
      required this.coffeePrice});

  final String coffeeImagePath;
  final String coffeeName;
  final double coffeePrice;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(12)),
          width: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  coffeeImagePath,
                  width: 250,
                  height: 350,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coffeeName,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'With Almond Milk',
                      style: TextStyle(color: Colors.grey[700], fontSize: 16),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$ ' + coffeePrice.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.add),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
