part of 'vehicle_cubit.dart';

abstract class VehicleState {}

 class VehicleInitial extends VehicleState {}

 /// THESE STATES FOR FETCHING VEHICLE DETAILS
 class VehicleFetchLoading extends VehicleState{}
 
 class VehicleFetchSuccess extends VehicleState{
  final VehicleModel vehicleModel;

  VehicleFetchSuccess({required this.vehicleModel});
 }
 
 class VehicleFetchError extends VehicleState{
  final ErrorModel error;

  VehicleFetchError({required this.error});
 }