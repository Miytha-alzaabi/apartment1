import 'package:apartment_app/components/text_field_form.dart';
import 'package:flutter/material.dart';

class AddApartmentScreen extends StatelessWidget {
  const AddApartmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("image1.jpeg"),
          Center(
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.6,
                width: MediaQuery.sizeOf(context).width * 0.7,
                child: Card(
                  semanticContainer: true,
                  color: Colors.grey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldForm(
                          labelText: "Enter Apartment Name",
                          icon: Icon(Icons.house_rounded)),
                      Row(
                        children: [
                          Flexible(
                              child: TextFieldForm(
                                  labelText: "Enter Price",
                                  icon: Icon(Icons.attach_money_rounded))),
                          Flexible(
                              child: TextFieldForm(
                                  labelText: 'Enter Number of Peiple',
                                  icon: Icon(Icons.person_add_alt_1)))
                        ],
                      ),
                      TextFieldForm(
                          labelText: "Enter Numbers of Rooms",
                          icon: Icon(Icons.add_home_rounded)),
                      TextFieldForm(
                          labelText: "Enter Location",
                          icon: Icon(Icons.location_on)),
                          TextFieldForm(
                          labelText: "Select Services",
                          icon: Icon(Icons.location_on)),
                           MaterialButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          color: Colors.black,
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                          child: const Text("Add",style: TextStyle(
                            color: Colors.white
                          ),),
                        )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),


    );
  }
}
