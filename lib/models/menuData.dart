class MenuData {
  final String restaurant;
  final DateTime date;
  final String food;
  final String vegFood;

  MenuData({this.restaurant, this.date, this.food, this.vegFood});

  factory MenuData.fromJson(Map<String, dynamic> json) {
    var date = new DateTime.fromMillisecondsSinceEpoch(json['date']['seconds'] * 1000);
    return MenuData(
      restaurant: json['restaurant'],
      date: date,
      food: json['food'],
      vegFood: json['veg_food'],
    );
  }
}