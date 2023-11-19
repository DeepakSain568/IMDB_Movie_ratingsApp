import 'package:http_amdb/MVVM/model/movies_model.dart';
import 'package:http_amdb/MVVM/resources/components/app_url.dart';

import 'package:http_amdb/MVVM/data/network/network_api_service.dart';

class HomeRepository {
  NetworkApiService _apiservice = NetworkApiService();
  List<MoviesList> list = [];
  Future<dynamic> GetMOviesList() async {
    try {
      final response = await _apiservice.FetchGetApi(AppUrl.movieslist);
   
      for (Map<String, dynamic> i in response) {
        list.add(MoviesList.fromJson(i));
        
      }
      return list;
    } catch (e) {
      throw e;
    }
  }
}
