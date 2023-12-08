import 'package:equatable/equatable.dart';

class Employee extends Equatable {
  final int? id;
  final String? imageUrl;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? contactNumber;
  final int? age;
  final String? dob;
  final double? salary;
  final String? address;

  const Employee({
    this.id,
    this.imageUrl,
    this.firstName,
    this.lastName,
    this.email,
    this.contactNumber,
    this.age,
    this.dob,
    this.salary,
    this.address,
  });

  @override
  List<Object?> get props => [
    id,
    imageUrl,
    firstName,
    lastName,
    email,
    contactNumber,
    age,
    dob,
    salary,
    address,
  ];

}
