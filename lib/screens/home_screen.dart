import 'package:flutter/material.dart';

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
            ElevatedButton(onPressed: (){}, child: const Text("Insert")),
            ElevatedButton(onPressed: (){}, child: const Text("Update")),
            ElevatedButton(onPressed: (){}, child: const Text("Delete")),
            ElevatedButton(onPressed: (){}, child: const Text("Query")),
          ],
        ),
      ),
    );
  }
}