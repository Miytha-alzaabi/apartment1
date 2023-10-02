import 'package:apartment_app/db/offline/shared_helper.dart';
import 'package:apartment_app/screens/login_screen.dart';
import 'package:apartment_app/screens/main_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  _getData(BuildContext context) {
    
    
    //bool? isLogin = SharedHelper.prefs.getBool("isLogin");
    bool isLogin = true;

    if (isLogin == null || !isLogin) {
      Future.delayed(const Duration(seconds: 3)).then((value) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
      });
    } else {
      Future.delayed(const Duration(seconds: 3)).then((value) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainScreen(),
            ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _getData(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "image1.jpeg",
              width: 300,
              height: 150,
            ),
            const CircularProgressIndicator(
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
