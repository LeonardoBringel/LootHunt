class Loot {
  final String title;
  final String price;
  final String thumbnail;
  final String description;
  final String instructions;
  final String date;
  final String type;
  final String platforms;

  const Loot({
    required this.title,
    required this.price,
    required this.thumbnail,
    required this.description,
    required this.instructions,
    required this.date,
    required this.type,
    required this.platforms,
  });

  factory Loot.fromJson(Map<String, dynamic> json) {
    return Loot(
      title: json['title'],
      price: json['worth'],
      thumbnail: json['thumbnail'],
      description: json['description'],
      instructions: json['instructions'],
      date: json['end_date'],
      type: json['type'],
      platforms: json['platforms'],
    );
  }
}
