import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_app/buy_now.dart';
import 'package:my_app/buy_now2.dart';
import 'package:my_app/buy_now3.dart';
import 'package:my_app/buy_now4.dart';
import 'package:my_app/buy_now5.dart';
import 'package:my_app/buy_now6.dart';
import 'package:my_app/buy_now7.dart';
import 'package:my_app/providers.dart';
import 'package:my_app/cart_page.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => FirstPage(),
        '/buyPage': (context) => BuyPage(),
        '/buyPage2': (context) => BuyPage2(),
        '/buyPage3': (context) => BuyPage3(),
        '/buyPage4': (context) => BuyPage4(),
        '/buyPage5': (context) => BuyPage5(),
        '/buyPage6': (context) => BuyPage6(),
        '/buyPage7': (context) => BuyPage7(),
        '/cartPage': (context) => CartPage(),
      },
    );
  }
}

final List<Map<String, String>> shoeData = [
  {
    'title': 'Nike Air Max',
    'price': '₹4,999',
    'imagePath': 'assets/images/img1.jpg',
    'route': '/buyPage',
  },
  {
    'title': 'Nike Air Max 270',
    'price': '₹4,999',
    'imagePath': 'assets/images/img2.jpg',
    'route': '/buyPage2',
    'alignX': '0.0', // Optional alignment values
    'alignY': '0.4', // Optional alignment values
  },
  {
    'title': 'Nike Air Max',
    'price': '₹4,999',
    'imagePath': 'assets/images/img3.jpg',
    'route': '/buyPage3',
  },
  {
    'title': 'Nike Air Max',
    'price': '₹4,999',
    'imagePath': 'assets/images/img4.jpg',
    'route': '/buyPage4',
  },
  {
    'title': 'Nike Air Max',
    'price': '₹4,999',
    'imagePath': 'assets/images/img5.jpg',
    'route': '/buyPage5',
  },
  {
    'title': 'Nike Air Max',
    'price': '₹4,999',
    'imagePath': 'assets/images/img6.jpg',
    'route': '/buyPage6',
  },
  {
    'title': 'Nike Air Max 270',
    'price': '₹4,999',
    'imagePath': 'assets/images/img7.jpg',
    'route': '/buyPage7',
    'alignX': '0.0', // Optional alignment values
    'alignY': '0.6', // Optional alignment values
  },
];

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Dunk Deck',
                    style: GoogleFonts.lobster(
                      textStyle: TextStyle(
                        fontSize: 35,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Consumer(
                      builder:
                          (BuildContext context, WidgetRef ref, Widget? child) {
                            final textFieldLabel = ref.watch(
                              textFieldLabelProvider,
                            );
                            return TextField(
                              decoration: InputDecoration(
                                labelText: textFieldLabel,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                prefixIcon: Icon(Icons.search),
                              ),
                            );
                          },
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 450,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        aspectRatio: 16 / 9,
                      ),
                      items:
                          [
                            'assets/images/banner.png',
                            'assets/images/banner2.jpg',
                            'assets/images/img3.jpg',
                            'assets/images/img5.jpg',
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
                    SizedBox(height: 15),
                    ListView.builder(
                      shrinkWrap: true,                 
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: shoeData.length,
                      itemBuilder: (context, index){
                        final item = shoeData[index];

                        final double x = double.tryParse(item['alignX'] ?? '0.0') ?? 0.0;
                        final double y = double.tryParse(item['alignY'] ?? '0.0') ?? 0.0;

                        return CardBuilder(
                          title: item['title']!,
                          price: item['price']!,
                          imagePath: item['imagePath']!,
                          route: item['route']!,
                          imageAlignement: Alignment(x, y),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.home, color: Colors.white, size: 27),
            SizedBox(width: 20),
            Icon(Icons.search, color: Colors.white, size: 27),
            SizedBox(width: 20),
            Icon(Icons.notifications, color: Colors.white, size: 27),
            SizedBox(width: 20),
            Icon(Icons.account_circle, color: Colors.white, size: 27),
          ],
        ),
      ),
    );
  }
}

class CardBuilder extends StatelessWidget {
  const CardBuilder({
    super.key,
    required this.title,
    required this.price,
    required this.imagePath,
    required this.route,
    this.imageAlignement = Alignment.center,
  });
  final String title;
  final String price;
  final String imagePath;
  final String route;
  final Alignment imageAlignement;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        width: double.infinity, // Card will take full width of ListView
        height: 400, // Total card height
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: 250, // Image height inside the card
                fit: BoxFit.cover,
                alignment: imageAlignement,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(price, style: TextStyle(fontSize: 16)),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, route);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: Text(
                          'Buy Now',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
