import 'dart:async';
import 'dart:convert';
import 'package:http_amdb/MVVM/data/app_exceptions.dart';
import 'package:http_amdb/MVVM/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  @override
  Future FetchGetApi(String url) async {
      
    dynamic jsonresponse;
    try {
      final response =
          await http.get(Uri.parse(url),headers: {
    "X-RapidAPI-Key": "0b94157effmsh0acffe44d8f7dd9p12738bjsnb313a1d8ae23",
    "X-RapidAPI-Host": "imdb-top-100-movies.p.rapidapi.com",
    "useQueryString": "true"
  } ).timeout(Duration(seconds: 10));
  
      jsonresponse = returnResponse(response);
    } catch(e){
      throw e; 
    }
    return jsonresponse;
  }

  @override
  Future FetchPostApi(String url, dynamic body) async {
    dynamic jsonresponse;
    try {
      final response = await http
          .post(Uri.parse(url), body: body)
          .timeout(Duration(seconds: 20));
      jsonresponse = returnResponse(response);
    } catch(e) {
      throw e; 
    }
    return jsonresponse;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnautorizedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occurred while communicating with server: ' +
                response.statusCode.toString());
    }
  }
}
