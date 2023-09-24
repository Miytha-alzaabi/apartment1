import 'dart:convert';

import 'package:apartment_app/components/default_radio_button.dart';
import 'package:apartment_app/components/default_text_field.dart';
import 'package:apartment_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  var NameController = TextEditingController();
  var IDCardController = TextEditingController();
  var contactController = TextEditingController();
  var userType ;

  SharedPreferences? prefs;
  
  @override
  void initState() {
    // TODO: implement initState
    _getData();
    super.initState();
  }

  _getData() async{
    prefs = await SharedPreferences.getInstance();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
             Expanded(child: Image.asset("image1.jpeg", width: 300,height: 300,)),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(20),
              width: 400,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  
        
                  DefaultTextField(controller: NameController, lable: "First Name", icon: Icons.person),
                  DefaultTextField(controller: IDCardController, lable: "ID Card No.", icon: Icons.person),
                  DefaultTextField(controller: contactController, lable: "Contact Number", icon: Icons.person),
                  DefaultRadioButton(),
                  
                  Container(
                    
                    margin: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: MaterialButton(onPressed: () async{

                      UserModel users = UserModel(
                        name: NameController.text,
                        id: IDCardController.text,
                        contact: contactController.text,
                        userType: userType

                      );

                      String data = jsonEncode(users.toMap());

                      if(prefs!.containsKey(IDCardController.text)){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("ID Alredy Exists")));
                      }
                      else
                      {
                        prefs!.setString(IDCardController.text, data).then((value) => Navigator.pop(context));
                      }

                    } , child: Text("Reigster", style: TextStyle(color: Colors.black),),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),),
                  ),
              ],),
            ),

            
        
            
          ],
        ),
      ),
    );
  }
}



