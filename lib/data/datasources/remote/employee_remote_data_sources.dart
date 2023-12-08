import 'dart:convert';

import 'package:hris_mock/common/constants.dart';
import 'package:hris_mock/common/exceptions.dart';
import 'package:hris_mock/data/models/employee_model.dart';
import 'package:dio/dio.dart';

abstract class EmployeeRemoteDataSources {
  Future<List<EmployeeModel>> getEmployee();
}

class EmployeeRemoteDataSourcesImpl implements EmployeeRemoteDataSources {

  final dio = Dio();

  @override
  Future<List<EmployeeModel>> getEmployee() async {
    final response = await dio.get(
        '$BASE_URL/employee',
        queryParameters: {
          'noofRecords': '10',
          'idStarts': '1001'
        });

    if (response.statusCode == 200) {
      return employeeModelFromJson(json.encode(response.data));
    } else {
      throw ServerException();
    }
  }
}