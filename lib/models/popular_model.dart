
class PopularModel{
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool boxIsSelected;

  PopularModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxIsSelected,
  });

  static List<PopularModel> getPopularDiets(){
    List<PopularModel> populars=[];

    populars.add(
      PopularModel(
        name:'Honey Pancake',
        iconPath: 'assets/icons/honey-pancakes.svg', 
        level: 'Medium', 
        duration: '30mins', 
        calorie: '230kCal', 
        boxIsSelected: true
        )
    );

    populars.add(
      PopularModel(
        name:'Salmon Nigiri',
        iconPath: 'assets/icons/salmon-nigiri.svg', 
        level: 'Easy', 
        duration: '20mins', 
        calorie: '120kCal', 
        boxIsSelected: false
        )
    );

    return populars;
  }
}