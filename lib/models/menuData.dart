class MenuData {
  final String restaurant;
  final DateTime date;
  final int week;
  final String food;
  final String vegFood;

  MenuData({this.restaurant, this.date, this.week, this.food, this.vegFood});

  factory MenuData.fromJson(Map<String, dynamic> json) {
    var date = new DateTime.fromMillisecondsSinceEpoch(json['date']['seconds'] * 1000);
    return MenuData(
      restaurant: json['restaurant'],
      date: date,
      week: json['week'],
      food: json['food'],
      vegFood: json['veg_food'],
    );
  }
}