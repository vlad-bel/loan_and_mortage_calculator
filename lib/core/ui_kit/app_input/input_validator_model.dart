enum MHFInputValidatorEnum {
  EMPTY,
}

class MHFInputValidatorModel {
  final MHFInputValidatorEnum validation;
  final int length;
  final String? errorString;

  MHFInputValidatorModel({required this.validation, this.length = 0, this.errorString});
}
