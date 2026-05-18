import 'package:basic_app/providers/history_provider.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorProvider extends ChangeNotifier {
  String _equation = '';
  String _result = '0';

  String get equation => _equation;
  String get result => _result;
  final HistoryProvider historyProvider;
  
  CalculatorProvider({required this.historyProvider});
  /// Handle button tap and update the equation and result accordingly
  /// @param buttonText the text of the button that was tapped
  void handleTap(String buttonText) {
    if (buttonText == 'AC') {
      _equation = '';
      _result = '0';
    } else if (buttonText == 'DEL') {
      if (_equation.isNotEmpty) {
        _equation = _equation.substring(0, _equation.length - 1);
      }
      if (_equation.isEmpty) _result = '0';
    } else if (buttonText == '=') {
      _calculateResult();
    } else if (_equation.isNotEmpty &&
        (buttonText == '+' ||
            buttonText == '-' ||
            buttonText == 'X' ||
            buttonText == '/' ||
            buttonText == '%') &&
        (_equation.endsWith('+') ||
            _equation.endsWith('-') ||
            _equation.endsWith('X') ||
            _equation.endsWith('/') ||
            _equation.endsWith('%'))) {
      // Replace the last operator with the new one
      _equation = _equation.substring(0, _equation.length - 1) + buttonText;
    } else {
      if ((_equation.isEmpty &&
          (buttonText == '+' ||
              buttonText == '-' ||
              buttonText == 'X' ||
              buttonText == '/' ||
              buttonText == '%'))) {
        return;
      }
      _equation += buttonText;
    }

    notifyListeners();
  }

  void _calculateResult() {
    try {
      String finalExpression = _equation.replaceAll('X', '*');
      _result = _evaluateMathExpression(finalExpression);
    } catch (e) {
      _result = 'Erreur';
    }
  }

  String _evaluateMathExpression(String expression) {


    try {
      String finalExpression = expression.replaceAll('X', '*');
      finalExpression = finalExpression.replaceAll(',', '.');

      GrammarParser p = GrammarParser();
      Expression exp = p.parse(finalExpression);

      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      var r = "";
      if (eval % 1 == 0) {
        r = eval.toInt().toString();
      } else {
        r = eval.toString();
      }

      historyProvider.addToHistory("Calculator", "$_equation = $r");
      _equation = r;

      return r;
    } catch (e) {
      return "error";
    }
  }
}
