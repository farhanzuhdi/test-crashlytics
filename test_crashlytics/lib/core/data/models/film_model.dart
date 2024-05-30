class ResultFilm {
  ResultFilm({this.status, this.message, this.list});

  final bool? status;
  final String? message;
  final List<Film>? list;

  factory ResultFilm.fromJson(Map<String, dynamic> json) => ResultFilm(
      status: json["status"] ?? false,
      message: json['message'] ?? "",
      list: List<Film>.from(json["films"].map((x) => Film.fromJson(x))));
}

class Film {
  Film({this.title});

  final String? title;

  factory Film.fromJson(Map<String, dynamic> json) =>
      Film(title: json['title'] ?? "");
}
