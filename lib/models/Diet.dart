import 'package:flutter/material.dart';

class DietModel{
  String Name;
  String IconPath;
  String description;
  Color tricolor;
  // String button;

  DietModel({
    required this.Name,
    required this.IconPath,
    required this.description,
    required this.tricolor,
    // required this.button
  });

  static List<DietModel> getDiet(){
    List<DietModel> diets = [];

    diets.add(
      DietModel(
        Name: 'Salad', 
        IconPath: 'assets/icons/sal.svg', 
        description: 'Good for Health',
        tricolor: Colors.amberAccent),
    );

    diets.add(
      DietModel(
        Name: 'Pancake', 
        IconPath: 'assets/icons/pan.svg', 
        description: '2 pieces', 
        tricolor: Colors.cyanAccent)
    );

    diets.add(
      DietModel(
        Name: 'Opur Dim',
        IconPath: 'assets/icons/egg.svg',
        description: '3 pieces',
        tricolor: Colors.orangeAccent
        // tricolor: Color.fromARGB(179, 40, 109, 59)
      )
    );

    return diets;
  }
}