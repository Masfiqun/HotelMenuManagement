// ignore_for_file: prefer_const_constructors

import 'package:fitness/models/Diet.dart';
import 'package:fitness/models/PopularModel.dart';
import 'package:fitness/models/category_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietModel> popularDiets = [];

  
  void _getinitialinfo(){
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiet();
    popularDiets = PopularDietModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getinitialinfo();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          search_field(),
          SizedBox(height: 20,),
          category(),
          SizedBox(height: 20,),
          Diet_Model(),
          SizedBox(height: 20,),
          Popularity()
          
        ],
      ),
    );
  }

  Column Popularity() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:20),
              child: Text(
                'Popular',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
                ),
            ),
            SizedBox(height: 20,),
            ListView.separated(
              // scrollDirection: Axis.vertical,
              itemCount: popularDiets.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) => SizedBox(height: 15,),
              padding: EdgeInsets.only(
                left: 20,
                right: 20
              ),
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  // color: Colors.amberAccent
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        popularDiets[index].iconPath,
                        width: 50,
                        height: 50,  
                      ),
                      
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            popularDiets[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16
                            ),
                          ),
                          Text(
                            popularDiets[index].level + ' | ' + popularDiets[index].duration + ' | ' + popularDiets[index].calories,
                            style: TextStyle(
                              color: Colors.amber[700],
                              fontSize: 13,
                              fontWeight: FontWeight.w400
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: popularDiets[index].boxIsSelected ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: popularDiets[index].boxIsSelected ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.07),
                        offset: Offset(0, 10),
                        blurRadius: 40,
                        spreadRadius: 0
                      )
                    ] : []
                  ),
                );
              },
            )
          ],
        );
  }

  Column Diet_Model() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Recommendation for Diet',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
                ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 190,
              // color: Colors.amberAccent,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: diets.length,
                separatorBuilder: (context, index) => SizedBox(width: 10,),
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20
                ),
                itemBuilder: (context, index){
                  return Container(
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: diets[index].tricolor.withOpacity(0.3)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(9),
                            child: SvgPicture.asset(diets[index].IconPath),
                          ),
                        ),
                        Text(
                          diets[index].Name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          diets[index].description + ' | ' + diets[index].duration,
                          style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 13
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          height: 35,
                          width: 130,
                          child: Center(
                            child: Text(
                              'View',
                              style: TextStyle(
                                color: diets[index].viewIsSelected ? Colors.white : Colors.red[400],
                                // fontSize: 
                              ),
                              
                            ),
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                diets[index].viewIsSelected ? Colors.lightBlueAccent : Colors.transparent,
                                diets[index].viewIsSelected ? Colors.deepPurpleAccent : Colors.transparent
                              ]
                            ),
                            borderRadius: BorderRadius.circular(50)
                          ),
                        )
                      ],
                    ),
                  );
                }
              ),
            )
          ],
        );
  }

  Column category() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Category',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 120,
              // color: Colors.deepPurpleAccent,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (context, index) => SizedBox(width: 10,),
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20
                ),
                itemBuilder: (context, index){
                  return Container(
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: categories[index].boxcolor.withOpacity(0.3)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(categories[index].iconPath),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          categories[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  );
                }
              ),
            ),
          ],
        );
  }

  Container search_field() {
    return Container(
          margin: EdgeInsets.only(top: 40, left: 20, right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurpleAccent.withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0.0,
              )
            ]
          ),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(12),
              hintText: 'Search something',
              hintStyle: TextStyle(
                color: Colors.black26,
                fontSize: 14,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/search.svg',
                  width: 20,
                ),
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none
              )
            ),
          ),
        );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        'Breakfast',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          
        },

        child: Container(
          margin: EdgeInsets.all(15),
          alignment: Alignment.center,
          child: SvgPicture.asset('assets/icons/arrow.svg'),
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(10)
          )
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            
          },
          child: Container(
          margin: EdgeInsets.all(20),
          alignment: Alignment.center,
          width: 20,
          child: SvgPicture.asset('assets/icons/dot.svg',
            width: 20,
            height: 20,
          ),
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(10)
          )
                  ),
        ),
      ],
    );
  }
}