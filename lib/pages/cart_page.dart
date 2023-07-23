import 'package:boba_milk_tea/components/drink_title.dart';
import 'package:boba_milk_tea/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/drink.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // remove drink from cart
  void removeFromCart(Drink drink) {
    Provider.of<BobaTeaShop>(context, listen: false).removeCart(drink);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BobaTeaShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // heading
              const Text(
                'Your Cart',
                style: TextStyle(fontSize: 20),
              ),

              const SizedBox(
                height: 20,
              ),
              // list of cart items
              Expanded(
                child: ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: (context, index) {
                    // get individual drink in cart first
                    Drink drink = value.cart[index];

                    //return as a nice title
                    return DrinkTitle(
                      drink: drink,
                      onTap: () => removeFromCart(drink),
                      trailing: Icon(Icons.delete),
                    );
                  },
                ),
              ),

              // pay button
              MaterialButton(
                child: Text(
                  'PAY',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.brown,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
