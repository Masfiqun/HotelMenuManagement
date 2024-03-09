import 'package:flutter/material.dart';

class CategoryModel{
  String name;
  String iconPath;
  Color boxcolor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxcolor,
  });

  static List<CategoryModel> getCategories(){
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        name: 'Salad', 
        iconPath: 'assets/icons/sal.svg', 
        boxcolor: Colors.deepPurpleAccent
      )
    );

     categories.add(
      CategoryModel(
        name: 'Cake', 
        iconPath: 'assets/icons/cake.svg', 
        boxcolor: Colors.lightBlueAccent
      )
     );

     categories.add(
      CategoryModel(
        name: 'Pie', 
        iconPath: 'assets/icons/pi.svg', 
        boxcolor: Colors.deepPurpleAccent
      )
     );

      categories.add(
      CategoryModel(
        name: 'Snacks', 
        iconPath: 'assets/icons/sn.svg', 
        boxcolor: Colors.lightBlueAccent
      )
     );


    return categories;
  }

}