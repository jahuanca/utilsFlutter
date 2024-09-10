import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

void main() async {
  loadConfig(
      DataConfig(primaryColor: Colors.blue, secondaryColor: Colors.black));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ExamplePage(),
    );
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(text: 'Example'),
      body: Column(
        children: [
          InputWidget(hintText: ''),
          ButtonWidget(text: 'Texto', icon: Icons.abc_rounded,),
        ],
      ),
    );
  }
}
