// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:loan_and_mortgage_calculator/core/app/router/router.dart'
    as _i3;
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/data/datasource/calculator_datasource.dart'
    as _i4;
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/data/datasource/impl/calculator_datasource_db_impl.dart'
    as _i5;
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/data/repository/calculator_db_repository.dart'
    as _i7;
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/domain/repository/calculator_repository.dart'
    as _i6;
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/domain/usecase/calculator_usecase.dart'
    as _i8;
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/presentation/calculator_page/bloc/calculator_page_bloc.dart'
    as _i10;
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/presentation/history_page/bloc/history_page_bloc.dart'
    as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AppRouter>(() => _i3.AppRouter());
    gh.singleton<_i4.CalculatorDataSource>(
        () => _i5.CalculatorDataSourceDbImpl());
    gh.singleton<_i6.CalculatorRepository>(() =>
        _i7.CalculatorDbRepository(dataSource: gh<_i4.CalculatorDataSource>()));
    gh.singleton<_i8.CalculatorUsecase>(() =>
        _i8.CalculatorUsecase(repository: gh<_i6.CalculatorRepository>()));
    gh.singleton<_i9.HistoryPageBloc>(
        () => _i9.HistoryPageBloc(gh<_i8.CalculatorUsecase>()));
    gh.singleton<_i10.CalculatorPageBloc>(
        () => _i10.CalculatorPageBloc(gh<_i8.CalculatorUsecase>()));
    return this;
  }
}
