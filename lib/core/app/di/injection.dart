import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:loan_and_mortgage_calculator/core/app/di/injection.config.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/data/datasource/impl/calculator_datasource_db_impl.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/data/model/calculation_details_model.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/data/model/calculation_model.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  await Hive.initFlutter();
  getIt.init();
}
