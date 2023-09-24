import 'package:apartment_app/models/item_model.dart';
import 'package:apartment_app/screens/apartment_screen.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
   ItemCard({super.key, required this.item, });

  ItemModel item;
  

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade300,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,MaterialPageRoute(builder: (context) => ApartmentScreen(items: item,),));
          
        },

        leading: Container(width: 50, height: 50,decoration: BoxDecoration(image: DecorationImage(image: AssetImage(item.image!))),),
        title: Text(item.name!),
        subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Price: " +item.price!),Text("No. Rooms: " +item.rooms!),Text("Locartion: " +item.location!)],),
      ),
    );
  }
}