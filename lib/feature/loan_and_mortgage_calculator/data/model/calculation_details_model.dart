import 'package:hive_flutter/hive_flutter.dart';

part 'calculation_details_model.g.dart';

@HiveType(typeId: 1)
class CalculationDetailsModel extends HiveObject {
  @HiveField(0)
  final int month;
  @HiveField(1)
  final double totalPayment;
  @HiveField(2)
  final double interestPayment;
  @HiveField(3)
  final double principalPayment;
  @HiveField(4)
  final double remainingPrincipal;

  CalculationDetailsModel(
      {required this.month,
      required this.totalPayment,
      required this.interestPayment,
      required this.principalPayment,
      required this.remainingPrincipal});

  factory CalculationDetailsModel.fromJson(Map<String, dynamic> json) => CalculationDetailsModel(
        month: json["month"],
        totalPayment: json["total_payment"],
        interestPayment: json["interest_payment"],
        principalPayment: json["principal_payment"],
        remainingPrincipal: json["remaining_principal"],
      );
}
