import 'package:coffee_app_ui/utils/coffee_tiles.dart';
import 'package:coffee_app_ui/utils/coffee_type.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List coffeeType = [
    ['Cappucino', true],
    ['Latte', false],
    ['Black', false],
    ['Tea', false],
  ];

  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
            ),
            label: '',
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'FIND THE BEST COFFEE FOR YOU',
              style: TextStyle(
                color: Colors.white,
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black26,
                prefixIcon: const Icon(Icons.search),
                hintText: 'Find the Coffee',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: (context, index) {
                return CoffeeType(
                    coffeeType: coffeeType[index][0],
                    isSelected: coffeeType[index][1],
                    onTap: () {
                      coffeeTypeSelected(index);
                    });
              },
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CoffeeTiles(
                  coffeeImagePath: 'assets/images/cappucino.jpg',
                  coffeeName: 'Cappucino',
                  coffeePrice: 4.20,
                ),
                CoffeeTiles(
                  coffeeImagePath: 'assets/images/latte.jpeg',
                  coffeeName: 'Latte',
                  coffeePrice: 4.00,
                ),
                CoffeeTiles(
                  coffeeImagePath: 'assets/images/black.jpg',
                  coffeeName: 'Black',
                  coffeePrice: 4.99,
                ),
                CoffeeTiles(
                  coffeeImagePath: 'assets/images/tea.jpg',
                  coffeeName: 'Tea',
                  coffeePrice: 3.20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
