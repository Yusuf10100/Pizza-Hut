import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizza_hut/providers/calculations.dart';
import 'package:pizza_hut/views/cart_screen.dart';
import 'package:pizza_hut/views/home_page.dart';
import 'package:provider/provider.dart';

class DetailedScreen extends StatefulWidget {
  final QueryDocumentSnapshot queryDocumentSnapshot;
  const DetailedScreen({
    this.queryDocumentSnapshot,
  });

  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  int cheeseValue = 0;
  int beaconValue = 0;
  int onionValue = 0;
  int totalItems = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appBar(context),
          pizzaImage(),
          middleData(),
          footerDetails()
        ],
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
                onPressed: () {
                  Provider.of<Calculations>(context, listen: false)
                      .removeAllData();
                }),
          ),
        ],
      ),
    );
  }

  Widget pizzaImage() {
    return Center(
      child: SizedBox(
        height: 240,
        child: Container(
          child: Image.network(widget.queryDocumentSnapshot['image']),
          decoration: BoxDecoration(shape: BoxShape.circle),
        ),
      ),
    );
  }

  Widget middleData() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              color: Colors.yellow.shade700,
              size: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(widget.queryDocumentSnapshot['rating']),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 300),
              child: Text(
                widget.queryDocumentSnapshot['name'],
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.dollarSign,
                  size: 20,
                  color: Colors.cyan,
                ),
                Text(
                  widget.queryDocumentSnapshot['price'].toString(),
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.cyan.shade500,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget footerDetails() {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade500,
                        blurRadius: 5,
                        spreadRadius: 3)
                  ]),
              width: 400,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Text(
                        'Add more stuff',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'cheese',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Row(
                          children: [
                            IconButton(
                                icon: Icon(EvaIcons.minus),
                                onPressed: () {
                                  Provider.of<Calculations>(context,
                                          listen: false)
                                      .minusCheese();
                                }),
                            Text(
                              Provider.of<Calculations>(context, listen: true)
                                  .getCheeseValue
                                  .toString(),
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                            IconButton(
                                icon: Icon(EvaIcons.plus),
                                onPressed: () {
                                  Provider.of<Calculations>(context,
                                          listen: false)
                                      .addCheese();
                                })
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'onion',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Row(
                          children: [
                            IconButton(
                                icon: Icon(EvaIcons.minus),
                                onPressed: () {
                                  Provider.of<Calculations>(context,
                                          listen: false)
                                      .minusOnion();
                                }),
                            Text(
                              Provider.of<Calculations>(context, listen: true)
                                  .getOnionValue
                                  .toString(),
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                            IconButton(
                                icon: Icon(EvaIcons.plus),
                                onPressed: () {
                                  Provider.of<Calculations>(context,
                                          listen: false)
                                      .addOnion();
                                })
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'beacon',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Row(
                          children: [
                            IconButton(
                                icon: Icon(EvaIcons.minus),
                                onPressed: () {
                                  Provider.of<Calculations>(context,
                                          listen: false)
                                      .minusBeacon();
                                }),
                            Text(
                              Provider.of<Calculations>(context, listen: true)
                                  .getBeaconValue
                                  .toString(),
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                            IconButton(
                                icon: Icon(EvaIcons.plus),
                                onPressed: () {
                                  Provider.of<Calculations>(context,
                                          listen: false)
                                      .addBeacon();
                                })
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Provider.of<Calculations>(context, listen: false)
                      .selectedSmallSize();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Provider.of<Calculations>(context, listen: true)
                            .smallTapped
                        ? Colors.red
                        : Colors.white,
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'S',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<Calculations>(context, listen: false)
                      .selectedMediumSize();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Provider.of<Calculations>(context, listen: true)
                            .mediumTapped
                        ? Colors.red
                        : Colors.white,
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'M',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<Calculations>(context, listen: false)
                      .selectedLargeSize();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Provider.of<Calculations>(context, listen: true)
                            .largeTapped
                        ? Colors.red
                        : Colors.white,
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'L',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget floatingActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Provider.of<Calculations>(context, listen: false)
                      .addToCart(context, {
                        'image': widget.queryDocumentSnapshot['image'],
                        'name': widget.queryDocumentSnapshot['name'],
                        'price': widget.queryDocumentSnapshot['price'],
                        'onion': Provider.of<Calculations>(context, listen: false)
                                  .getOnionValue,
                        'beacon': Provider.of<Calculations>(context, listen: false)
                                  .getBeaconValue,
                        'cheese': Provider.of<Calculations>(context, listen: false)
                                  .getCheeseValue,
                        'size': Provider.of<Calculations>(context, listen: false)
                                  .getSize,

                      });
          },
          child: Container(
            width: 250,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.red.shade500,
                borderRadius: BorderRadius.circular(50)),
            child: Center(
                child: Text(
              'Add to Cart',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            )),
          ),
        ),
        Stack(
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: CartScreen(),
                        type: PageTransitionType.bottomToTop));
              },
              child: Icon(
                Icons.shopping_cart_rounded,
                color: Colors.black,
              ),
            ),
            Positioned(
                left: 35,
                child: CircleAvatar(
                  radius: 10,
                  child: Text('$totalItems'),
                ))
          ],
        )
      ],
    );
  }
}
