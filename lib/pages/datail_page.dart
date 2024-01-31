import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigationbar/chaptor.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<Chaptor> chaptors = [];

  Future<void> fetchDetail(String id) async {
    try {
      var url = "https://api.codingthailand.com/api/course/$id";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'] as List;
        chaptors =
            data.map((chaptorData) => Chaptor.fromJson(chaptorData)).toList();
        setState(() {});
      } else {
        print("Error $response.statusCode");
      }
    } catch (e) {
      print("Error $e");
    }
  }

  var id;
  @override
  void initState() {
    super.initState();
    id = Get.parameters['id'];
    fetchDetail(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back_ios)),
          title: const Text("Courses Detail")),
      body: ListView.separated(
        padding: const EdgeInsets.only(top: 30),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: chaptors.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(chaptors[index].chTitle),
            subtitle: Text(chaptors[index].chUrl)
          );
        },
      ),
    );
  }
}