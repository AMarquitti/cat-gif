import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../../../integrations/helpers/http_helper.dart';
import '../../domain/failures/home_failure.dart';
import '../../domain/repositories/cat_repository.dart';

class CatRemoteRepository implements CatRepository {
  CatRemoteRepository(this._baseUrl, this._httpHelper);
  final String _baseUrl;
  final HttpHelper _httpHelper;
  static const String catGifEndpoint = '/cat/gif?json=true';



  @override
  Future<Either<Failure, HttpResponse>> getCatGif() async {
     final HttpResponse response = await _httpHelper.get(getCatGifUrl());
    //Delay for demo
    await Future<void>.delayed(const Duration(seconds: 3));
    if (response.isOk()) {
      if (response.data == null) {
        return left(const HomeFailure.invalidData());
      }
      return right(response);
    } else if (response.statusCode == 401) {
      return left(const HomeFailure.unauthorized());
    }
    return left(const HomeFailure.serverError());
  }

    String getCatGifUrl() => '$_baseUrl$catGifEndpoint';
}
