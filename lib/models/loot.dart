class Loot {
  final String title;
  final String worth;
  final String thumbnail;
  final String description;
  final String instructions;
  final String endDate;
  final String type;
  final String platforms;

  const Loot({
    required this.title,
    required this.worth,
    required this.thumbnail,
    required this.description,
    required this.instructions,
    required this.endDate,
    required this.type,
    required this.platforms,
  });

  factory Loot.fromJson(Map<String, dynamic> json) {
    return Loot(
      title: json['title'],
      worth: json['worth'],
      thumbnail: json['thumbnail'],
      description: json['description'],
      instructions: json['instructions'],
      endDate: json['end_date'],
      type: json['type'],
      platforms: json['platforms'],
    );
  }
}
