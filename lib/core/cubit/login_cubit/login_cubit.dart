import 'package:bloc/bloc.dart';
import 'package:code_swift/core/models/error_model.dart';
import 'package:code_swift/core/repo/login_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
 final LoginRepo repo;
  LoginCubit(this.repo) : super(LoginInitial());

   Future<void> loginUser(
      {required String userMail, required String pasword}) async {
        emit(LoginLoadingState());
        final error=await repo.loginUser(userMail: userMail, pasword: pasword);
        ///SUCCESS
        if(error==null){
           emit(LoginSuccessState());
        }
        ///FAILED
        else{
         emit(LoginErrorState(error: error));
        }
      }
}
