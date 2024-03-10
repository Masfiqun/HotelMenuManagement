import 'package:flutter/material.dart';

class DietModel{
  String Name;
  String IconPath;
  Color tricolor;

  DietModel({
    required this.Name,
    required this.IconPath,
    required this.tricolor
  });

  static List<DietModel> getDiet(){
    List<DietModel> diets = [];

    diets.add(
      DietModel(
        Name: 'Salad', 
        IconPath: 'assets/icons/sal.svg', 
        tricolor: Colors.amberAccent)
    );

    return diets;
  }
}