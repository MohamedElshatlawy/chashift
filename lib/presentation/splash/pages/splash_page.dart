import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:koin_flutter/koin_flutter.dart';
import 'package:shiftapp/data/repositories/user/user_repository.dart';
import 'package:shiftapp/presentation/home/home.dart';
import 'package:shiftapp/presentation/login/pages/login_page.dart';
import 'package:shiftapp/presentation/resources/colors.dart';

class SplashScreen extends StatelessWidget {
  static const routeName='/';
  static void restartApp(BuildContext context) {

  }
  navigateToNext(bool isLogged, BuildContext context) async {
    await Future.delayed(const Duration(seconds: 5));

    if (isLogged) {
      Navigator.pushReplacementNamed(context,MyHomePage.routeName);
    } else {
      Navigator.pushReplacementNamed(context,LoginPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final userRepo = getKoin().get<UserRepository>();

    navigateToNext(userRepo.isLogged(), context);
    return Scaffold(
      body: Container(
        child: Center(child: Image.asset("images/logo.png",height:100 ,)),
      ),
    );
  }
}
