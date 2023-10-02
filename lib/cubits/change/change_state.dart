part of 'change_cubit.dart';

@immutable
sealed class ChangeState {}

final class ChangeInitial extends ChangeState {}

class ChangeScreen extends ChangeState {}
