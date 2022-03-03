import 'package:dartz/dartz.dart';
import 'package:urp/domain/core/failures.dart';

Either<ValueFailure<String>, String> validateEmptyString(String input) {
  if (input.isNotEmpty) {
    return right(input);
  }

  return left(ValueFailure.empty(failedValue: input));
}
