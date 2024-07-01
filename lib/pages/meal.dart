import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sample_app/models/meal_model.dart';
import 'package:sample_app/pages/home.dart';
import 'package:sample_app/utils/gradient_text.dart';

import '../models/nutrition_model.dart';
import '../utils/read_more.dart';

class MealPage extends StatefulWidget {
  MealPage({super.key, required this.mealIndex});

  int mealIndex;
  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  double panelHeight = 500.0; // Initial height of the slideable panel
  double minPanelHeight = 460; // Minimum height of the slideable panel
  double maxPanelHeight =
      double.infinity; // Maximum height of the slideable panel

  MealModel meal = MealModel.getBlueberryPancake();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: appBar(),
        body: Stack(children: [
          pictureContainer(),
          Column(
            children: [
              SizedBox(
                  height: kToolbarHeight + MediaQuery.of(context).padding.top),
            ],
          ),
          slideableSection()
        ]));
  }

  Widget slideableSection() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      height: panelHeight,
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          setState(() {
            panelHeight -= details.primaryDelta!;
            if (panelHeight < minPanelHeight) {
              panelHeight = minPanelHeight;
            } else if (panelHeight > maxPanelHeight) {
              panelHeight = maxPanelHeight;
            }
          });
        },
        onVerticalDragEnd: (details) {},
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.white),
            child: slideableSectionData()),
      ),
    );
  }

  Widget slideableSectionData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 15),
            height: 5,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                meal.name,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  // ignore: prefer_const_constructors
                  Text(
                    'by ',
                    style: const TextStyle(
                      color: Color.fromARGB(44, 0, 0, 0),
                    ),
                  ),
                  GradientText(meal.author,
                      style: const TextStyle(fontWeight: FontWeight.w100),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xff9DCEFF),
                          Color(0xff92A3FD),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Nutrition',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    nutrientContainer('calories'),
                    const SizedBox(width: 10),
                    nutrientContainer('fats'),
                    const SizedBox(width: 10),
                    nutrientContainer('proteins'),
                    const SizedBox(width: 10),
                    nutrientContainer('carbs'),
                    const SizedBox(width: 10),
                    nutrientContainer('fibre'),
                    const SizedBox(width: 10),
                    nutrientContainer('vitamins'),
                    const SizedBox(width: 10),
                    nutrientContainer('minerals'),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Descriptions',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ReadMoreText(
                  text: meal.description,
                  maxLines: 5,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Container nutrientContainer(String nutrientName) {
    double nutrientValue =
        NutritionModel.getNutrientByName(meal.nutritionValue, nutrientName);
    if (nutrientValue == 0) return Container();
    String appendText = '';
    if (nutrientName == 'calories') {
      appendText = 'kCal';
    } else {
      appendText = 'g $nutrientName';
    }
    return Container(
      height: 60,
      width: null,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color.fromARGB(9, 0, 0, 0),
      ),
      child: IntrinsicWidth(
        child: Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            SvgPicture.asset(
              'assets/icons/$nutrientName.svg',
              height: 35,
              width: 35,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              nutrientValue.toStringAsFixed(0),
              style: const TextStyle(fontSize: 13),
            ),
            Text(appendText, style: const TextStyle(fontSize: 13)),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
    );
  }

  SizedBox pictureContainer() {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xff92A3FD), Color(0xff9DCEFF)],
            ),
          ),
          child: Center(
            child: Container(
              height: 270,
              width: 270,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(78, 255, 255, 255),
              ),
              child: Center(
                child: SvgPicture.asset(
                  meal.iconPath,
                  height: 200,
                  width: 200,
                  alignment: Alignment.center,
                ),
              ),
            ),
          )),
    );
  }

  AppBar appBar() {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              'assets/icons/Arrow - Left 2.svg',
              height: 20,
              width: 20,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              width: 37,
              decoration: BoxDecoration(
                color: const Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(
                'assets/icons/dots.svg',
                height: 5,
                width: 5,
              ),
            ),
          )
        ]);
  }
}
