import 'package:apartment_app/components/default_text_field.dart';
import 'package:apartment_app/screens/home_screen.dart';
import 'package:apartment_app/screens/register_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var contactController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        toolbarHeight: 80.0,
        title: Row(children: [Icon(Icons.arrow_back_ios,color: Colors.black,)],),
      ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Image.asset("image1.jpeg", width: 300,height: 300,)),
            Container(
              alignment: Alignment.center,
              width: 400,
              height: 350,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 1.0)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  DefaultTextField(controller: contactController, lable: "Contact Number", icon: Icons.person),
                  DefaultTextField(controller:passwordController, lable: "OTP", icon: Icons.lock),
                  Container(
                    //margin: EdgeInsets.only(right: 50, top: 10),
                    margin: EdgeInsets.all(20),
                    alignment: Alignment.bottomRight,
                    child: MaterialButton(onPressed: (){
                      Navigator.push(context,
                       MaterialPageRoute(builder: (context) => HomeScreen(),));
                    } , child: Text("Sign In", style: TextStyle(color: Colors.black),),
                    color: Colors.white, 
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),),
                  ),
              ],),
            ),

            Container(
                  margin: EdgeInsets.all(50),
                  alignment: Alignment.bottomRight,
                  child: RichText(
                    text: TextSpan(
                     children: [
                      TextSpan(text: "Don't Have An Accouun? ", style: TextStyle(color: Colors.black)),
                      TextSpan(
                        text: "Sign Up",
                        style: TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          Navigator.push(
                            context,
                             MaterialPageRoute(
                              builder: (context) => RegistrationScreen(),));
                        }
                
                      )
                     ] 
                    )),
                )
          ],
        ),
      ),
    );
  }
}