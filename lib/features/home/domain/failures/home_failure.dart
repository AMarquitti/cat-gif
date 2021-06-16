import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/failures/failure.dart';

part 'home_failure.freezed.dart';

@freezed
class HomeFailure extends Failure with _$HomeFailure {
  const factory HomeFailure.connectionError() = _ConnectionError;
  const factory HomeFailure.invalidData() = _InvalidData;
  const factory HomeFailure.unauthorized() = _Unauthorized;
  const factory HomeFailure.unexpectedError() = _UnexpectedError;
  const factory HomeFailure.serverError({String? message}) = _ServerError;
}
