import 'package:apartment_app/models/item_model.dart';
import 'package:apartment_app/screens/apartment_screen.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  ItemCard({
    super.key,
    required this.item,
  });

  ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ApartmentScreen(items: item),
              ));
        },
        child: Card(
          semanticContainer: true,
          color: Colors.grey.shade300,
          child: ListTile(
            leading: Image.asset(item.image!),
            title: Text(item.name!),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                         const SizedBox(
                          height: 20,
                        ),
                        Text("Price: " + item.price!),
                        const SizedBox(width: 20,),
                        Text("Noumber of People: "+ item.people!)
                      ],
                    ),
                    Row(
                      children: [
                        // SizedBox(
                        //   height: 20,
                        // ),
                        Text("Noumber of Rooms: " + item.rooms!),
                        SizedBox(width: 25,),
                        Text("Location: "+ item.location!)
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // return Card(
    //   color: Colors.grey.shade300,
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    //   child: ListTile(
    //     onTap: () {
    //       Navigator.push(
    //         context,MaterialPageRoute(builder: (context) => ApartmentScreen(items: item,),));

    //     },

    //     leading: Container(width: 50, height: 50,decoration: BoxDecoration(image: DecorationImage(image: AssetImage(item.image!))),),
    //     title: Text(item.name!),
    //     subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Price: " +item.price!),Text("No. Rooms: " +item.rooms!),Text("Locartion: " +item.location!)],),
    //   ),
    // );
  }
}
