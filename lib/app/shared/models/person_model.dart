import 'package:meta/meta.dart';

class PersonModel {
  final String name;
  final String lastName;
  final int age;
  final String id;

  PersonModel({
    @required this.name,
    @required this.lastName,
    @required this.age,
    @required this.id,
  });
}
