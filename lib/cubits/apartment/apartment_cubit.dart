import 'dart:convert';

import 'package:apartment_app/models/item_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'apartment_state.dart';

class ApartmentCubit extends Cubit<ApartmentState> {
  ApartmentCubit() : super(ApartmentInitial());

  static ApartmentCubit get(context) => BlocProvider.of(context);

  List<ItemModel> items =[
    ItemModel("Apartment Name 1", "250.0", "1","1", "Sur", "image2.jpg"),
    ItemModel("Apartment Name 2", "350.0", "2","3", "Muscat", "image3.jpg"),
    ItemModel("Apartment Name3", "300.0", "2","2", "Adam", "image4.jpg"),
    ItemModel("Apartment Name 4", "200.0", "1","1", "Bausher", "image5.jpg"),
    ItemModel("Apartment Name 5", "400.0","2", "2", "Sohar", "image6.jpg"),
    ItemModel("Apartment Name 6", "500.0", "2", "2", "Muscat", "image7.jpg"),
    ItemModel("Apartment Name 7", "300.0", "3","5", "Seeb", "image8.jpeg"),
    ItemModel("Apartment Name 8", "3500.0", "1","2", "Muscat", "image9.jpg"),
    ItemModel("Apartment Name 9", "400.0","2", "3", "Ibra", "image10.jpg"),
    ItemModel("Apartment Name 10", "500.0", "1","1", "Muscat", "assets/image1.jpeg"),
    ItemModel("Apartment Name 11", "600.0", "3","4", "Rustaq", "image1.jpeg"),
    ItemModel("Apartment Name 12", "350.0", "1","2", "Shinas", "assets/image1.jpeg"),
    
  ];

  List<ItemModel> searchApartment = [];

  void Search (String text){
    searchApartment = items.where((element) => element.name!.toLowerCase().contains(text.toLowerCase())).toList();
    emit(SearchApartmentState());
  }

  List<ItemModel> properties = [];

  void addApartment() async{
    // SharedPreferences prefs = await SharedPreferences.getInstance();

    // String data = jsonEncode(items[index].toMap());
    // prefs.setString(items.[index].name!, value)
    // for (var element in items) {
    //   properties.add(ItemModel);
    // }
    emit(AddApartmentState());

  }
}
