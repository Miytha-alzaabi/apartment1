import 'package:apartment_app/cubits/apartment/apartment_cubit.dart';
import 'package:apartment_app/cubits/auth/auth_cubit.dart';
import 'package:apartment_app/cubits/change/change_cubit.dart';
import 'package:apartment_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ApartmentCubit(),
          ),
          BlocProvider(create: (context) => ChangeCubit(),),
          BlocProvider(create: (context) => AuthCubit(),),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ));
  }
}


