import 'package:code_swift/core/cubit/cubit/vehicle_cubit.dart';
import 'package:code_swift/core/cubit/login_cubit/login_cubit.dart';

import 'package:code_swift/core/repo/login_repo.dart';
import 'package:code_swift/core/repo/vehicle_repo.dart';
import 'package:code_swift/manager/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const CodeSwift());
}

class CodeSwift extends StatelessWidget {
  const CodeSwift({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
     providers: [
      RepositoryProvider(create: (context) => LoginRepo(),),
      RepositoryProvider(create: (context) => VehicleRepo(),)
     ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginCubit(context.read<LoginRepo>()),
          
          ),
          BlocProvider(create: (context) => VehicleCubit(context.read<VehicleRepo>()),)
        ],
        child: GetMaterialApp(
          title: 'CodeSwift',
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              textTheme: GoogleFonts.poppinsTextTheme()),
          initialRoute: '/',
          getPages: getPages(),
        ),
      ),
    );
  }
}
