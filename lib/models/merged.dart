import 'package:social_recipes/models/fruits.dart';
import 'package:social_recipes/models/vegetables.dart';

final merged = <String>{
  ...fruits.values.expand((list) => list),
  ...vegetables.values.expand((list) => list),
}.toList();
