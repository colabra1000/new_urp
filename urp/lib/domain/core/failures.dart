import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class ValueFailure<T> with _$ValueFailure<T> {
  const ValueFailure._();

  const factory ValueFailure.invalidEmail({required T failedValue}) =
      _InvalidEmail<T>;

  const factory ValueFailure.empty({required T failedValue}) = $Empty<T>;
}
