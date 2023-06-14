import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_test/widgets/custom_snackbar.dart';
import '../../../model/employee_data.dart';
import '../../constant/constants.dart';
import '../base_model.dart';
import 'package:flutter/material.dart';

class EditEmployeeViewModel extends BaseModel {
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  String? selectedValue;
  String dropDnwName = 'Select Role';
  DateTime selectedDate = DateTime.now();
  List<String> dropDnwList = [
    'Product Designer',
    'Flutter Developer',
    'OA Tester',
    'Product Owen'
  ];

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> updateDocument(
      Employee employee, BuildContext context, bool isCurrentEmployee) async {

    final data = isCurrentEmployee
        ? Employee(
            id: employee.id,
            empName: employee.empName,
            empRole: employee.empRole,
            startDate: employee.startDate,
            isCurrentEmployee: employee.isCurrentEmployee,
          )
        : Employee(
            id: employee.id,
            empName: employee.empName,
            empRole: employee.empRole,
            isCurrentEmployee: employee.isCurrentEmployee,
            startDate: employee.startDate,
            endDate: employee.endDate,
          );

    try {
      await firestore
          .collection(TextConstant.EMPLOYEE_DATA)
          .doc(employee.id)
          .update(data.toJson());
      print('Document updated successfully!');
      coustomSnackBar(
          context: context, text: TextConstant.edit_emp_data);
      textEditingController.clear();
      startDateController.clear();
      endDateController.clear();
      Navigator.pop(context); // Navigate back after updating
    } catch (e) {
      print('Error updating document: $e');
    }
  }

}
