import 'package:equatable/equatable.dart';
import 'package:healthy_app/features/meal/domain/entities/ingredient_value.dart';
import 'package:healthy_app/features/meal/domain/entities/nutrition.dart';

enum MealType { 
  breakfast, brunch, lunch, dinner, snack, drink;
  String toJson() => name;
  static MealType fromJson(String json) => values.byName(json);
  }

class MealEntity extends Equatable{
  final int ? id;
  final String ? name;
  final String ? iconPath;
  final String ? author;
  final String ? description;
  final List<MealType> ? type;
  final List<IngredientValueEntity> ? ingredients;
  late final NutritionEntity ? nutritionValue;
  final List<String> ? steps;


  MealEntity(
    {
      required this.id,
      required this.name,
      required this.iconPath,
      required this.author,
      required this.description,
      required this.type,
      required this.ingredients,
      required this.steps
    }
  )
  {
    nutritionValue=NutritionEntity.empty();
    if(ingredients != null){
    for (var ingredient in ingredients!) {
      nutritionValue=nutritionValue!+ingredient.nutritionValue;
    }}
  }

  static MealEntity getBlueberryPancake(){
    MealEntity meal=MealEntity(id:1,
                              name: 'Blueberry Pancake', 
                              iconPath: 'assets/icons/blueberry-pancake.svg',
                              author:'James Ruth', 
                              description: 'Pancakes are some people\'s favorite breakfast, who doesn\'t like pancakes? Especially with the real honey splash on top of the pancakes, of course everyone loves that! Besides being absolutely delicious, they\'re a great source of proteins! Easy and quick to make, this is a household must, especially if you have children!', 
                              type: [MealType.breakfast], 
                              ingredients: IngredientValueEntity.getBlueberryIngredients(), 
                              steps: ['Prepare all of the ingredients that are needed',
                              'Mix flour, sugar, salt, and baking powder',
                              'In a seperate place, mix the eggs and liquid milk until blended',
                              'Put the egg and milk mixture into the dry ingredients, stir until smooth and smooth',
                              'Prepare all of the ingredients that are needed'
                              ]);
    return meal;
  }

  static MealEntity getCanaiBread(){
    MealEntity meal=MealEntity(id:2,
                              name: 'Canai Bread', 
                              iconPath: 'assets/icons/canai-bread.svg',
                              author:'Bea Lao', 
                              description: 'Roti canai, if translated directly from Malay language would be “Flattened bread”. Roti is bread. Canai is flattened or more accurately is the method of throwing the bread dough in the air in a spinning motion, intending to get thinner and bigger flat dough. Roti canai is a very well-known dish in my home country Malaysia. It\'s a flatbread with influences from India. It\'s usually sold in Mamak restaurants and eaten with dhal curry. You can also have it with fish curry and sambal', 
                              type: [MealType.breakfast], 
                              ingredients: IngredientValueEntity.getCanaiBreadIngredients(), 
                              steps: ['In a standing mixer bowl, add in flour, salt, egg, melted butter, condensed milk and water. Mix to incorporate and knead for 10 minutes. Leave to rest for 10 minutes and knead for another 5 minutes.',
                                      'Divide the dough into 10 small balls. Coat each ball generously with unsalted butter and place them in a container that has been generously buttered. Cover the container tightly with cling film and keep in the fridge overnight',
                                      'The next day. Spread some unsalted butter on the working surface. Take one ball and lightly flatten it. Press and push the dough with the heel of your palm to make it bigger. Stretch it as thin as possible, until you can almost see through it. Now and then spread some soften unsalted butter on it to help the stretching. Optional, lift up one edge of the dough and gently pull to stretch it even more.',
                                      'Scrape and push the upper end of the dough to the middle. Do the same to the lower end, forming a wrinkle thin log. Starting at one end of the log, roll it into a circle and tuck the other end inside. Leave aside for 10 minutes before cooking. Meanwhile you can continue with the rest of the balls.',
                                      'Once ready to cook, take one rolled circle and flatten it into more or less 10-15 cm diameter. Heat some unsalted butter on a pan using medium heat. Place the flatten dough on the pan. Cook for several minutes and then flip. Continue cooking for some minutes more.',
                                      'This is important for a fluffy roti canai. Remove the cooked roti canai and place it on a working surface. Immediately yet carefully grab it using both of your hands and squeeze it to the center. We want to fluff it.',
                                      'Keep the roti canai under a kitchen cloth to keep them warm. They\'re best eaten with dhal curry or any type of curry with some sambal. Enjoy!'
                                      ]);
    
    return meal;
  }

  static MealEntity getByIndex(int index){
    if (index==1) return getBlueberryPancake(); return getCanaiBread();
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}