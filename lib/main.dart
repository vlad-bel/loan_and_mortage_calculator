import 'package:flutter/material.dart';
import 'package:loan_and_mortgage_calculator/core/app/app.dart';
import 'package:loan_and_mortgage_calculator/core/app/di/injection.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(const LoanAndMortgageApp());
}

