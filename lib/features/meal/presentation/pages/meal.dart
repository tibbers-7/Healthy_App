
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthy_app/features/meal/domain/entities/ingredient_value.dart';
import 'package:healthy_app/features/meal/domain/entities/ingredient.dart';
import 'package:healthy_app/features/meal/domain/entities/meal.dart';
//import 'package:healthy_app/pages/home.dart';
import 'package:healthy_app/core/util/gradient_text.dart';

import '../../domain/entities/nutrition.dart';
import '../widgets/dashed_line.dart';
import '../widgets/read_more.dart';

class MealPage extends StatefulWidget {
  MealPage({super.key, required this.meal});

  MealEntity meal;
  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  double panelHeight = 500.0; // Initial height of the slideable panel
  double minPanelHeight = 460; // Minimum height of the slideable panel
  double maxPanelHeight =
      double.infinity; // Maximum height of the slideable panel

   late MealEntity meal;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: appBar(),
        body: Stack(clipBehavior: Clip.none, children: [
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
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.6,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              color: Colors.white),
          child: SingleChildScrollView(
            controller: scrollController,
            child: slideableSectionData(),
          ),
        );
      },
    );
  }

  Widget slideableSectionData() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 15),
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
                  meal.name ?? '',
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
                    GradientText(meal.author??'',
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
                    text: meal.description??'',
                    maxLines: 5,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ingredientsSection(),
                const SizedBox(
                  height: 20,
                ),
                stepSection()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget stepSection() {
    int stepIndex = 0;

    return Column(
      children: [
        Row(
          children: [
            const Text(
              'Step by Step',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.black,
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  "${meal.steps?.length} steps",
                  textAlign: TextAlign.right,
                  style: const TextStyle(color: Color.fromARGB(120, 0, 0, 0)),
                ),
              ),
            ),
          ],
        ),
         

        Padding(
          padding: const EdgeInsets.only(top:20),
          child: Column(
            children: meal.steps!.map((step) {
              stepIndex++;
              return stepContainer(step, stepIndex,meal.steps!.length);
            }).toList() ?? []
          ),
        ),
      ],
    );
  }

 
Widget stepContainer(String step, int stepIndex,int maxStep) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            stepIndex.toString(),
            style: const TextStyle(fontSize: 20),
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisSize: MainAxisSize.min, // Ensures Column takes minimum required height
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color.fromARGB(70, 0, 0, 0),
                    width: 2,
                  ),
                ),
                padding: const EdgeInsets.all(6),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(70, 0, 0, 0),
                  ),
                ),
              ),
              if (stepIndex < maxStep)
              IntrinsicHeight(
                child: CustomPaint(
                  size: Size(1, 50), // Set a default height for the dashed line
                  painter: DashedLineVerticalPainter(),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 14,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Step $stepIndex",
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  step,
                  style: const TextStyle(color: Color.fromARGB(75, 0, 0, 0)),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
  

  Widget ingredientsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ingredients',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.black,
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: meal.ingredients!.map((ingredient) {
              return ingredientContainer(ingredient);
            }).toList(),
          ),
        )
      ],
    );
  }

  Widget ingredientContainer(IngredientValueEntity ingredientValue) {
    //IngredientEntity ingredient = ingredientValue.ingredientId;
    IngredientEntity ingredient=const IngredientEntity(id: 1, name: 'Ingredient', nutritionValue:null , iconPath: '');
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color.fromARGB(9, 0, 0, 0),
            ),
            child: Center(
              child: SvgPicture.asset(
                ingredient.iconPath??'',
                height: 50,
                width: 50,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Text(ingredient.name??''),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Text(
              "${ingredientValue.measure!.value!.toInt()} ${ingredientValue.measure!.measureType.toString().split('.').last}",
              style: const TextStyle(
                color: Color.fromARGB(104, 0, 0, 0),
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container nutrientContainer(String nutrientName) {
    double nutrientValue =
        NutritionEntity.getNutrientByName(meal.nutritionValue, nutrientName);
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
                  meal.iconPath??'',
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
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const HomePage()),
            // );
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
