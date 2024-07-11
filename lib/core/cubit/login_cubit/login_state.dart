part of 'login_cubit.dart';

abstract class LoginState {}

 class LoginInitial extends LoginState {}

 /// THESE STATES ARE FOR LOGIN 

 class LoginLoadingState extends LoginState{}

 class LoginSuccessState extends LoginState{}

 class LoginErrorState extends LoginState{
  final ErrorModel error;

  LoginErrorState({required this.error});
 }
