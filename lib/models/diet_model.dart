import 'package:flutter/material.dart';

class DietModel{
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool viewIsSelected;
  Color boxColor;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.viewIsSelected,
    required this.boxColor
  });

  static List<DietModel> getDiets(){
    List<DietModel> diets=[];

    diets.add(
      DietModel(
        name:'Honey Pancake',
        iconPath: 'assets/icons/honey-pancakes.svg', 
        level: 'Easy', 
        duration: '30mins', 
        calorie: '180kCal', 
        viewIsSelected: true,
        boxColor: const Color(0xff92A3FD)
        )
    );

    diets.add(
      DietModel(
        name:'Canai Bread',
        iconPath: 'assets/icons/canai-bread.svg', 
        level: 'Easy', 
        duration: '20mins', 
        calorie: '250kCal', 
        viewIsSelected: true,
        boxColor: const Color(0xffC58BF2)
        )
    );

    return diets;
  }
}