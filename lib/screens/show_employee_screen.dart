import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_test/core/view_model/base_view.dart';
import 'package:demo_test/core/view_model/screen_view_model/show_employee_viewmodel.dart';
import 'package:demo_test/model/employee_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import '../core/constant/color_constant.dart';
import '../core/constant/constants.dart';
import '../core/constant/text_style_constant.dart';
import '../routing/routes.dart';

class ShowEmployeeScreen extends StatefulWidget {
  const ShowEmployeeScreen({super.key});

  @override
  State<ShowEmployeeScreen> createState() => _ShowEmployeeScreenState();
}

class _ShowEmployeeScreenState extends State<ShowEmployeeScreen> {
  ShowEmployeeViewModel? model;

  @override
  Widget build(BuildContext context) {
    return BaseView<ShowEmployeeViewModel>(
        builder: (buildContext, model, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstant.black,
            title: const Text(
          TextConstant.employee_list,
          style: TextStyleConstant.textColorStyle,
        )),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorConstant.black,
              ),
              width: MediaQuery.of(context).size.width,
              height: 30,
              child: const Center(child: Text(TextConstant.cur_emp, style: TextStyleConstant.textColorStyle)),
            ),
            //Show Current Employee Data
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: model.isCurrentEmployee(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                      strokeWidth: 10.0,
                    ));
                  }

                  final List<QueryDocumentSnapshot> documents =
                      snapshot.data!.docs;

                  return documents.length == 0
                      ? Center(
                          child: Image.network(
                              'https://t4.ftcdn.net/jpg/04/75/01/23/240_F_475012363_aNqXx8CrsoTfJP5KCf1rERd6G50K0hXw.jpg'),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: documents.length,
                          itemBuilder: (context, index) {
                            final document = documents[index];
                            var startDate = document.get(TextConstant.filed_emp_start_date);
                            DateTime conStartDate =
                                DateTime.parse(startDate.toDate().toString());
                            String formattedStartDate =
                                DateFormat('yyyy-MM-dd').format(conStartDate);
                            return Slidable(
                              startActionPane: ActionPane(
                                motion: const BehindMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      Employee employee = Employee(
                                        empName: document.get(TextConstant.filed_emp_name),
                                        empRole: document.get(TextConstant.filed_emp_role),
                                        id: document.get(TextConstant.filed_id),
                                        startDate: conStartDate,
                                      );
                                      Navigator.pushNamed(
                                          context, Routes.editEmployeeScreen,
                                          arguments: employee);

                                      // model.updateDocument(employee, document.id, buildContext);
                                    },
                                    backgroundColor: ColorConstant.greenLight,
                                    icon: Icons.edit,
                                    label: 'Edit',
                                  ),
                                ],
                              ),
                              endActionPane: ActionPane(
                                motion: const BehindMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      model.deleteEmployee(
                                          document.get(TextConstant.filed_id), buildContext);
                                      model.updateUI();
                                    },
                                    backgroundColor: ColorConstant.red,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: ListTile(
                                  title: Text(
                                      'Employee Name: ${document.get(TextConstant.filed_emp_name)}'),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(document.get(TextConstant.filed_emp_role)),
                                      Row(
                                        children: [
                                          Text(formattedStartDate),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorConstant.black,
              ),
              width: MediaQuery.of(context).size.width,
              height: 30,
              child: const Center(child: Text(TextConstant.pre_emp, style: TextStyleConstant.textColorStyle,)),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: model.isPreviousEmployee(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                      strokeWidth: 10.0,
                    ));
                  }

                  final List<QueryDocumentSnapshot> documents =
                      snapshot.data!.docs;
                  return documents.length == 0
                      ? Center(
                          child: Image.network(
                              'https://t4.ftcdn.net/jpg/04/75/01/23/240_F_475012363_aNqXx8CrsoTfJP5KCf1rERd6G50K0hXw.jpg'))
                      : ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: documents.length,
                          itemBuilder: (context, index) {
                            final document = documents[index];
                            var startDate = document.get(TextConstant.filed_emp_start_date);
                            var endDate = document.get(TextConstant.filed_emp_end_date);
                            DateTime conStartDate =
                                DateTime.parse(startDate.toDate().toString());
                            DateTime conEndDate =
                                DateTime.parse(endDate.toDate().toString());
                            String formattedStartDate =
                                DateFormat('yyyy-MM-dd').format(conStartDate);
                            String formattedEndDate =
                                DateFormat('yyyy-MM-dd').format(conEndDate);
                            return Slidable(
                              startActionPane: ActionPane(
                                motion: const BehindMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      Employee employee = Employee(
                                          empName: document.get(TextConstant.filed_emp_name),
                                          empRole: document.get(TextConstant.filed_emp_role),
                                          id: document.get(TextConstant.filed_id),
                                          startDate: conStartDate,
                                          endDate: conEndDate);
                                      Navigator.pushNamed(
                                          context, Routes.editEmployeeScreen,
                                          arguments: employee);
                                    },
                                    backgroundColor: ColorConstant.greenLight,
                                    icon: Icons.edit,
                                    label: 'Edit',
                                  ),
                                ],
                              ),
                              endActionPane: ActionPane(
                                motion: const BehindMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      model.deleteEmployee(
                                          document.get(TextConstant.filed_id), buildContext);
                                      model.updateUI();
                                    },
                                    backgroundColor: ColorConstant.red,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: ListTile(
                                  title: Text(
                                      'Employee Name: ${document.get(TextConstant.filed_emp_name)}'),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(document.get(TextConstant.filed_emp_role)),
                                      Row(
                                        children: [
                                          Text(formattedStartDate),
                                          const Text(
                                            "   to   ",
                                            style: TextStyle(
                                                color: ColorConstant.black),
                                          ),
                                          Text(formattedEndDate),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.addEmployeeScreen);
          },
          backgroundColor: ColorConstant.black,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          child: const Icon(Icons.add),
        ),
      );
    }, onModelReady: (model) async {
      this.model = model;
    });
  }
}
