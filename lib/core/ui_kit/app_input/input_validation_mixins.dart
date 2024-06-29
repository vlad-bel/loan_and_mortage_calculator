import 'package:loan_and_mortgage_calculator/core/ui_kit/app_input/input_validator_model.dart';

mixin InputValidationMixin {
  String? validateField(String? value, List<MHFInputValidatorModel>? validators) {
    if (validators == null) {
      return null;
    }

    String? errorString;

    for (var vds in validators) {
      if (value == null) {
        errorString = vds.errorString;
        continue;
      }

      switch (vds.validation) {
        case MHFInputValidatorEnum.EMPTY:
          errorString = value.isEmpty ? vds.errorString : null;
          break;

      }

      if (errorString != null && errorString.isNotEmpty) break;
    }

    return errorString;
  }

}
