import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigationbar/course.dart';
import 'package:http/http.dart' as http;
class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  List<Course> course = [];

  Future<void> fetchCourses() async {
    try {
      //เริ่มการอ่านข้อมูล
      var url = "https://api.codingthailand.com/api/course";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'] as List;
        course = data.map((courseData) => Course.fromJson(courseData)).toList();
        setState(() {});
      } else {
        print("Error $response.statusCode");
      }
    } catch (e) {
      print("Error $e");
    }
  }

  @override
  void initState() {
    super.initState();

    fetchCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Infromation Page")),
      body: ListView.separated(
        padding: const EdgeInsets.only(top: 30),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: course.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(course[index].title),
            subtitle: Text(course[index].detail),
            leading: ConstrainedBox(
                constraints: const BoxConstraints(
                    maxHeight: 80, minHeight: 80, maxWidth: 80, minWidth: 80),
                child: Image.network(
                  course[index].picture,
                  fit: BoxFit.fill,
                )),
            onTap: () {
              int id = course[index].id;
              Get.toNamed("/detail/$id");
            },
          );
        },
      ),
    );
  }
}