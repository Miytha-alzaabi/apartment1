import 'dart:convert';
import 'dart:io';

import 'package:apartment_app/components/default_radio_button.dart';
import 'package:apartment_app/components/default_text_field.dart';
import 'package:apartment_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  var NameController = TextEditingController();
  var IDCardController = TextEditingController();
  var contactController = TextEditingController();
  var userType;

  SharedPreferences? prefs;

  File? image;
  final ImagePicker picker = ImagePicker();
  @override
  void initState() {
    // TODO: implement initState
    _getData();
    super.initState();
  }

  _getData() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Stack(
              children: [
                Card(
                  color: Colors.grey.shade300,
                  margin: EdgeInsets.only(top: 40),
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.85,
                    width: 300,
                    child: Padding(
                      padding: EdgeInsets.only(top: 45.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          DefaultTextField(
                              controller: NameController,
                              lable: "First Name",
                              icon: Icons.person),
                          DefaultTextField(
                              controller: IDCardController,
                              lable: "ID Card No.",
                              icon: Icons.person),
                          DefaultTextField(
                              controller: contactController,
                              lable: "Contact Number",
                              icon: Icons.person),
                          DefaultRadioButton(),
                          MaterialButton(
                            onPressed: () async {
                              UserModel users = UserModel(
                                  name: NameController.text,
                                  id: IDCardController.text,
                                  contact: contactController.text,
                                  userType: userType);

                              String data = jsonEncode(users.toMap());

                              if (prefs!.containsKey(IDCardController.text)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("ID Alredy Exists")));
                              } else {
                                prefs!
                                    .setString(IDCardController.text, data)
                                    .then((value) => Navigator.pop(context));
                              }
                              //Navigator.pop(context);
                            },
                            color: Colors.grey,
                            child: Text("Create Account"),
                          ),
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
                      child: image == null
                          ? InkWell(
                              child: Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.blueGrey),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                  size: 40,
                                ),
                              ),
                              onTap: () async {
                                final XFile? file = await picker.pickImage(
                                    source: ImageSource.gallery);
                                image = File(file!.path);
                              },
                            )
                          : CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.blueGrey,
                              backgroundImage: FileImage(image!),
                            ),
                    ))
              ],
            ),
          ),
        ),
        
      ),
    );
  }
}
