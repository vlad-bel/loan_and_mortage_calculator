import 'package:fpdart/fpdart.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/domain/entity/calculation_entity.dart';

abstract class CalculatorRepository {
  Future<Either<String, List<CalculationEntity>>> getCalculations();

  Future<Either<String, void>> addCalculation({required CalculationEntity calculation});
}
