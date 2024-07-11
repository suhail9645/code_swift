import 'dart:convert';

import 'package:code_swift/core/models/error_model.dart';
import 'package:code_swift/core/models/vehicle_model.dart';
import 'package:code_swift/manager/url_manager.dart';
import 'package:code_swift/utils/error_handler.dart';
import 'package:either_dart/either.dart';

import 'package:http/http.dart';

class VehicleRepo{
  Future<Either<ErrorModel,VehicleModel>>getVehicleDetails()async{
    try {
      final response=await get(Uri.parse('https://deverpnextgaadi.codeswift.in/api/resource/Item/STO-ITEM-2024-00005')
      ,headers: {
         'Authorization':'token $apiKey:$apiSecret',
      }
      );
      if(response.statusCode==200){
        VehicleModel vehicleModel=VehicleModel.fromJson(jsonDecode(response.body)['data']);
        return Right(vehicleModel);
      }else{
        return Left(errorHandler(response, null));
      }
    } catch (e) {
      return Left(errorHandler(null, e));
    }
  }
}