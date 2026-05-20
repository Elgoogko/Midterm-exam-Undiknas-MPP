import 'dart:async';
import 'package:basic_app/providers/history_provider.dart';
import 'package:flutter/material.dart';

class DiscountProvider extends ChangeNotifier {
  String _originalPriceString = '0';
  String _discountPercentageString = '0';

  double _finalResult = 0.0;
  double _savedAmount = 0.0;
  String _inputType = 'originalPrice';

  Timer? _debounceTimer;
  HistoryProvider historyProvider;

  DiscountProvider({required this.historyProvider});

  void updateHistoryProvider(HistoryProvider newProvider) {
    historyProvider = newProvider; // rendre le champ non-final
  }

  String get originalPriceString => _originalPriceString;
  String get discountPercentageString => _discountPercentageString;

  double get originalPrice => double.tryParse(_originalPriceString) ?? 0.0;
  double get discountPercentage =>
      double.tryParse(_discountPercentageString) ?? 0.0;
  double get finalResult => _finalResult;
  double get savedAmount => _savedAmount;
  String get inputType => _inputType;

  void handleTap(String buttonText) {
    if (buttonText == 'AC') {
      _originalPriceString = '0';
      _discountPercentageString = '0';
      _finalResult = 0.0;
      _savedAmount = 0.0;
    } else if (buttonText == 'DEL') {
      _handleDelete();
    } else if (buttonText == '.' || buttonText == ',') {
      _handleDecimal();
    } else {
      _handleNumberInput(buttonText);
    }

    _calculateDiscount();
    _saveToHistoryWithDebounce();
    notifyListeners();
  }

  void _handleDelete() {
    if (_inputType == 'originalPrice') {
      if (_originalPriceString.length > 1) {
        _originalPriceString = _originalPriceString.substring(
          0,
          _originalPriceString.length - 1,
        );
      } else {
        _originalPriceString = '0';
      }
    } else {
      if (_discountPercentageString.length > 1) {
        _discountPercentageString = _discountPercentageString.substring(
          0,
          _discountPercentageString.length - 1,
        );
      } else {
        _discountPercentageString = '0';
      }
    }
  }

  void _handleDecimal() {
    if (_inputType == 'originalPrice') {
      if (!_originalPriceString.contains('.')) _originalPriceString += '.';
    } else {
      if (!_discountPercentageString.contains('.')) {
        _discountPercentageString += '.';
      }
    }
  }

  void _handleNumberInput(String digit) {
    if (_inputType == 'originalPrice') {
      if (_originalPriceString == '0') {
        _originalPriceString = digit;
      } else {
        _originalPriceString += digit;
      }
    } else {
      if (_discountPercentageString == '0') {
        _discountPercentageString = digit;
      } else {
        String temporary = _discountPercentageString + digit;
        if ((double.tryParse(temporary) ?? 0.0) <= 100.0) {
          _discountPercentageString = temporary;
        }
      }
    }
  }

  void _calculateDiscount() {
    double price = originalPrice;
    double percent = discountPercentage;

    _finalResult = price * (1 - percent / 100);
    _savedAmount = price - _finalResult;
  }

  void switchInputType(String type) {
    _inputType = type;
    notifyListeners();
  }

  void _saveToHistoryWithDebounce() {
    _debounceTimer?.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 2000), () {
      if (originalPrice > 0 && discountPercentage > 0) {
        historyProvider.addToHistory(
          "Calcul de Remise",
          "Prix initial: ${originalPrice.toStringAsFixed(2)} € (-$discountPercentage%) ➔ Final: ${_finalResult.toStringAsFixed(2)} € (Économie: ${_savedAmount.toStringAsFixed(2)} €)",
        );
      }
    });
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }
}
