import 'dart:convert';
import 'dart:io';
import 'package:app/features/home/domain/entities/cat_entity.dart';
import 'package:app/integrations/helpers/http_helper.dart';

class CatRepoContract {
  static const String fixturePath =
      'test/features/home/data/contracts/fixtures/catgif';

  static Future<HttpResponse> getCatGifSuccess() async {
    final dynamic jsonResponse = json
        .decode(File('$fixturePath/success.json').readAsStringSync());
    return HttpResponse(jsonResponse, 200);
  }

  static Future<HttpResponse> getServerError() async {
    return HttpResponse(json.decode('{}'), 500);
  }

  static Future<HttpResponse> getCatGifEmptyResponse() async {
    return HttpResponse(json.decode('{}'), 200);
  }

  static CatEntity getCatentityObject() {
    return CatEntity(
      id: '5d84d1347ed56f0011937812',
      url: '/cat/5d84d1347ed56f0011937812',
    );
  }
}
