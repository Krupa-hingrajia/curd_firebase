import 'package:demo_test/core/constant/color_constant.dart';
import 'package:demo_test/core/constant/text_style_constant.dart';
import 'package:demo_test/core/view_model/screen_view_model/add_employee_viewmodel.dart';
import 'package:demo_test/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';
import '../core/constant/constants.dart';
import '../core/view_model/base_view.dart';
import '../model/employee_data.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_drop_down.dart';
import '../widgets/custom_snackbar.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({Key? key}) : super(key: key);

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  AddEmployeeViewModel? model;

  @override
  Widget build(BuildContext context) {
    return BaseView<AddEmployeeViewModel>(
        builder: (buildContext, model, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstant.black,
            title: const Text(
          TextConstant.add_employee,
          style: TextStyleConstant.textColorStyle,
        )),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      customTextField(
                          controller: model.empNameController,
                          text: TextConstant.select_date,
                          prefixIcon: const Icon(Icons.person)),
                      dropDownWidget(
                        context: context,
                        categoryList: model.dropDnwList,
                        hintText: model.dropDnwName,
                        onChanged: (String? value) {
                          model.dropDnwName = value!;
                          model.updateUI();
                        },
                      ),
                      customTextField(
                        controller: model.startDateController,
                        text: TextConstant.select_date,
                        showCursor: false,
                        prefixIcon: const Icon(Icons.calendar_month),
                        onTap: () {
                          model.selectDate(context, true);
                        },
                      ),
                      customTextField(
                        controller: model.endDateController,
                        text: TextConstant.end_date,
                        showCursor: false,
                        prefixIcon: const Icon(Icons.calendar_month),
                        onTap: () {
                          model.selectDate(context, false);
                        },
                      ),
                    ],
                  ),
                )),
                SizedBox(
                  height: kToolbarHeight,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      customButton(
                          text: TextConstant.SAVE,
                          color: ColorConstant.black,
                          height: MediaQuery.of(context).size.height * 0.052,
                          width: MediaQuery.of(context).size.width * 0.4,
                          onTap: () async {
                            if (model.empNameController.text.isEmpty) {
                              coustomSnackBar(
                                  context: context,
                                  text: TextConstant.add_emp_name);
                            }
                            if (model.dropDnwName == 'Select Role') {
                              coustomSnackBar(
                                  context: context,
                                  text: TextConstant.add_role_name);
                            }
                            if (model.startDateController.text.isEmpty) {
                              coustomSnackBar(
                                  context: context,
                                  text: TextConstant.add_start_date);
                            }
                            //Add Firebase Data
                            DateTime startDate =
                                DateTime.parse(model.startDateController.text);
                            if (model.endDateController.text.isEmpty) {
                              model.isCurrentEmployee = false;
                              Employee employee = Employee(
                                  empName: model.empNameController.text,
                                  empRole: model.dropDnwName,
                                  isCurrentEmployee: true,
                                  startDate: startDate);
                              model.addData(employee, context, false);
                            } else {
                              DateTime endDate =
                                  DateTime.parse(model.endDateController.text);
                              Employee employee = Employee(
                                  empName: model.empNameController.text,
                                  empRole: model.dropDnwName,
                                  startDate: startDate,
                                  isCurrentEmployee: false,
                                  endDate: endDate);
                              model.addData(employee, context, true);
                            }
                          }),
                      customButton(
                          text: TextConstant.CANCEL,
                          color: ColorConstant.black,
                          height: MediaQuery.of(context).size.height * 0.052,
                          width: MediaQuery.of(context).size.width * 0.4,
                          onTap: () async {
                            model.empNameController.clear();
                            model.startDateController.clear();
                            model.endDateController.clear();
                            model.dropDnwName = model.dropDnwName;
                            //Navigator.pop(context)
                          }),
                    ],
                  ),
                )
              ],
            )),
      );
    }, onModelReady: (model) async {
      this.model = model;
    });
  }
}
