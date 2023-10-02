import 'package:apartment_app/components/default_text_field.dart';
import 'package:apartment_app/cubits/auth/auth_cubit.dart';
import 'package:apartment_app/db/offline/shared_helper.dart';

import 'package:apartment_app/screens/home_screen.dart';
import 'package:apartment_app/screens/main_screen.dart';
import 'package:apartment_app/screens/register_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        body: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "image1.jpeg",
                  width: 300,
                  height: 150,
                ),
                Stack(
                  children: [
                    Card(
                      color: Colors.grey.shade300,
                      margin: EdgeInsets.only(top: 40),
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.45,
                        width: 300,
                        child: Padding(
                          padding: EdgeInsets.only(top: 45.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              DefaultTextField(
                                  controller: contactController,
                                  lable: "Contact Number",
                                  icon: Icons.person),
                              DefaultTextField(
                                  controller: passwordController,
                                  lable: "OTP",
                                  icon: Icons.lock),
                              BlocConsumer<AuthCubit, AuthState>(
                                listener: (context, state) {
                                  if (state is ErrorLoginState) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content:
                                                Text("Error....Try Again")));
                                  } else if (state is SuccessLoginState) {
                                    SharedHelper.prefs
                                        .setBool("isLogin", true)
                                        .then((value) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => MainScreen(),
                                          ));
                                    });
                                  }
                                },
                                builder: (context, state) {
                                  return state is LoadingLoginState
                                      ? Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : MaterialButton(
                                          onPressed: () {
                                            // Navigator.pushReplacement(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //       builder: (context) =>
                                            //           MainScreen(),
                                            //     ));

                                            AuthCubit.get(context)
                                                .login(contactController.text);
                                          },
                                          color: Colors.grey,
                                          child: Text("Login"),
                                        );
                                },
                              ),
                              Text.rich(
                                TextSpan(
                                    text: "Don't have an Account? ",
                                    children: [
                                      TextSpan(
                                          text: "Sign Up",
                                          style: TextStyle(color: Colors.blue),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        RegistrationScreen(),
                                                  ));
                                            })
                                    ]),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: .0,
                        left: .0,
                        right: .0,
                        child: Center(
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.grey,
                            child: Icon(
                              Icons.person,
                              size: 35,
                              color: Colors.black,
                            ),
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
        //   appBar: AppBar(
        //   elevation: 0.0,
        //   backgroundColor: Colors.white,
        //   toolbarHeight: 80.0,
        //   title: Row(children: [Icon(Icons.arrow_back_ios,color: Colors.black,)],),
        // ),
        //   body: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Expanded(child: Image.asset("image1.jpeg", width: 300,height: 300,)),
        //       Container(
        //         alignment: Alignment.center,
        //         width: 400,
        //         height: 350,
        //         decoration: BoxDecoration(
        //           color: Colors.grey.shade200,
        //           borderRadius: BorderRadius.circular(10),
        //           border: Border.all(color: Colors.black, width: 1.0)
        //         ),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [

        //             DefaultTextField(controller: contactController, lable: "Contact Number", icon: Icons.person),
        //             DefaultTextField(controller:passwordController, lable: "OTP", icon: Icons.lock),
        //             Container(
        //               //margin: EdgeInsets.only(right: 50, top: 10),
        //               margin: EdgeInsets.all(20),
        //               alignment: Alignment.bottomRight,
        //               child: MaterialButton(onPressed: (){
        //                 Navigator.push(context,
        //                  MaterialPageRoute(builder: (context) => HomeScreen(),));
        //               } , child: Text("Sign In", style: TextStyle(color: Colors.black),),
        //               color: Colors.white,
        //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),),
        //             ),
        //         ],),
        //       ),

        //       Container(
        //             margin: EdgeInsets.all(50),
        //             alignment: Alignment.bottomRight,
        //             child: RichText(
        //               text: TextSpan(
        //                children: [
        //                 TextSpan(text: "Don't Have An Accouun? ", style: TextStyle(color: Colors.black)),
        //                 TextSpan(
        //                   text: "Sign Up",
        //                   style: TextStyle(color: Colors.blue),
        //                   recognizer: TapGestureRecognizer()..onTap = () {
        //                     Navigator.push(
        //                       context,
        //                        MaterialPageRoute(
        //                         builder: (context) => RegistrationScreen(),));
        //                   }

        //                 )
        //                ]
        //               )),
        //           )
        //     ],
        //   ),
      ),
    );
  }
}
