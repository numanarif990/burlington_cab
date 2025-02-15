import 'package:flutter/foundation.dart';
class DrawerProvider extends ChangeNotifier{
  bool _isVisible = false;
  bool get isVisible => _isVisible;
  void toggleDrawer(){
    _isVisible =!_isVisible;
    notifyListeners();
  }
}