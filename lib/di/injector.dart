import 'package:get_it/get_it.dart';
import 'package:hris_mock/data/datasources/remote/employee_remote_data_sources.dart';
import 'package:hris_mock/data/repositories/employee_repository_impl.dart';
import 'package:hris_mock/domain/repositories/employee_repository.dart';
import 'package:hris_mock/domain/usecase/get_employee.dart';
import 'package:hris_mock/presentation/provider/employee_list_notifier.dart';

final locator = GetIt.instance;

void init() {

  // state management
  locator.registerFactory(() => EmployeeListNotifier(getEmployee: locator()));

  // use case
  locator.registerLazySingleton(() => GetEmployee(locator()));

  // repository
  locator.registerLazySingleton<EmployeeRepository>(
          () => EmployeeRepositoryImpl(remoteDataSources: locator())
  );

  // data sources
  locator.registerLazySingleton<EmployeeRemoteDataSources>(
          () => EmployeeRemoteDataSourcesImpl()
  );
}