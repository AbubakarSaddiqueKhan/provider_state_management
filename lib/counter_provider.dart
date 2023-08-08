// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

//  i )  Extend's the class (where there is something to change) with the change notifier
class CounterProvider extends ChangeNotifier {
  //make the variable on which you want's some of the changes
  int counter;

  //  make the function ( who can perform some type of operation you want's) to apply the types of changes you wants
  void incrementCounter() {
    counter++;
    //  notify listener is used to listen th changes that you can do on the variable on that function or event
    notifyListeners();
  }

  void decrementCounter() {
    counter--;
    notifyListeners();
  }

  // make a constructor of the class which extend's the change notifier

  CounterProvider({
    required this.counter,
  });
}

//  sepreate classes will be made if you another type of the operation 
