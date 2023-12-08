import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hris_mock/common/exceptions.dart';
import 'package:hris_mock/common/failure.dart';
import 'package:hris_mock/data/datasources/remote/employee_remote_data_sources.dart';
import 'package:hris_mock/domain/entities/employee.dart';
import 'package:hris_mock/domain/repositories/employee_repository.dart';

class EmployeeRepositoryImpl extends EmployeeRepository {
  final EmployeeRemoteDataSources remoteDataSources;

  EmployeeRepositoryImpl({
    required this.remoteDataSources
  });

  @override
  Future<Either<Failure, List<Employee>>> getEmployee() async {
    try {
      final result = await remoteDataSources.getEmployee();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to server'));
    }
  }

}