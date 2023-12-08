import 'package:flutter/material.dart';
import 'package:hris_mock/common/state_enum.dart';
import 'package:hris_mock/domain/entities/employee.dart';
import 'package:hris_mock/domain/usecase/get_employee.dart';

class EmployeeListNotifier extends ChangeNotifier {
  var _employeeList = <Employee>[];
  List<Employee> get employeeList => _employeeList;

  RequestState _state = RequestState.initial;
  RequestState get state => _state;

  String _message = '';
  String get message => _message;

  EmployeeListNotifier({
    required this.getEmployee
  });

  GetEmployee getEmployee;

  Future<void> fetchEmployee() async {
    _state = RequestState.loading;
    notifyListeners();

    final result = await getEmployee.execute();
    result.fold(
            (failure) {
          _state = RequestState.error;
          _message = failure.message;
          notifyListeners();
        },
            (data) {
          _state = RequestState.loaded;
          _employeeList = data;
          notifyListeners();
        }
    );
  }

}