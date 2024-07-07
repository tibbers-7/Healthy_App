import 'dart:async';

import 'package:floor/floor.dart';
import 'package:healthy_app/features/meal/data/models/meal.dart';
import 'dao/meal_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [MealModel])
abstract class AppDatabase extends FloorDatabase {
  MealDao get mealDAO;
}