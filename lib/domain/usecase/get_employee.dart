import 'package:dartz/dartz.dart';
import 'package:hris_mock/common/failure.dart';
import 'package:hris_mock/domain/entities/employee.dart';
import 'package:hris_mock/domain/repositories/employee_repository.dart';

class GetEmployee {
  final EmployeeRepository repository;

  GetEmployee(this.repository);

  Future<Either<Failure, List<Employee>>> execute() {
    return repository.getEmployee();
  }
}