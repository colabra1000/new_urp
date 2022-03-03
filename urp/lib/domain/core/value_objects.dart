import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:urp/domain/core/failures.dart';
import 'package:urp/domain/core/value_validators.dart';

import 'error.dart';

abstract class ValueOjbect<T> extends Equatable {
  const ValueOjbect();

  Either<ValueFailure<T>, T> get value;

  T getOrCrash() => value.fold((l) => throw UnExpectedValueException(l), id);

  bool isValid() => value.isRight();

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit =>
      value.fold((l) => left(l), (r) => right(unit));

  @override
  List<Object?> get props => [value];
}

// class UniqueId extends ValueOjbect<String> {
//   @override
//   final Either<ValueFailure<String>, String> value;

//   factory UniqueId() {
//     return UniqueId._(right("00"));
//   }

//   factory UniqueId.fromUniqueString(String input) {
//     return UniqueId._(validateEmptyString(input));
//   }

//   const UniqueId._(this.value);
// }
