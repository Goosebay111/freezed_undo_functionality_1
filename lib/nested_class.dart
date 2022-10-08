import 'dart:developer';

class NestedClass {
  NestedClass({required this.name, required this.surname, required this.age});

  final String name;
  final String surname;
  final int age;

  final List<NestedClass> children = [];

  addChild(NestedClass child) => children.add(child);

  printNames() {
    log('name: $name, surname: $surname, age: $age');
    for (var child in children) {
      child.printNames();
    }
  }

  List<String> getNames() {
    List<String> names = [];
    names.add(name);
    for (var child in children) {
      names.addAll(child.getNames());
    }
    return names;
  }

  NestedClass copyWith({
    String? name,
    String? surname,
    int? age,
    List<NestedClass>? children,
  }) =>
      NestedClass(
        name: name ?? this.name,
        surname: surname ?? this.surname,
        age: age ?? this.age,
      )..children.addAll(children ?? this.children);

  Map<String, dynamic> toJson() => {
        'name': name,
        'surname': surname,
        'age': age,
        'children': children.map((e) => e.toJson()).toList(),
      };

  factory NestedClass.fromJson(Map<String, dynamic> json) => NestedClass(
        name: json['name'],
        surname: json['surname'],
        age: json['age'],
      )..children.addAll(
          List<NestedClass>.from(
            json['children'].map(
              (x) => NestedClass.fromJson(x),
            ),
          ),
        );

  factory NestedClass.initial() => NestedClass(name: 'Family Tree', surname: 'Lineage', age: 500);
}
