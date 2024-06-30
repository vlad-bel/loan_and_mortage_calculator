import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/data/datasource/calculator_datasource.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/data/model/calculation_details_model.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/data/model/calculation_model.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/data/model/calculation_type_model.dart';

@Singleton(as: CalculatorDataSource)
class CalculatorDataSourceDbImpl implements CalculatorDataSource {
  static const String calculationKey = "CalculationModel";

  late final Box<CalculationModel> calculationBox;

  CalculatorDataSourceDbImpl() {
    initDataBase();
  }

  Future<void> initDataBase() async {
    try {
      Hive.registerAdapter(CalculationModelAdapter());
      Hive.registerAdapter(CalculationDetailsModelAdapter());
      Hive.registerAdapter(CalculateTypeModelAdapter());
      calculationBox = await Hive.openBox(calculationKey);
    } catch (e) {
      print('Error initializing database For *CalculationModel*');
    }
  }

  @override
  Future<void> addCalculation({required CalculationModel calculation}) async {
    await calculationBox.add(calculation);
  }

  @override
  Future<List<CalculationModel>> getCalculations() async {
    final response =  calculationBox.values.toList();
    return response;
  }
}
