import 'package:flutter/widgets.dart';
import 'package:freezed_undo_functionality_1/delete.dart';
import 'package:freezed_undo_functionality_1/initialise_data.dart';
import 'package:freezed_undo_functionality_1/nested_class.dart';

List<Widget> getNames(NestedClass updatedHierarchy) {
  List<Widget> namesList = [];
  namesList.add(
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'name: ${updatedHierarchy.name}, surname: ${updatedHierarchy.surname}, age: ${updatedHierarchy.age}',
      ),
    ),
  );
  for (var child in updatedHierarchy.children) {
    namesList.addAll(getNames(child));
  }
  return namesList;
}

