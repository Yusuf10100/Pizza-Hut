import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Header extends ChangeNotifier {
  Widget appBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(icon: Icon(FontAwesomeIcons.userAlt), onPressed: () {}),
          Text(
            'Location',
            style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
                fontWeight: FontWeight.w300),
          ),
          IconButton(
              icon: Icon(
                FontAwesomeIcons.search,
                color: Colors.black,
              ),
              onPressed: () {}),
        ],
      ),
    );
  }

  Widget headerText() {
    return Container(
      constraints: BoxConstraints(maxWidth: 300),
      child: RichText(
        text: TextSpan(
          text: 'What would you like\n',
          style: TextStyle(
              color: Colors.black, fontSize: 29, fontWeight: FontWeight.w300),
          children: <TextSpan>[
            TextSpan(
              text: 'to eat?',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget headerMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.redAccent, blurRadius: 15)
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.grey.shade100),
              child: Center(
                  child: Text(
                'All Food',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              )),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.lightBlueAccent, blurRadius: 15)
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.grey.shade100),
              child: Center(
                  child: Text(
                'Pizza',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              )),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.greenAccent, blurRadius: 15)
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.grey.shade100),
              child: Center(
                  child: Text(
                'Pasta',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              )),
            ),
          )
        ],
      ),
    );
  }
}
