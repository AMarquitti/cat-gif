// Mocks generated by Mockito 5.0.7 from annotations
// in app/test/features/home/presentation/cubit/cat_cubit/cat_cubit_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:app/features/home/domain/entities/cat_entity.dart' as _i6;
import 'package:app/features/home/domain/failures/home_failure.dart' as _i5;
import 'package:app/features/home/domain/use_cases/get_cat_gif_use_case.dart'
    as _i3;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

// ignore_for_file: prefer_const_constructors

// ignore_for_file: avoid_redundant_argument_values

class _FakeEither<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [GetCatGifUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetCatGifUseCase extends _i1.Mock implements _i3.GetCatGifUseCase {
  MockGetCatGifUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.HomeFailure, _i6.CatEntity>> execute() =>
      (super.noSuchMethod(Invocation.method(#execute, []),
          returnValue: Future<_i2.Either<_i5.HomeFailure, _i6.CatEntity>>.value(
              _FakeEither<_i5.HomeFailure, _i6.CatEntity>())) as _i4
          .Future<_i2.Either<_i5.HomeFailure, _i6.CatEntity>>);
}
