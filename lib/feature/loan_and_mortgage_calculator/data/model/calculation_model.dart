import 'package:hive_flutter/hive_flutter.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/data/model/calculation_details_model.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/data/model/calculation_type_model.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/domain/entity/calculate_type.dart';

part 'calculation_model.g.dart';

@HiveType(typeId: 0)
class CalculationModel extends HiveObject {
  @HiveField(0)
  final double? annuityResult;
  @HiveField(1)
  final int sumOfCredit;
  @HiveField(2)
  final double totalPayment;
  @HiveField(3)
  final double interesedPercentage;
  @HiveField(4)
  final CalculateTypeModel calculateType;
  @HiveField(5)
  final List<CalculationDetailsModel> details;

  // double? annuityResult,
  //     required int sumOfCredit,
  //     required double totalPayment,
  //     required double interesedPercentage,
  //     required CalculateType calculateType,
  //     required List<CalculationDetailsEntity> details,

  CalculationModel({
    required this.annuityResult,
    required this.sumOfCredit,
    required this.totalPayment,
    required this.interesedPercentage,
    required this.calculateType,
    required this.details,
  });

  factory CalculationModel.fromJson(Map<String, dynamic> json) => CalculationModel(
        details: List<CalculationDetailsModel>.from(json["details"].map((x) => CalculationDetailsModel.fromJson(x))),
        annuityResult: json["annuity_result"],
        sumOfCredit: json["sum_of_credit"],
        interesedPercentage: json["interesed_percentage"],
        calculateType: json["calculate_type"],
        totalPayment: json["total_payment"],
      );
}
