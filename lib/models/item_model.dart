class ItemModel{
  String? name;
  String? price;
  String? people;
  String? rooms;
  String? location;
  //String? service;
  String? image;

  ItemModel(this.name, this.price, this.people, this.rooms, this.location, this.image);

  Map<String, dynamic> toMap(){
    return{
      "name":name,
      "price":price,
      "people":people,
      "rooms":rooms,
      "location":location,
      //"service":service,
      "image":image,
    };
  }

  // List<ItemModel> recommendation = [];
  // List<ItemModel> nearby = [];
}