import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hris_mock/domain/entities/employee.dart';

List<EmployeeModel> employeeModelFromJson(String str) => List<EmployeeModel>.from(json.decode(str).map((x) => EmployeeModel.fromJson(x)));

String employeeModelToJson(List<EmployeeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeeModel extends Equatable {
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

  const EmployeeModel({
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

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
    id: json["id"],
    imageUrl: json["imageUrl"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    contactNumber: json["contactNumber"],
    age: json["age"],
    dob: json["dob"],
    salary: json["salary"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "imageUrl": imageUrl,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "contactNumber": contactNumber,
    "age": age,
    "dob": dob,
    "salary": salary,
    "address": address,
  };

  Employee toEntity() {
    return Employee(
      id: id,
      imageUrl: imageUrl,
      firstName: firstName,
      lastName: lastName,
      email: email,
      contactNumber: contactNumber,
      age: age,
      dob: dob,
      salary: salary,
      address: address,
    );
  }

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