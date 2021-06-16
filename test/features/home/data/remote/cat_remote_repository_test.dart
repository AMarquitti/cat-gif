import 'package:app/core/failures/failure.dart';
import 'package:app/features/home/data/remote/cat_remote_repository.dart';
import 'package:app/features/home/domain/failures/home_failure.dart';
import 'package:app/integrations/helpers/http_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../contracts/cat_repo_contract.dart';
import 'cat_remote_repository_test.mocks.dart';

@GenerateMocks([HttpHelper])
void main() {
  late MockHttpHelper _httpHelper;
  late CatRemoteRepository _repository;

  setUp(() {
    _httpHelper = MockHttpHelper();
    _repository = CatRemoteRepository('', _httpHelper);
  });

  group('Test cat repository', () {
    final String url = CatRemoteRepository.catGifEndpoint;
    test('Should return a valid response [success]', () async {
      //arrange
      when(_httpHelper.get(url)).thenAnswer((_) async =>
          Future<HttpResponse>.value(await CatRepoContract.getCatGifSuccess()));

      //act
      final Either<Failure, HttpResponse> result =
          await _repository.getCatGif();

      //assert
      expect(result.isRight(), true);
      expect(
          result.getOrElse(() => HttpResponse(null, 200)).data, isNotNull);
      verify(_httpHelper.get(url)).called(1);
      verifyNoMoreInteractions(_httpHelper);
    });

    test('Should return failure on server exception', () async {
      //arrange
      when(_httpHelper.get(url)).thenAnswer((_) async =>
          Future<HttpResponse>.value(
              await CatRepoContract.getServerError()));

      //act
     final Either<Failure, HttpResponse> result =
          await _repository.getCatGif();

      //assert
      expect(result.isLeft(), true);
      expect(result.leftMap((Failure l) => l),
          left(const HomeFailure.serverError()));
      verify(_httpHelper.get(url)).called(1);
      verifyNoMoreInteractions(_httpHelper);
    });
  });
}
