part of 'calculator_bloc.dart';

class CalculatorState {
  final String mathResult;
  final String firstNumber;
  final String secundNumber;
  final String operation;

  CalculatorState(
      {this.mathResult = '30',
      this.firstNumber = '10',
      this.secundNumber = '20',
      this.operation = '+'});

  CalculatorState copyWith(
          {String? mathResult,
          String? firstNumber,
          String? secundNumber,
          String? operation}) =>
      CalculatorState(
          mathResult: mathResult ?? this.mathResult,
          firstNumber: firstNumber ?? this.firstNumber,
          secundNumber: secundNumber ?? this.secundNumber,
          operation: operation ?? this.operation);
}
