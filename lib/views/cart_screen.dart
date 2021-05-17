import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizza_hut/views/home_page.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBar(context),
            headerText(),
            cartData(),
            shippingDetails(context),
            billingData()
          ],
        ),
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: HomePage(),
                        type: PageTransitionType.rightToLeftWithFade));
              }),
          Padding(
            padding: const EdgeInsets.only(left: 200.0),
            child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.red,
                ),
                onPressed: () {}),
          ),
        ],
      ),
    );
  }

  Widget headerText() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        children: [
          Text(
            'YOUR',
            style: TextStyle(color: Colors.grey, fontSize: 15.0),
          ),
          Text(
            'CART',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget cartData() {
    return SizedBox(
      height: 200,
    );
  }

  Widget shippingDetails(buildcontext) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.grey.shade500, blurRadius: 5, spreadRadius: 3)
      ], borderRadius: BorderRadius.circular(40), color: Colors.white),
      height: 130,
      width: 400,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(FontAwesomeIcons.locationArrow),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                          constraints: BoxConstraints(maxWidth: 250),
                          child: Text('data')),
                    )
                  ],
                ),
                IconButton(icon: Icon(Icons.edit), onPressed: null)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(EvaIcons.clock),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                          constraints: BoxConstraints(maxWidth: 250),
                          child: Text('6Pm - 8Pm')),
                    )
                  ],
                ),
                IconButton(icon: Icon(Icons.edit), onPressed: null)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget billingData() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.grey.shade500, blurRadius: 5, spreadRadius: 3)
        ], borderRadius: BorderRadius.circular(40), color: Colors.white),
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Subtotal',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.dollarSign,
                      color: Colors.grey,
                      size: 16,
                    ),
                    Text(
                      '300.00',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Delivery charges',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.dollarSign,
                      color: Colors.grey,
                      size: 16,
                    ),
                    Text(
                      '20.00',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.dollarSign,
                        color: Colors.black,
                        size: 20,
                      ),
                      Text(
                        '320.00',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget floatingActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 250,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.red.shade500,
                borderRadius: BorderRadius.circular(50)),
            child: Center(
                child: Text(
              'Place Order',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            )),
          ),
        ),
      ],
    );
  }
}
