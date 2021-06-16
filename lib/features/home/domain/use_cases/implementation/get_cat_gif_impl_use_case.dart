import 'package:dartz/dartz.dart';

import '../../../../../core/failures/failure.dart';
import '../../../../../integrations/helpers/http_helper.dart';
import '../../entities/cat_entity.dart';
import '../../failures/home_failure.dart';
import '../../repositories/cat_repository.dart';
import '../get_cat_gif_use_case.dart';

class GetCatGifImplUseCase implements GetCatGifUseCase {
  GetCatGifImplUseCase(this._repository);
  final CatRepository _repository;

  @override
  Future<Either<HomeFailure, CatEntity>> execute() async {
    final Either<Failure, HttpResponse> result = await _repository.getCatGif();
    return result.fold(
      (Failure failure) => left(failure as HomeFailure),
      (HttpResponse response) => right(CatEntity.fromMap(response.data)),
    );
  }
}
