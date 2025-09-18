import 'package:flutter_riverpod/flutter_riverpod.dart';

final textFieldLabelProvider = Provider((ref){
  return 'SB Dunks & Skates';
});

final counterProvider = StateProvider<int>((ref){
  return 0;
});

class CartItemCounter extends StateNotifier<int> {
  CartItemCounter() : super(0);

  void increment() {
    state++;
  }

  void decrement() {
    if (state > 0) {
      state--;
    }
  }

  void reset() {
    state = 0;
  }
}

final cartItemProvider = StateNotifierProvider<CartItemCounter, int>((ref) {
  return CartItemCounter();
});