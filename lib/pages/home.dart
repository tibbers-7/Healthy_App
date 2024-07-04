

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sample_app/pages/meal.dart';

import '../models/category_model.dart';
import '../models/diet_model.dart';
import '../models/popular_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularModel> popularDiets=[];

  void getCategories() {
    categories = CategoryModel.getCategories();
  }

  void getDiets() {
    diets = DietModel.getDiets();
  }

  void getPopularDiets(){
    popularDiets=PopularModel.getPopularDiets();
  }

  void getLists() {
    getCategories();
    getDiets();
    getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    getLists();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          searchBar(),
          const SizedBox(height: 25),
          categoriesSection(),
          const SizedBox(height: 25),
          recommendationSection(),
          const SizedBox(height: 25),
          popularSection(),
          
        ],
      ),
    );
  }

  Column popularSection(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Popular',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height:40),
        ListView.separated(     
          padding: const EdgeInsets.only(left:20,right: 20),     
          separatorBuilder: (context,index)=> const SizedBox(height: 25,), 
          itemCount: popularDiets.length,
          shrinkWrap: true,
          itemBuilder: (context,index){
            return Container(
              height: 100,
              decoration: BoxDecoration(
                color:popularDiets[index].boxIsSelected ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                boxShadow: popularDiets[index].boxIsSelected ? [
                  BoxShadow(
                    color: const Color(0xff1D1617).withOpacity(0.07),
                    offset: const Offset(0,10),
                    blurRadius: 40,
                    spreadRadius: 0
                  )
                ] : []
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    popularDiets[index].iconPath,
                    width: 65,
                    height: 65,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        popularDiets[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color:Colors.black,
                          fontSize: 16
                        ),
                      ),
                      Text(
                        '${popularDiets[index].level} | ${popularDiets[index].duration} | ${popularDiets[index].calorie}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color:Color(0xff7B6F72),
                          fontSize: 13
                        ),
                      )
                  ],),
                  GestureDetector(
                    onTap: () => {},
                    child: SvgPicture.asset(
                      'assets/icons/button.svg',
                      width: 30,
                      height: 30,
                    ),
                  )
              ],),
            );
          },
        ) 
      ],
    );
  }

  Column recommendationSection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text(
          'Recommendation for Diet',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      const SizedBox(height: 15),
      SizedBox(
        height: 330,
        child: ListView.separated(
          padding: const EdgeInsets.only(left: 20, right: 20),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(
            width: 50,
          ),
          itemCount: diets.length,
          itemBuilder: (context, index) {
            return Container(
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: diets[index].boxColor.withOpacity(0.3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/pancakes.svg',
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    diets[index].name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  IntrinsicHeight(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(diets[index].level,
                              style: const TextStyle(color: Color(0xff7B6F72))),
                          const VerticalDivider(
                            color: Colors.black,
                            indent: 3,
                            endIndent: 3,
                            thickness: 0.2,
                          ),
                          Text(diets[index].duration,
                              style: const TextStyle(color: Color(0xff7B6F72))),
                          const VerticalDivider(
                            color: Colors.black,
                            indent: 3,
                            endIndent: 3,
                            thickness: 0.2,
                          ),
                          Text(diets[index].calorie,
                              style: const TextStyle(color: Color(0xff7B6F72)))
                        ]),
                  ),
                  const SizedBox(height: 15),
                  Container(
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                            boxShadow:diets[index].viewIsSelected ? [
                              BoxShadow(
                                color: const Color(0xff1D1617).withOpacity(0.11),
                                blurRadius: 10,
                                spreadRadius: 0.0,
                              )
                            ] : [],
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xff92A3FD),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                diets[index].viewIsSelected ? const Color(0xff92A3FD) : Colors.transparent,
                                diets[index].viewIsSelected ? const Color(0xff9DCEFF) : Colors.transparent,
                              ],
                            ),
                          ),
                    child:   ElevatedButton(
                      clipBehavior: Clip.hardEdge,
                      style:  ElevatedButton.styleFrom(elevation: 0.0, backgroundColor: Colors.transparent, foregroundColor: Colors.transparent),
                      onPressed: () => {
                        setState((){
                          diets[index].viewIsSelected=false;
                        }),
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  MealPage(mealIndex: diets[index].id)),)
                      }, child: Text(
                              diets[index].viewIsSelected ? 'View' : '',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: diets[index].viewIsSelected ? Colors.white : const Color(0xffC58BF2)
                              ),
                            )
                      
                      
                  )
              )],
              ),
            );
          },
        ),
      )
    ]);
  }

  Column categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 120,
          //color: Colors.green,
          child: ListView.separated(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(
              width: 25,
            ),
            itemBuilder: (context, index) {
              return Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: categories[index].boxColor.withOpacity(0.3),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(categories[index].iconPath),
                        ),
                      ),
                      Text(categories[index].name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 14,
                          ))
                    ],
                  ));
            },
          ),
        )
      ],
    );
  }

  Container searchBar() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color(0xff1D1617).withOpacity(0.11),
          blurRadius: 40,
          spreadRadius: 0.0,
        )
      ]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15),
            hintText: 'Search Pancake',
            hintStyle: const TextStyle(
              color: Color(0xffDDDADA),
              fontSize: 14,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset('assets/icons/Search.svg'),
            ),
            suffixIcon: SizedBox(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const VerticalDivider(
                      color: Colors.black,
                      indent: 10,
                      endIndent: 10,
                      thickness: 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset('assets/icons/Filter.svg'),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            )),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
        title: const Text('Breakfast',
            style: TextStyle(
                color: Colors.black,
                fontSize: 19,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: GestureDetector(
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
