import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/providers.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy list of cart items (you will replace with actual cart data later)
    final List<Map<String, dynamic>> cartItems = List.generate(
      1,
      (index) => {
        'name': 'Nike Air Max ${index + 1}',
        'size': 9 + index,
        'price': 12995 + (index * 500),
      },
    );

    return Scaffold(
      appBar: AppBar(title: Text('Your Cart'), backgroundColor: Colors.white),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Shoe image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/img1.jpg', // or item['imagePath']
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Product details and buttons
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text('Size: ${item['size']}'),
                        const SizedBox(height: 8),
                        Text(
                          '₹${item['price']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Consumer(
                                    builder: (BuildContext context, WidgetRef ref, Widget? child) {
                                      return IconButton(
                                        icon: const Icon(Icons.remove, size: 20),
                                        onPressed: () {
                                          ref.read(cartItemProvider.notifier).decrement();
                                        },
                                      );
                                    }
                                  ),
                                  Consumer(
                                    builder: (BuildContext context, WidgetRef ref, Widget? child) {
                                      final count = ref.watch(cartItemProvider);
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8,
                                        ),
                                        child: Text(
                                          '$count',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      );
                                    }
                                  ),
                                  Consumer(
                                    builder: (BuildContext context, WidgetRef ref, Widget? child) {
                                      return IconButton(
                                        icon: const Icon(Icons.add, size: 20),
                                        onPressed: () {
                                          ref.read(cartItemProvider.notifier).increment();
                                        },
                                      );
                                    }
                                  ),
                                ],
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
        },
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            // Add your checkout logic here
          },
          child: Text('Checkout', style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}
