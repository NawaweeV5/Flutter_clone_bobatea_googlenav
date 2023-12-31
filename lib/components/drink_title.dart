import 'package:flutter/material.dart';

import '../models/drink.dart';

class DrinkTitle extends StatelessWidget {
  final Drink drink;
  void Function()? onTap;
  final Widget trailing;
  DrinkTitle(
      {super.key,
      required this.drink,
      required this.onTap,
      required this.trailing});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.brown[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          title: Text(drink.name),
          subtitle: Text(drink.price),
          leading: Image.asset(drink.imagepath),
          trailing: trailing,
        ),
      ),
    );
  }
}
