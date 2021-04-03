import 'package:flutter/material.dart';
import 'package:pizza_hut/helpers/footer.dart';
import 'package:pizza_hut/helpers/header.dart';
import 'package:pizza_hut/helpers/middle.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Footer().floatingActionButton(context),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header().appBar(context),
            Header().headerText(),
            Header().headerMenu(context),
            Divider(),
            MiddleHelper().textFav(),
            MiddleHelper().dataFav(context, 'favourite'),
                        MiddleHelper().textBusiness(),

            MiddleHelper().dataBusiness(context, 'business'),
          ],
        ),
              ),
      ),
    );
  }
}
