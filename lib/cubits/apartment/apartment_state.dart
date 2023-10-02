part of 'apartment_cubit.dart';

@immutable
sealed class ApartmentState {}

final class ApartmentInitial extends ApartmentState {}

class SearchApartmentState extends ApartmentState {}

class AddApartmentState extends ApartmentState {}
