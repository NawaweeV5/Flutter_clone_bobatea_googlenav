import 'package:boba_milk_tea/components/drink_title.dart';
import 'package:boba_milk_tea/models/drink.dart';
import 'package:boba_milk_tea/models/shop.dart';
import 'package:boba_milk_tea/pages/order_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // user select a drink , go to order page
  void goToOrderPage(Drink drink) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderPage(
          drink: drink,
        ),
      ),
    );
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
              Text(
                "Boba Tea Shop",
                style: TextStyle(fontSize: 20),
              ),

              const SizedBox(
                height: 20,
              ),
              // list of drinks
              Expanded(
                child: ListView.builder(
                    itemCount: value.shop.length,
                    itemBuilder: (context, index) {
                      // get individual drinks from shop
                      Drink individualDrink = value.shop[index];
                      // return that drink as a nice title
                      return DrinkTitle(
                        drink: individualDrink,
                        onTap: () => goToOrderPage(individualDrink),
                        trailing: Icon(Icons.arrow_forward),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
