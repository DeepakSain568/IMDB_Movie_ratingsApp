import 'package:http_amdb/MVVM/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(
      {required this.status, required this.data, required this.message});

  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.error(this.message) : status = Status.ERROR;
  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  @override
  String toString() {
    return 'Status:$status \n Data : $data \n message: $message';
  }
}
