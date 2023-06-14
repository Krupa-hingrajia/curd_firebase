import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_test/model/employee_data.dart';
import 'package:flutter/cupertino.dart';
import '../../../widgets/custom_snackbar.dart';
import '../../constant/constants.dart';
import '../base_model.dart';

class ShowEmployeeViewModel extends BaseModel {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> deleteEmployee(String documentId, BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection(TextConstant.EMPLOYEE_DATA)
          .doc(documentId)
          .delete();
      coustomSnackBar(context: context, text: TextConstant.delete_emp_data);
      // getData();
      updateUI(); // Refresh the list after deletion
    } catch (e) {
      print('Error deleting document: $e');
    }
  }

  //Show Current Employee Data
  Stream<QuerySnapshot> isCurrentEmployee() {
    return firestore
        .collection(TextConstant.EMPLOYEE_DATA)
        .where(TextConstant.filed_isCurrent_emp, isEqualTo: true)
        .snapshots();
  }

  //Show Previous Employee Data
  Stream<QuerySnapshot> isPreviousEmployee() {
    return firestore
        .collection(TextConstant.EMPLOYEE_DATA)
        .where(TextConstant.filed_isCurrent_emp, isEqualTo: false)
        .snapshots();
  }
}
