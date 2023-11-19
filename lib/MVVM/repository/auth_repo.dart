import 'package:http_amdb/MVVM/data/network/base_api_services.dart';
import 'package:http_amdb/MVVM/data/network/network_api_service.dart';
import 'package:http_amdb/MVVM/resources/components/app_url.dart';
// import 'package:dart/MVVM/model/user_model.dart';

class AuthRepository {
  BaseApiService _apiservice = NetworkApiService();

  Future<dynamic> UserLogin(dynamic body) async {
    print('Userlogin');

    try {
      dynamic response = await _apiservice.FetchPostApi(AppUrl.loginurl, body);
      return response;
    } catch (e) {
      print('userlogin error-->' + e.toString());
      throw e;
    }
  }

  Future<dynamic> UserSignup(dynamic body) async {
    try {
      dynamic response =
          await _apiservice.FetchPostApi(AppUrl.registerurl, body);
      return response;
    } catch (e) {
      print('usersignup error-->' + e.toString());
      throw e;
    }
  }
}
