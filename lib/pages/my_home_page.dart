import 'package:flutter/material.dart';
import 'package:freezed_undo_functionality_1/data_initialization/load_undo_list.dart';

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({super.key});

  @override
  State<MyHomeApp> createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  List<List<Widget>> namesList = loadUndoList();
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page ${page + 1}'),
      ),
      body: ListView.builder(
        itemCount: namesList[page].length,
        itemBuilder: (context, index) {
          return namesList[page][index];
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              setState(() {
                if (page > 0) {
                  page--;
                }
              });
            },
            child: const Icon(Icons.undo),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                if (page < namesList.length - 1) {
                  page++;
                }
              });
            },
            child: const Icon(Icons.redo),
          ),
        ],
      ),
    );
  }
}
