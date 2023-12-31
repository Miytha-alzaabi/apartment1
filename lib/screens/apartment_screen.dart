import 'package:apartment_app/components/item_card.dart';
import 'package:apartment_app/components/text_field_form.dart';
import 'package:apartment_app/models/item_model.dart';
import 'package:flutter/material.dart';

class ApartmentScreen extends StatefulWidget {
  ApartmentScreen({
    super.key,
    required this.items,
  });
  ItemModel items;
  

  @override
  State<ApartmentScreen> createState() => _ApartmentScreenState();
}

class _ApartmentScreenState extends State<ApartmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(widget.items.image!),
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
                          labelText: widget.items.name!,
                          icon: Icon(Icons.house_rounded)),
                      Row(
                        children: [
                          Flexible(
                              child: TextFieldForm(
                                  labelText: widget.items.price!,
                                  icon: Icon(Icons.attach_money_rounded))),
                          Flexible(
                              child: TextFieldForm(
                                  labelText: widget.items.people!,
                                  icon: Icon(Icons.person_add_alt_1)))
                        ],
                      ),
                      TextFieldForm(
                          labelText: widget.items.rooms!,
                          icon: Icon(Icons.add_home_rounded)),
                      TextFieldForm(
                          labelText: widget.items.location!,
                          icon: Icon(Icons.location_on)),
                          TextFieldForm(
                          labelText: "Services",
                          icon: Icon(Icons.location_on)),
                           MaterialButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          color: Colors.black,
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                          child: const Text("Save",style: TextStyle(
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

      //         MaterialButton(onPressed: (){
      //           for (var element in widget.properties) {

      //             widget.properties.add(element);
      //             print(element);

      //           }
      //         }, child: Text("ADD"),)

    );
  }
}
