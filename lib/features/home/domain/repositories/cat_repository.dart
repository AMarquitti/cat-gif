import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../../../integrations/helpers/http_helper.dart';

abstract class CatRepository {
  Future<Either<Failure, HttpResponse>> getCatGif();
}
