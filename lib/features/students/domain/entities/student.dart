import 'package:equatable/equatable.dart';

class Student extends Equatable {
  final String id;
  final String name;
  final String email;
  final int age;

  const Student({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
  });

  @override
  List<Object?> get props => [id, name, email, age];
}
