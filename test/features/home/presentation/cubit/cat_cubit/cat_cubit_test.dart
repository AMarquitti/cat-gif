import 'package:app/features/home/domain/entities/cat_entity.dart';
import 'package:app/features/home/domain/failures/home_failure.dart';
import 'package:app/features/home/domain/use_cases/get_cat_gif_use_case.dart';
import 'package:app/features/home/presentation/cubits/cat_cubit/cat_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../data/contracts/cat_repo_contract.dart';
import 'cat_cubit_test.mocks.dart';

@GenerateMocks([GetCatGifUseCase])
void main() {
  late GetCatGifUseCase _useCase;
  setUp(() {
    _useCase = MockGetCatGifUseCase();
  });
  group('Test cat gif cubit', () {
    final CatEntity entity = CatRepoContract.getCatentityObject();
    blocTest<CatCubit, CatState>('emits [Loading, dataLoaded] success',
        build: () {
          when(_useCase.execute()).thenAnswer((_) =>
              Future<Either<HomeFailure, CatEntity>>.value(right(entity)));

          return CatCubit(_useCase);
        },
        act: (CatCubit cubit) => cubit.fetchCatData(),
        expect: () => <dynamic>[
              const CatState.loading(),
              CatState.dataLoaded(entity),
            ]);
    blocTest<CatCubit, CatState>('emits [Loading, serverError] server error',
        build: () {
          when(_useCase.execute()).thenAnswer((_) =>
              Future<Either<HomeFailure, CatEntity>>.value(
                  left(const HomeFailure.serverError())));

          return CatCubit(_useCase);
        },
        act: (CatCubit cubit) => cubit.fetchCatData(),
        expect: () => <dynamic>[
              const CatState.loading(),
              const CatState.serverError(),
            ]);
  });
}
