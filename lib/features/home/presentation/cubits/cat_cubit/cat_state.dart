part of 'cat_cubit.dart';

@freezed
class CatState with _$CatState {
  const factory CatState.initial() = _Initial;
  const factory CatState.loading() = _Loading;
  const factory CatState.unexpectedError() = _UnexpectedError;
  const factory CatState.unauthorized() = _Unauthorized;
  const factory CatState.serverError() = _ServerError;
  const factory CatState.dataLoaded(CatEntity catEntity) = _DataLoaded;
}
