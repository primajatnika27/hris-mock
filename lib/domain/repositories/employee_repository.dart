import 'package:dartz/dartz.dart';
import 'package:hris_mock/common/failure.dart';
import 'package:hris_mock/domain/entities/employee.dart';

abstract class EmployeeRepository {
  Future<Either<Failure, List<Employee>>> getEmployee();
}