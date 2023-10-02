import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'change_state.dart';

class ChangeCubit extends Cubit<ChangeState> {
  ChangeCubit() : super(ChangeInitial());

  static ChangeCubit get(context) => BlocProvider.of(context);

    int selectedScreen = 0;

  void Changes(int index) {
  selectedScreen = index;
  emit(ChangeScreen());
}
}
