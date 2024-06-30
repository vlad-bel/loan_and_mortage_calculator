import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/data/datasource/calculator_datasource.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/data/model/calculation_details_model.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/data/model/calculation_model.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/data/model/calculation_type_model.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/domain/entity/calculate_type.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/domain/entity/calculation_details_entity.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/domain/entity/calculation_entity.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/domain/repository/calculator_repository.dart';

@Singleton(as: CalculatorRepository)
class CalculatorDbRepository implements CalculatorRepository {
  final CalculatorDataSource dataSource;

  CalculatorDbRepository({
    required this.dataSource,
  });

  @override
  Future<Either<String, void>> addCalculation({required CalculationEntity calculation}) async {
    try {
      final model = CalculationModel(
        annuityResult: calculation.annuityResult,
        sumOfCredit: calculation.sumOfCredit,
        interesedPercentage: calculation.interesedPercentage,
        calculateType: calculation.calculateType == CalculateType.annuity
            ? CalculateTypeModel.annuity
            : CalculateTypeModel.differentiated,
        details: calculation.details
            .map((entity) => CalculationDetailsModel(
                  month: entity.month,
                  totalPayment: entity.totalPayment,
                  interestPayment: entity.interestPayment,
                  principalPayment: entity.principalPayment,
                  remainingPrincipal: entity.remainingPrincipal,
                ))
            .toList(),
        totalPayment: calculation.totalPayment,
      );
      await dataSource.addCalculation(
        calculation: model,
      );
      return const Right(null);
    } catch (e) {
      return const Left("Ошибка создания записи");
    }
  }

  @override
  Future<Either<String, List<CalculationEntity>>> getCalculations() async {
    try {
      final calculations = await dataSource.getCalculations();
      final calculationsEntites = calculations
          .map((model) => CalculationEntity(
                sumOfCredit: model.sumOfCredit,
                totalPayment: model.totalPayment,
                interesedPercentage: model.interesedPercentage,
                calculateType: model.calculateType == CalculateTypeModel.annuity
                    ? CalculateType.annuity
                    : CalculateType.differentiated,
                details: model.details
                    .map(
                      (details) => CalculationDetailsEntity(
                        month: details.month,
                        totalPayment: details.totalPayment,
                        interestPayment: details.interestPayment,
                        principalPayment: details.principalPayment,
                        remainingPrincipal: details.remainingPrincipal,
                      ),
                    )
                    .toList(),
              ))
          .toList();

      return Right(calculationsEntites);
    } catch (e) {
      return const Left("Ошибка получения записи");
    }
  }
}
