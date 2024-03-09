// ignore_for_file: prefer_const_constructors

import 'package:fitness/models/Diet.dart';
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

  void _getCategories(){
    categories = CategoryModel.getCategories();
  }

  void _getDiet(){
    Diets = DietModel.getDiet();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    _getDiet();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          search_field(),
          SizedBox(height: 20,),
          category(),
          SizedBox(height: 20,),
          Column(
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
                height: 200,
                color: Colors.amberAccent,
                child: ListView.builder(
                  itemBuilder: (context, index){
                    return Container();
                  }
                ),
              )
            ],
          )
        ],
      ),
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
                separatorBuilder: (context, index) => SizedBox(width: 25,),
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