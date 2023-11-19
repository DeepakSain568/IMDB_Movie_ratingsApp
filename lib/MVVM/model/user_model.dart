class UserModel {
  String? token;

  UserModel({this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }
  factory UserModel.fun(Map<String, dynamic> json) {
    
    return UserModel(token:json['token'] );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }

  // String toString() {
  //   return '$token';
  // }
}
