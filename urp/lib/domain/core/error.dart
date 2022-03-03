import 'package:urp/domain/core/failures.dart';

class UnExpectedValueException extends Error {
  ValueFailure valueFailure;
  UnExpectedValueException(this.valueFailure);

  @override
  String toString() {
    const explanation =
        "Encountered a valueFailure at an unrecoverable point. Terminating";
    return Error.safeToString("$explanation Failure was $valueFailure");
  }
}
