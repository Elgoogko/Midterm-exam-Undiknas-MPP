import 'package:basic_app/providers/history_provider.dart';
import 'package:flutter/material.dart';

class LengthConverterProvider extends ChangeNotifier {
  String _fromUnit = 'meters';
  String _toUnit = 'kilometers';
  double _inputValue = 0.0;
  String _equation = '0';
  double _convertedValue = 0;

  String get fromUnit => _fromUnit;
  String get toUnit => _toUnit;
  String get equation => _equation;
  double get inputValue => _inputValue;
  double get convertedValue => _convertedValue;

  HistoryProvider historyProvider;

  LengthConverterProvider({required this.historyProvider});

  void updateHistoryProvider(HistoryProvider newProvider) {
    historyProvider = newProvider; // rendre le champ non-final
  }

  void setFromUnit(String unit) {
    _fromUnit = unit;
    notifyListeners();
  }

  void setToUnit(String unit) {
    _toUnit = unit;
    notifyListeners();
  }

  void handleTap(String buttonText) {
    if (buttonText == 'AC') {
      _equation = '';
    } else if (buttonText == 'DEL') {
      if (_equation.isNotEmpty) {
        _equation = _equation.substring(0, _equation.length - 1);
      }
      if (_equation.isEmpty) _convertedValue = 0.0;
    } else if (buttonText == '=') {
      _inputValue = double.tryParse(_equation) ?? 0.0;
      _convertAndSave();
      return;
    } else {
      if (buttonText == '.' || buttonText == ',') {
        if (!_equation.contains('.')) {
          _equation += '.';
        }
      } else {
        if (_equation == '0') {
          _equation = buttonText;
        } else {
          double temp = double.tryParse(_equation + buttonText) ?? 0.0;
          if (temp >= 9999999) {
            _equation = '9999999';
          } else {
            _equation += buttonText;
          }
        }
      }
    }

    notifyListeners();
  }

  void _convertAndSave() {
    double valueInMeters = _convertToMeters(_inputValue, _fromUnit);
    _convertedValue = _convertFromMeters(valueInMeters, _toUnit);

    historyProvider.addToHistory(
      "Converter",
      "$_inputValue $_fromUnit to $_convertedValue $_toUnit",
    );
  }

  double _convertToMeters(double value, String unit) {
    switch (unit) {
      case 'meters':
        return value;
      case 'kilometers':
        return value * 1000;
      case 'miles':
        return value * 1609.34;
      default:
        return value;
    }
  }

  double _convertFromMeters(double value, String unit) {
    switch (unit) {
      case 'meters':
        return value;
      case 'kilometers':
        return value / 1000;
      case 'miles':
        return value / 1609.34;
      default:
        return value;
    }
  }
}
