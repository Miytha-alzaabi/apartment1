class UserModel{
  String? name;
  String? id;
  String? contact;
  String? userType;

  UserModel({this.name, this.id, this.contact, this.userType});

  Map<String, dynamic> toMap(){
    return{
      "name":name,
      "id":id,
      "contact":contact,
      "userType":userType,

    };
  }
}