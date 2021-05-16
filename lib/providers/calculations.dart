import 'package:flutter/material.dart';
import 'package:pizza_hut/services/manage_data.dart';
import 'package:provider/provider.dart';

class Calculations with ChangeNotifier {
  int cheeseValue = 0, beaconValue = 0, onionValue = 0, cartData = 0;
  String size;
  String get getSize => size;
  bool isSelected = false,
      smallTapped = false,
      mediumTapped = false,
      selected = false,
      largeTapped = false;
  int get getCheeseValue => cheeseValue;
  int get getBeaconValue => beaconValue;
  int get getOnionValue => onionValue;
  int get getCartData => cartData;
  bool get getSelected => selected;

  addCheese() {
    cheeseValue++;
    notifyListeners();
  }

  addBeacon() {
    beaconValue++;
    notifyListeners();
  }

  addOnion() {
    onionValue++;
    notifyListeners();
  }

  minusCheese() {
    cheeseValue--;
    notifyListeners();
  }

  minusBeacon() {
    beaconValue--;
    notifyListeners();
  }

  minusOnion() {
    onionValue--;
    notifyListeners();
  }

  selectedSmallSize() {
    smallTapped = true;
    size = 'S';
    notifyListeners();
  }

  selectedMediumSize() {
    mediumTapped = true;
    size = 'M';
    notifyListeners();
  }

  selectedLargeSize() {
    largeTapped = true;
    size = 'S';
    notifyListeners();
  }

  removeAllData() {
    cheeseValue = 0;
    beaconValue = 0;
    onionValue = 0;
    mediumTapped = false;
    selected = false;
    largeTapped = false;
    notifyListeners();
  }

  addToCart(BuildContext context, dynamic data) async {
    if (smallTapped != false || mediumTapped != false || largeTapped != false) {
      cartData++;
      await Provider.of<ManageData>(context, listen: false)
          .submitData(context, data);
      notifyListeners();
    } else {
      return showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              color: Colors.black,
              height: 50,
              child: Center(
                child: Text('Selected Size',style: TextStyle(
                  color: Colors.white
                ),),
              ),
            );
          });
    }
  }
}
