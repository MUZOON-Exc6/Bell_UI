import 'package:signup/Models/Cities.dart';

class CityVm{
  List <City> loadCities(){
     return [
       City(name: "Hadramout", value: "Ha"),
       City(name: "Sana", value: "Sa"),
       City(name: "Aden", value: "Ad"),
       City(name: "Taiz", value: "Ta"),
  ];
}
}