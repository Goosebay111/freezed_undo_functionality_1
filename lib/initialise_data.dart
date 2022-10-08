import 'package:flutter/material.dart';
import 'package:freezed_undo_functionality_1/delete.dart';
import 'package:freezed_undo_functionality_1/nested_class.dart';

var familyHierarchy =
    NestedClass(name: 'Family Tree', surname: 'Lineage', age: 500);
var greatGrandParents =
    NestedClass(name: 'Great Grand Parents 1', surname: 'Surname', age: 100);
var grandParents1 =
    NestedClass(name: 'Grand Parents 1', surname: 'Surname', age: 50);
var grandParents2 =
    NestedClass(name: 'Grand Parents 2', surname: 'Surname', age: 50);
var parents1 = NestedClass(name: 'Parents 1', surname: 'Surname', age: 25);
var parents2 = NestedClass(name: 'Parents 2', surname: 'Surname', age: 25);
var parents3 = NestedClass(name: 'Parents 3', surname: 'Surname', age: 25);
var children1 = NestedClass(name: 'Children 1', surname: 'Surname', age: 10);
var children2 = NestedClass(name: 'Children 2', surname: 'Surname', age: 10);
var children3 = NestedClass(name: 'Children 3', surname: 'Surname', age: 10);
var children4 = NestedClass(name: 'Children 4', surname: 'Surname', age: 10);
var children5 = NestedClass(name: 'Children 5', surname: 'Surname', age: 10);
var children6 = NestedClass(name: 'Children 6', surname: 'Surname', age: 10);

NestedClass loadFamilyTree() {
  familyHierarchy.addChild(greatGrandParents);

  greatGrandParents.addChild(grandParents1);
  greatGrandParents.addChild(grandParents2);

  grandParents1.addChild(parents1);
  grandParents1.addChild(parents2);
  grandParents1.addChild(parents3);

  parents1.addChild(children1);
  parents1.addChild(children2);

  parents2.addChild(children3);
  parents2.addChild(children4);

  parents3.addChild(children5);
  parents3.addChild(children6);

  return familyHierarchy;
}

List<NestedClass> getUndoList() {
  NestedClass familyTree = loadFamilyTree();

  final deleted1 = delete(object: children1, hierarchy: familyTree);
  final deleted2 = delete(object: children2, hierarchy: deleted1);
  final deleted3 = delete(object: children3, hierarchy: deleted2);
  final deleted4 = delete(object: children4, hierarchy: deleted3);
  final deleted5 = delete(object: children5, hierarchy: deleted4);
  final deleted6 = delete(object: children6, hierarchy: deleted5);

  List<NestedClass> undoList = [
    deleted1,
    deleted2,
    deleted3,
    deleted4,
    deleted5,
    deleted6,
  ];

  return undoList;
}


