class TodoModel {
  final String id;
  final bool active;
  final String title;
  final String subtitle;

  TodoModel({
    required this.id,
    this.active = false,
    required this.title,
    required this.subtitle,
  });

  TodoModel copyWith({
    String? id,
    bool? active,
    String? title,
    String? subtitle,
  }) {
    return TodoModel(
      id: id ?? this.id,
      active: active ?? this.active,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
    );
  }

  factory TodoModel.fromJson(String id, Map<String, dynamic> json) {
    return TodoModel(id: id, title: json["title"], subtitle: json["subtitle"]);
  }
}
