import 'package:flutter/material.dart';

class DietModel{
  String Name;
  String IconPath;
  String description;
  String duration;
  bool viewIsSelected;
  Color tricolor;
  // String button;

  DietModel({
    required this.Name,
    required this.IconPath,
    required this.description,
    required this.duration,
    required this.viewIsSelected,
    required this.tricolor,
    // required this.button
  });

  static List<DietModel> getDiet(){
    List<DietModel> diets = [];

    diets.add(
      DietModel(
        Name: 'Salad', 
        IconPath: 'assets/icons/sal.svg', 
        description: 'Mixed',
        duration: '20 mins',
        viewIsSelected: true,
        tricolor: Colors.amberAccent),
    );

    diets.add(
      DietModel(
        Name: 'Pancake', 
        IconPath: 'assets/icons/pan.svg', 
        description: '2 pieces', 
        duration: '30 mins',
        viewIsSelected: true,
        tricolor: Colors.cyanAccent)
    );

    diets.add(
      DietModel(
        Name: 'Boiled egg',
        IconPath: 'assets/icons/egg.svg',
        description: '3 pieces',
        duration: '15 mins',
        viewIsSelected: false,
        tricolor: Colors.orangeAccent
        // tricolor: Color.fromARGB(179, 40, 109, 59)
      )
    );

    return diets;
  }
}