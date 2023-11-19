import 'package:http_amdb/MVVM/model/user_model.dart';
import 'package:http_amdb/MVVM/repository/auth_repo.dart';
import 'package:http_amdb/MVVM/utils/routes/routes_names.dart';
import 'package:http_amdb/MVVM/utils/utils.dart';
import 'package:http_amdb/MVVM/view_model/user_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthViewModel with ChangeNotifier {
  final _myrepo = AuthRepository();

  bool _loading = false;

  bool get Loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic body, BuildContext context) async {
    print('loginApi');
    setLoading(true);

    _myrepo.UserLogin(body).then((value) {
      setLoading(false);

      if (kDebugMode) {
        print("value-->" + value.toString());
        UserViewModel().SaveUser(UserModel.fun(value));
        Utils.snakBar('login succesful', context);
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print("loginApi Error-->" + error.toString());

        Utils.FlushBarErrorMessage(error.toString(), context);
      }
    });
  }

  Future<void> signupApi(dynamic body, BuildContext context) async {
    print('signupApi');
    setLoading(true);
    final response = await _myrepo.UserSignup(body).then((value) {
      setLoading(false);
      if (kDebugMode) {
        print("value-->" + value);
      
        Utils.snakBar('Registration succesful', context);
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print("loginApi Error-->" + error.toString());

        Utils.FlushBarErrorMessage(error.toString(), context);
      }
    });
  }
}
