
class MenuContent {
  static Day mon;
  static Day tue;
  static Day wed;
  static Day thu;
  static Day fri;
  static Day sat;
  static Day sun;
  static String foodTime = '12:00';

  static final List<Day> matsedel = [
    mon = Day(day: 'Måndag', food: 'Pasta med köttfärssås', vegFood: 'Veg: ' + 'Friterad Halloumi'),
    tue = Day(day: 'Tisdag', food: 'Pizza', vegFood: 'Veg: ' + 'Friterad Halloumi'),
    wed = Day(day: 'Onsdag', food: 'Renmans Pizzeria', vegFood: 'Veg: ' + 'Friterad Halloumi'),
    thu = Day(day: 'Torsdag', food: 'Kebab med ris', vegFood: 'Veg: ' + 'Friterad Halloumi'),
    fri = Day(day: 'Fredag', food: 'Kycklinggyros och bulgur', vegFood: 'Veg: ' + 'Friterad Halloumi'),
    sat = Day(day: 'Lördag', food: 'Bakispizza?', vegFood: 'Veg: ' + 'Helg'),
    sun = Day(day: 'Söndag', food: 'Helg', vegFood: 'Veg: ' + 'Helg')

  ];
}
class Day{
  String day;
  String food;
  String vegFood;

  Day({this.day, this.food, this.vegFood});
}