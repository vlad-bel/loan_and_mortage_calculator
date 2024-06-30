import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/data/model/calculation_model.dart';

abstract class CalculatorDataSource {
  Future<List<CalculationModel>> getCalculations();

  Future<void> addCalculation({required CalculationModel calculation});
}
