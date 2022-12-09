import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DataTable Example',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String cdate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  List<String> topics = [
    "Action Verb",
    "Alphabet",
    "Animals",
    "Colors",
    "Days of the Week",
    "Fruits and Vegetables",
    "Nouns",
    "Past Tense",
    "Planets",
    "Shapes",
    "Subject Pronouns"
  ];
  // Generate a list of fiction prodcts
  final List<Map> _products = List.generate(12, (i) {
    return {
      "id": i,
      "topic": "topics",
      "date": "cdate",
      "Score": Random().nextInt(200) + 1
    };
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DataTable Example'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: DataTable(
              headingRowColor: MaterialStateProperty.all(Colors.amber[200]),
              // ignore: prefer_const_literals_to_create_immutables
              columns: [
                const DataColumn(label: Text('Id')),
                const DataColumn(label: Text('Topics')),
                const DataColumn(label: Text('Date')),
                // ignore: prefer_const_constructors
                DataColumn(
                  label: const Text(
                    'Score',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  // Sorting function
                ),
              ],
              rows: _products.map((item) {
                return DataRow(cells: [
                  DataCell(Text(item['id'].toString())),
                  DataCell(Text(item['topic'])),
                  DataCell(Text(item['date'])),
                  DataCell(Text(item['score'].toString()))
                ]);
              }).toList(),
            ),
          ),
        ));
  }
}
