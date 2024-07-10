import 'package:flutter/material.dart';

class FormQuestionModel with ChangeNotifier {
  String _option = 'opção 1';
  String get option => _option;

  final List<String> _choices = [];
  List<String> get choices => _choices;

  void setOption(String newOption) {
    _option = newOption;
    notifyListeners();
  }

  void addChoice(String choice) {
    _choices.add(choice);
    notifyListeners();
  }

  void removeChoice(String choice) {
    _choices.remove(choice);
    notifyListeners();
  }
}
