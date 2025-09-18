import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/providers.dart';

class BuyPage3 extends StatefulWidget {
  const BuyPage3({super.key});

  @override
  State<BuyPage3> createState() => _BuyPage3State();
}

class _BuyPage3State extends State<BuyPage3> {
  int? selectedSize;
  double currentPrice = 0.0;

  Map<int, double>sizePriceMap = {
    6:13000.0,
    7:14000.0,
    8:15000.0,
    9:16000.0,
    10:17000.0,
    11:18000.0,
    12:19000.0
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context, '/');
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      right: 10,
                      top: 20,
                      bottom: 20,
                    ),
                    child: Consumer(
                      builder: (BuildContext context, WidgetRef ref, Widget? child) {
                        final textFieldLabel = ref.watch(textFieldLabelProvider);
                        return TextField(
                          decoration: InputDecoration(
                            labelText: textFieldLabel,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            prefixIcon: Icon(Icons.search),
                          ),
                        );
                      }
                    ),
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 420,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        viewportFraction: 0.95,
                      ),
                      items:
                          [
                            'assets/images/img3.jpg',
                            'assets/images/img3.jpg',
                            'assets/images/img3.jpg',
                          ].map((imagePath) {
                            return Builder(
                              builder: (context) => Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.grey[200],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    imagePath,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25, right: 220),
                      child: Text(
                        'Nike Air Max 270',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 39.0, top: 4),
                      child: Text(
                        'Nike air max 270 casual shoes for men(Black, 10)',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, right: 306),
                      child: Text(
                        selectedSize != null
                        ? '₹${currentPrice.toStringAsFixed(0)}'
                        : '₹13995',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 236),
                      child: Text(
                        'or EMI from ₹686/month',
                        style: TextStyle(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 290, top: 25),
                      child: Text(
                        'Size - India',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            SizedBox(width: 30),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedSize = 6;
                                  currentPrice = sizePriceMap[6]!;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(170, 0, 0, 0),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text('6'),
                            ),
                            SizedBox(width: 15),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedSize = 7;
                                  currentPrice = sizePriceMap[7]!;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(170, 0, 0, 0),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text('7'),
                            ),
                            SizedBox(width: 15),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedSize = 8;
                                  currentPrice = sizePriceMap[8]!;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(170, 0, 0, 0),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text('8'),
                            ),
                            SizedBox(width: 15),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedSize = 9;
                                  currentPrice = sizePriceMap[9]!;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(170, 0, 0, 0),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text('9'),
                            ),
                            SizedBox(width: 15),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedSize = 10;
                                  currentPrice = sizePriceMap[10]!;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(170, 0, 0, 0),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text('10'),
                            ),
                            SizedBox(width: 15),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedSize = 11;
                                  currentPrice = sizePriceMap[11]!;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(170, 0, 0, 0),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),  
                              child: Text('11'),
                            ),
                            SizedBox(width: 15),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedSize = 12;
                                  currentPrice = sizePriceMap[12]!;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(170, 0, 0, 0),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text('12'),
                            ),
                            SizedBox(width: 15),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 170),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text(
                              'Delivery by 30 Jun, Monday',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, right: 50),
                            child: Text(
                              '10 days return policy',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, right: 15),
                            child: Text(
                              'Cash on delivery available',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 100,
                    padding: EdgeInsets.all(18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  child: Icon(Icons.add_shopping_cart),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 100,
                      padding: EdgeInsets.all(18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {},
                    child: Text('Pay with EMI'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 100,
                      padding: EdgeInsets.all(18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: const Color.fromARGB(208, 0, 0, 0),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: Text('Buy Now'),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
