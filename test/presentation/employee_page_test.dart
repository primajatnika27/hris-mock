
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hris_mock/common/state_enum.dart';
import 'package:hris_mock/domain/entities/employee.dart';
import 'package:hris_mock/presentation/page/employee_page.dart';
import 'package:hris_mock/presentation/provider/employee_list_notifier.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'employee_page_test.mocks.dart';

@GenerateMocks([EmployeeListNotifier])
void main() {
  late MockEmployeeListNotifier mockNotifier;

  setUp(() {
    mockNotifier = MockEmployeeListNotifier();
  });

  Widget _makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<EmployeeListNotifier>.value(
      value: mockNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center circular bar when loading',
          (WidgetTester tester) async {
        when(mockNotifier.state).thenReturn(RequestState.loading);

        final progressBarFinder = find.byType(CircularProgressIndicator);
        final centerFinder = find.byType(Center);

        await tester.pumpWidget(_makeTestableWidget(const EmployeePage()));

        expect(centerFinder, findsOneWidget);
        expect(progressBarFinder, findsOneWidget);
      });

  testWidgets('Page should display ListView when data is loaded',
          (WidgetTester tester) async {
        when(mockNotifier.state).thenReturn(RequestState.loaded);
        when(mockNotifier.employeeList).thenReturn(<Employee>[]);

        final listViewFinder = find.byType(ListView);

        await tester.pumpWidget(_makeTestableWidget(const EmployeePage()));

        expect(listViewFinder, findsOneWidget);
      });

  testWidgets('Page should display text with message when Error',
          (WidgetTester tester) async {
        when(mockNotifier.state).thenReturn(RequestState.error);
        when(mockNotifier.message).thenReturn('Error message');

        final textFinder = find.byKey(const Key('error_message'));

        await tester.pumpWidget(_makeTestableWidget(const EmployeePage()));

        expect(textFinder, findsOneWidget);
      });
}