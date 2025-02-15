import 'package:flutter/foundation.dart';

class NavigationProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners(); // Notify listeners when selected index changes
  }

  void navigateToContainer(int index) {
    selectedIndex = index;
  }
}