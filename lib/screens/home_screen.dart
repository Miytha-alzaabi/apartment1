import 'package:apartment_app/components/item_card.dart';
import 'package:apartment_app/cubits/apartment/apartment_cubit.dart';
import 'package:apartment_app/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ItemModel> items = [
    ItemModel("Apartment Name 1", "250.0", "1", "1", "Sur", "image2.jpg"),
    ItemModel("Apartment Name 2", "350.0", "2", "3", "Muscat", "image3.jpg"),
    ItemModel("Apartment Name3", "300.0", "2", "2", "Adam", "image4.jpg"),
    ItemModel("Apartment Name 4", "200.0", "1", "1", "Bausher", "image5.jpg"),
    ItemModel("Apartment Name 5", "400.0", "2", "2", "Sohar", "image6.jpg"),
    ItemModel("Apartment Name 6", "500.0", "2", "2", "Muscat", "image7.jpg"),
    ItemModel("Apartment Name 7", "300.0", "3", "5", "Seeb", "image8.jpeg"),
    ItemModel("Apartment Name 8", "3500.0", "1", "2", "Muscat", "image9.jpg"),
    ItemModel("Apartment Name 9", "400.0", "2", "3", "Ibra", "image10.jpg"),
    ItemModel(
        "Apartment Name 10", "500.0", "1", "1", "Muscat", "assets/image1.jpeg"),
    ItemModel("Apartment Name 11", "600.0", "3", "4", "Rustaq", "image1.jpeg"),
    ItemModel(
        "Apartment Name 12", "350.0", "1", "2", "Shinas", "assets/image1.jpeg"),
  ];

  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = ApartmentCubit.get(context);
    cubit.searchApartment = cubit.items;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //!------------------------------------------------

              SearchBar(
                controller: controller,
                onChanged: (value) {
                  cubit.Search(value);
                },
                trailing: [
                  IconButton(
                      onPressed: () {
                        cubit.Search(controller.text);
                      },
                      icon: Icon(Icons.search))
                ],
              ),
              // Container(
              //   width: MediaQuery.sizeOf(context).width,
              //   height: MediaQuery.sizeOf(context).height * .2,
              //   decoration: BoxDecoration(color: Colors.white),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       Flexible(
              //         //flex: 2,
              //         //fit: FlexFit.loose,
              //         child: Row(
              //           children: [
              //             IconButton(
              //                 onPressed: () {},
              //                 icon: Icon(Icons.arrow_back_ios)),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //       //? To Do---------
              //       Row(
              //         children: [Text("Row2")],
              //       )
              //     ],
              //   ),
              // ),
              //!-------------------------------------------------------------
              BlocBuilder<ApartmentCubit, ApartmentState>(
                builder: (context, state) {
                  return cubit.searchApartment.isEmpty
                      ? Center(
                          child: Text("Not Exists"),
                        )
                      : Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: cubit.searchApartment.length,
                            itemBuilder: (context, index) => ItemCard(
                              item: cubit.searchApartment[index],
                            ),
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
