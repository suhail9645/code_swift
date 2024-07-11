import 'dart:convert';

import 'package:code_swift/core/models/error_model.dart';
import 'package:code_swift/manager/url_manager.dart';
import 'package:code_swift/utils/error_handler.dart';
import 'package:http/http.dart';

class LoginRepo {
  Future<ErrorModel?> loginUser(
      {required String userMail, required String pasword}) async {
    try {
      final response = await post(
          Uri.parse(
              'https://deverpnextgaadi.codeswift.in/api/method/library_management.signin.login'),
          body: 
            {"usr": userMail, "pwd": pasword}
          );
          if(response.statusCode==200){
            /// WE CAN STORE USER DATA 
            if(jsonDecode(response.body)['message']['api_key']!=null){
              
apiKey=jsonDecode(response.body)['message']['api_key'];
            apiSecret=jsonDecode(response.body)['message']['api_secret'];
          print(apiKey);
          print(apiSecret);
            return null;
            }else{
              return ErrorModel('Authentication Failed', 'Wrong Credentials');
            }
            
          }
          /// HANDLING THE ERRORS
         return errorHandler(response, null);
    } catch (e) {
     return errorHandler(null, e);
    }
  }
}
