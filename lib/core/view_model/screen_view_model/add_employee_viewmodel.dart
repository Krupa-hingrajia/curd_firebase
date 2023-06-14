import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_test/widgets/custom_snackbar.dart';
import 'package:intl/intl.dart';

import '../../../model/employee_data.dart';
import '../../constant/constants.dart';
import '../base_model.dart';
import 'package:flutter/material.dart';

class AddEmployeeViewModel extends BaseModel {
  final TextEditingController empNameController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  bool? isCurrentEmployee = false;
  DateTime selectedDate = DateTime.now();
  String dropDnwName = 'Select Role';
  List<String> dropDnwList = [
    'Product Designer',
    'Flutter Developer',
    'OA Tester',
    'Product Owen'
  ];

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addData(
      Employee employee, BuildContext context, bool isCurrentEmployee) {
    final data = isCurrentEmployee
        ? Employee(
            id: FirebaseFirestore.instance
                .collection(TextConstant.EMPLOYEE_DATA)
                .doc()
                .id,
            empName: employee.empName,
            empRole: employee.empRole,
            startDate: employee.startDate,
            isCurrentEmployee: employee.isCurrentEmployee,
            endDate: employee.endDate)
        : Employee(
            id: FirebaseFirestore.instance
                .collection(TextConstant.EMPLOYEE_DATA)
                .doc()
                .id,
            empName: employee.empName,
            empRole: employee.empRole,
            isCurrentEmployee: employee.isCurrentEmployee,
            startDate: employee.startDate);

    firestore
        .collection(TextConstant.EMPLOYEE_DATA)
        .doc(data.id)
        .set(data.toJson())
        .then((value) {
      print('Data added successfully!');
      coustomSnackBar(context: context, text: TextConstant.add_emp_data);
      updateUI();
      empNameController.clear();
      startDateController.clear();
      dropDnwName = 'Select Role';
      endDateController.clear();
    }).catchError((error) {
      print('Failed to add data: $error');
    });
  }

  Future<void> selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      if (picked != null) {
        updateUI();
        if (isStartDate) {
          startDateController.text = DateFormat('yyyy-MM-dd').format(picked);
        } else {
          endDateController.text = DateFormat('yyyy-MM-dd').format(picked);
        }
      }
      updateUI();
      selectedDate = picked;
    }
  }
}
