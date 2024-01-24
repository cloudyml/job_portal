import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/businessmodel.dart';

class BusinessProvider extends ChangeNotifier {
  BusinessModel? _businessData;

  BusinessModel? get businessData => _businessData;

  void setBusinessData(BusinessModel data) {
    _businessData = data;
    notifyListeners();
  }
}
