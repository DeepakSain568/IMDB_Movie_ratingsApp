import 'package:http_amdb/MVVM/model/user_model.dart';
import 'package:http_amdb/MVVM/utils/routes/routes_names.dart';
import 'package:http_amdb/MVVM/view_model/user_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SplashServices {
  Future<UserModel> GetUserData() => UserViewModel().GetUser();

  void CheckAuthentication(BuildContext context) async {

    GetUserData().then((value) async {

      print(value.token);
      
      if (value.token == null || value.token == '') {

        await Future.delayed(Duration(seconds: 3));

        Navigator.pushNamed(context, RoutesName.Login);

      } else {

        await Future.delayed(Duration(seconds: 3));

        Navigator.pushNamed(context, RoutesName.home);

      }
    }).onError((error, stackTrace) {

      if (kDebugMode) {

        print(error.toString());

      }

    });
  }
}
