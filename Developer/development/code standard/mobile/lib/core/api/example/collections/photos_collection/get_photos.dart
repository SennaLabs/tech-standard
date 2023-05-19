import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tooling/core/api/dio_service.dart';
import 'package:tooling/core/models/example/photo.dart';

Future<List<Photo>> getPhoto({int albumId = 1}) async {
  final String key = dotenv.env['EXAMPLE_API'] ?? '';
  print(key);

  Map<String, dynamic> params = {
    'albumId': albumId,
  };

  final result = await DioService().exampleClientService.get('/photos', queryParameters: params);

  List<Photo> photos = [];
  if (result.data != null) {
    photos = List<Photo>.from(result.data.map((photo) => Photo.fromJson(photo))).toList();
    return photos;
  }
  return photos;
}
