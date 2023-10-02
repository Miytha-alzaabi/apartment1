import 'package:apartment_app/cubits/change/change_cubit.dart';
import 'package:apartment_app/screens/add_apartment_screen.dart';
import 'package:apartment_app/screens/apartment_screen.dart';
import 'package:apartment_app/screens/home_screen.dart';
import 'package:apartment_app/screens/profile_screen.dart';
import 'package:apartment_app/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
   MainScreen({super.key});

  List<Widget> screens = [HomeScreen(), AddApartmentScreen(), SettingScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    var cubit = ChangeCubit.get(context);
    return Scaffold(bottomNavigationBar: BlocBuilder<ChangeCubit, ChangeState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: cubit.selectedScreen,
          onTap: (value) {
            cubit.Changes(value);
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.add_chart), label: "Add"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Setting"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Profile"),
          ],
        );
      },
    ), body: BlocBuilder<ChangeCubit, ChangeState>(builder: (context, state) {
      return screens[cubit.selectedScreen];
    }));
  }
}
