import 'package:code_swift/core/cubit/login_cubit/login_cubit.dart';
import 'package:code_swift/manager/color_manager.dart';
import 'package:code_swift/manager/font_manager.dart';
import 'package:code_swift/manager/space_manager.dart';
import 'package:code_swift/utils/dimensions.dart';
import 'package:code_swift/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Form(
        key: formKey,
        child: ListView(
          children: [
            SizedBox(
              height: screenHeight(context) * 0.25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login Screen',
                  style: appFont.f18w1000Black,
                ),
              ],
            ),
            appSpaces.spaceForHeight20,
            ...List.generate(
              2,
              (index) {
                List<String> hints = ['Enter email', 'Enter password'];
                List<TextEditingController> contrllers = [
                  emailController,
                  passwordController
                ];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: TextFormField(
                    controller: contrllers[index],
                    decoration: InputDecoration(
                      labelText: hints[index],
                      filled: true,
                      fillColor: appColors.primary.withOpacity(0.2),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.red)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: appColors.primary)),
                    ),
                    validator: (value) {
                      if (value == null || value == '') {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),
                );
              },
            ),
            appSpaces.spaceForHeight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                   if(state is LoginSuccessState){
                      Get.snackbar('Success', 'Login Successfull');
                      Get.toNamed('/detailsScreen');
                   }else if(state is LoginErrorState){
                    Get.snackbar('Failed', state.error.message);
                   }
                  },
                  builder: (context, state) {
                    return state is !LoginLoadingState? PrimaryButton(
                      backgroundColor: appColors.primary,
                      titleStyle: appFont.f14w600White,
                      height: 45,
                      width: screenWidth(context) - 150,
                      title: 'Login',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<LoginCubit>(context).loginUser(
                              userMail: emailController.text.trim(),
                              pasword: passwordController.text.trim());
                        }
                      },
                    ):Container(height: 45,width: screenWidth(context)-150,decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: appColors.primary
                    ),child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text('Wait',style: appFont.f14w600White,),
                      appSpaces.spaceForWidth10,
                     const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(color: Colors.white,))
                    ],),);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
