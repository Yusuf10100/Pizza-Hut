import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizza_hut/views/cart_screen.dart';

class Footer extends ChangeNotifier {
  Widget floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushReplacement(
            context,
            PageTransition(
                child: CartScreen(),
                type: PageTransitionType.rightToLeftWithFade));
      },
      child: Icon(EvaIcons.shoppingBag),
    );
  }
}
