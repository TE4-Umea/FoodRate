class Post {
  final String appId;
  final String rating;
  final String group;
  final bool veg;

  Post({this.appId, this.rating, this.group, this.veg});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      appId: json['app_id'],
      rating: json['rating'],
      group: json['group'],
      veg: json['body'],
    );
  }
}