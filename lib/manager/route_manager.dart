import 'package:code_swift/presentation/details_screen/details_screen.dart';
import 'package:code_swift/presentation/login_screen/login_screen.dart';
import 'package:get/get.dart';


List<GetPage>getPages(){
  return [
     GetPage(name: '/', page: () =>const LoginScreen(),),

     GetPage(name: '/detailsScreen', page: () =>const DetailsScreen(),)
  ];
}