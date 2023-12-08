import 'package:flutter/material.dart';
import 'package:hris_mock/common/constants.dart';
import 'package:hris_mock/common/utils.dart';
import 'package:hris_mock/di/injector.dart' as di;
import 'package:hris_mock/domain/entities/employee.dart';
import 'package:hris_mock/presentation/page/employee_detail_page.dart';
import 'package:hris_mock/presentation/page/employee_page.dart';
import 'package:hris_mock/presentation/provider/employee_list_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => di.locator<EmployeeListNotifier>(),
        ),
      ],
      child: MaterialApp(
        title: 'HRIS',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        home: const EmployeePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(builder: (_) => const EmployeePage());
            case EmployeeDetailPage.ROUTE_NAME:
              final data = settings.arguments as Employee;
              return MaterialPageRoute(
                builder: (_) => EmployeeDetailPage(
                  employee: data,
                ),
              );
            default:
              return MaterialPageRoute(
                builder: (_) {
                  return const Scaffold(
                    body: Center(
                      child: Text('Page not found :('),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
