import 'package:code_swift/core/models/error_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';


ErrorModel errorHandler(Response? response, dynamic error) {
  if (response != null) {
    if (kDebugMode) {
      print('==Error after getting response ${response.body}');
    }
    if (response.statusCode == 400) {
      return ErrorModel(error, 'Bad request');
    } else {
      return ErrorModel(error, 'Bad request');
    }
  } else {
    if (kDebugMode) {
      print('some thing wrong $error');
    }
    return ErrorModel(error, 'Something went wrong');
  }
}
