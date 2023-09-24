import 'package:apartment_app/components/item_card.dart';
import 'package:apartment_app/models/item_model.dart';
import 'package:flutter/material.dart';

class ApartmentScreen extends StatefulWidget {
   ApartmentScreen({super.key, required this.items, });
  ItemModel items;
  

  @override
  State<ApartmentScreen> createState() => _ApartmentScreenState();
}

class _ApartmentScreenState extends State<ApartmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            decoration: BoxDecoration(color: Colors.grey.shade300),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: widget.items.name
              ),
            ),

            
          ),
    );
  }
}