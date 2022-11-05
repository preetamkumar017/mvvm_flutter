import 'package:flutter_application_1/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;
  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.complited() : status = Status.COMPLITED;
  ApiResponse.error() : status = Status.ERROR;

  @override
  String toString() {
    return "Status: $status \n message: $message \n data: $data";
  }
}
