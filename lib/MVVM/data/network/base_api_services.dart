
abstract class BaseApiService {

  Future<dynamic> FetchGetApi(String url);

  Future<dynamic> FetchPostApi(String url, dynamic body);

}
