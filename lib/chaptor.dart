import 'dart:convert';

Chaptor chaptorFromJson(String str) => Chaptor.fromJson(json.decode(str));

String chaptorToJson(Chaptor data) => json.encode(data.toJson());

class Chaptor {
    final int chId;
    final int courseId;
    final String chTitle;
    final DateTime chDateadd;
    final String chTimetotal;
    final int chView;
    final String chUrl;

    Chaptor({
        required this.chId,
        required this.courseId,
        required this.chTitle,
        required this.chDateadd,
        required this.chTimetotal,
        required this.chView,
        required this.chUrl,
    });

    factory Chaptor.fromJson(Map<String, dynamic> json) => Chaptor(
        chId: json["ch_id"],
        courseId: json["course_id"],
        chTitle: json["ch_title"],
        chDateadd: DateTime.parse(json["ch_dateadd"]),
        chTimetotal: json["ch_timetotal"],
        chView: json["ch_view"],
        chUrl: json["ch_url"],
    );

    Map<String, dynamic> toJson() => {
        "ch_id": chId,
        "course_id": courseId,
        "ch_title": chTitle,
        "ch_dateadd": "${chDateadd.year.toString().padLeft(4, '0')}-${chDateadd.month.toString().padLeft(2, '0')}-${chDateadd.day.toString().padLeft(2, '0')}",
        "ch_timetotal": chTimetotal,
        "ch_view": chView,
        "ch_url": chUrl,
    };
}
