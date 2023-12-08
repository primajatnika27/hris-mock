import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hris_mock/common/constants.dart';
import 'package:hris_mock/domain/entities/employee.dart';

class EmployeeDetailPage extends StatefulWidget {
  static const ROUTE_NAME = '/detail';

  final Employee employee;
  const EmployeeDetailPage({super.key, required this.employee});

  @override
  State<EmployeeDetailPage> createState() => _EmployeeDetailPageState();
}

class _EmployeeDetailPageState extends State<EmployeeDetailPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: kOxfordBlue,
              width: screenWidth,
              height: 500,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 150),
                child: CachedNetworkImage(
                  imageUrl: widget.employee.imageUrl ?? '',
                  height: 100,
                  width: 100,
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 48 + 8),
              child: DraggableScrollableSheet(
                minChildSize: 0.6,
                initialChildSize: 0.6,
                maxChildSize: 0.7,
                builder: (context, scrollController) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: kGrey,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    padding: const EdgeInsets.only(
                      left: 16,
                      top: 16,
                      right: 16,
                    ),
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 3),
                                          child: Text(
                                            'Staff Engineer',
                                            style:
                                            kBodyText.copyWith(color: kBgBlack),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    '${widget.employee.firstName ?? ''} ${widget.employee.lastName ?? ''}',
                                    textAlign: TextAlign.center,
                                    style: kHeading5.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    widget.employee.email ?? '',
                                    style: kHeading6.copyWith(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                        letterSpacing: 1.4),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'About',
                                        style: kHeading5.copyWith(
                                          fontSize: 17,
                                        ),
                                      ),
                                      const Text(loreIpsum),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: kRichBlack,
                foregroundColor: Colors.white,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
