import 'package:flutter/material.dart';
import 'package:hris_mock/common/constants.dart';
import 'package:hris_mock/common/state_enum.dart';
import 'package:hris_mock/domain/entities/employee.dart';
import 'package:hris_mock/presentation/page/employee_detail_page.dart';
import 'package:hris_mock/presentation/provider/employee_list_notifier.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<EmployeeListNotifier>(context, listen: false)
          ..fetchEmployee());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee'),
      ),
      body: CustomScrollView(
        slivers: [
          Consumer<EmployeeListNotifier>(builder: (context, data, child) {
            final state = data.state;

            if (state == RequestState.loading) {
              return const SliverToBoxAdapter(
                child: SizedBox(
                  height: 150,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            } else if (state == RequestState.loaded) {
              return EmployeeList(data.employeeList);
            } else {
              return const SliverToBoxAdapter(
                child: Center(
                  child: Text('Failed'),
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}

class EmployeeList extends StatelessWidget {
  final List<Employee> employee;

  const EmployeeList(this.employee, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        var data = employee[index];
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              EmployeeDetailPage.ROUTE_NAME,
              arguments: data,
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CachedNetworkImage(
                          imageUrl: data.imageUrl ?? '',
                          height: 100,
                          width: 100,
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                        ),
                        Container(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(height: 5),
                              Text(
                                data.firstName ?? '',
                                style: kSubtitle,
                              ),
                              Container(height: 5),
                              Text(
                                data.email ?? '',
                                style: kBodyText,
                              ),
                              Container(height: 10),
                              Text(
                                data.dob ?? '',
                                maxLines: 2,
                                style: kBodyText
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }, childCount: employee.length),
    );
  }
}
