class TaskModel {
  int? id;
  String? title;
  String? description;
  int? isDone;
  String? date;
  String? time;
  int? color;

  TaskModel({
    this.id,
    this.title,
    this.description,
    this.isDone,
    this.date,
    this.time,
    this.color,
  });

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    isDone = json['isDone'];
    date = json['date'];
    time = json['time'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['isDone'] = isDone;
    data['date'] = date;
    data['time'] = time;
    data['color'] = color;
    return data;
  }
}
