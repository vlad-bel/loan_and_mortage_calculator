import 'package:hive_flutter/hive_flutter.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/data/model/calculation_details_model.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/domain/entity/calculate_type.dart';

part 'calculation_type_model.g.dart';

@HiveType(typeId: 2)
enum CalculateTypeModel {
  @HiveField(0)
  annuity,
  @HiveField(1)
  differentiated,
}
