import 'package:apartment_app/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  final List<UserModel> users = [
    UserModel(name: "user1", id: "123", contact: "123456", userType: "user"),
    UserModel(name: "user2", id: "456", contact: "1987456", userType: "owner")
  ];

  Future<void> login( String contactNumber) async {
    emit(LoadingLoginState());

    final prefs = await SharedPreferences.getInstance();
    final savedContactNumber = prefs.getString(contactNumber);

    if (savedContactNumber != null && savedContactNumber == contactNumber) {
      emit(SuccessLoginState());

       }else{

        emit(ErrorLoginState());
      }
    
  }

}
