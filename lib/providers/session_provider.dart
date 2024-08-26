import 'package:delivery_app/entities/User.dart';
import 'package:flutter/material.dart';

class SessionProvider extends ChangeNotifier {
  User _session = User("", "","", "");
  User get session => _session;
  set changeUser(User value) {



    _session = value;
    notifyListeners();
  }
}