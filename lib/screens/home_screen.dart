import 'package:apartment_app/components/item_card.dart';
import 'package:apartment_app/models/item_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<ItemModel> items =[
    ItemModel("Apartment1", "300.0", "2", "Sohar", "image1.jpeg"),
    ItemModel("Apartment2", "500.0", "2", "Muscat", "assets/image1.jpeg"),
    ItemModel("Apartment1", "300.0", "2", "Sohar", "image1.jpeg"),
    ItemModel("Apartment2", "500.0", "2", "Muscat", "assets/image1.jpeg"),
    ItemModel("Apartment1", "300.0", "2", "Sohar", "image1.jpeg"),
    ItemModel("Apartment2", "500.0", "2", "Muscat", "assets/image1.jpeg"),
    ItemModel("Apartment1", "300.0", "2", "Sohar", "image1.jpeg"),
    ItemModel("Apartment2", "500.0", "2", "Muscat", "assets/image1.jpeg"),
    ItemModel("Apartment1", "300.0", "2", "Sohar", "image1.jpeg"),
    ItemModel("Apartment2", "500.0", "2", "Muscat", "assets/image1.jpeg"),
    ItemModel("Apartment1", "300.0", "2", "Sohar", "image1.jpeg"),
    ItemModel("Apartment2", "500.0", "2", "Muscat", "assets/image1.jpeg"),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * .2,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Flexible(
                  flex: 2,
                  fit: FlexFit.loose,
                  child: Row(children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios)),
                    Container(
                      alignment: Alignment.center,
                      width: 250,
                      height: 50,
                      child: TextFormField(decoration: InputDecoration(
                        hintText: "Search",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                      ),),
                    ),
                    ],
                    ),
                ),

                Row(children: [Text("Row2")],)
              ],),
            ),
      
             Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              decoration: BoxDecoration(color: Colors.white),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) => ItemCard(item: items[index], ),),
            ),
          ],
        ),
      ),
    );
  }
}