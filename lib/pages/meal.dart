import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sample_app/pages/home.dart';

class MealPage extends StatefulWidget {
  const MealPage({super.key});

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  double panelHeight = 500.0; // Initial height of the slideable panel
  double minPanelHeight = 400; // Minimum height of the slideable panel
  double maxPanelHeight = double.infinity; // Maximum height of the slideable panel
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
                  height: kToolbarHeight +
                      MediaQuery.of(context)
                          .padding
                          .top), // Provides space for the app bar
              // Your other widgets go here
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
        onVerticalDragEnd: (details) {
          // Optionally, you can add snapping behavior or other logic here
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white
          ),
          child: const Center(
            child: Text(
              'Slideable Section',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
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
                  'assets/icons/honey-pancakes.svg',
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
