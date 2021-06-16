import 'package:dartz/dartz.dart';

import '../entities/cat_entity.dart';
import '../failures/home_failure.dart';

abstract class GetCatGifUseCase {
  Future<Either<HomeFailure, CatEntity>> execute();
}
