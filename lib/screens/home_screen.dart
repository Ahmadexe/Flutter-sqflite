import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_app/database/local_database_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SQFlite App"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  int i = await DatabaseHelper.instance
                      .insert({"user": "Ahmad XYZ"});
                  if (kDebugMode) {
                    print("Check $i");
                  }
                },
                child: const Text("Insert")),
            ElevatedButton(
                onPressed: () async {
                  DatabaseHelper.instance.update({"id": 1, "user": "Changed"});
                },
                child: const Text("Update")),
            ElevatedButton(
                onPressed: () async {
                  DatabaseHelper.instance.delete(1);
                },
                child: const Text("Delete")),
            ElevatedButton(
                onPressed: () async {
                  List<Map<String, dynamic>> allData =
                      await DatabaseHelper.instance.queryAll();
                  if (kDebugMode) {
                    print(allData);
                  }
                },
                child: const Text("Query")),
          ],
        ),
      ),
    );
  }
}
