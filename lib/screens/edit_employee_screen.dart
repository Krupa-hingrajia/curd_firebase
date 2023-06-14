import 'package:demo_test/model/employee_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../core/constant/color_constant.dart';
import '../core/constant/constants.dart';
import '../core/constant/text_style_constant.dart';
import '../core/view_model/base_view.dart';
import '../core/view_model/screen_view_model/edit_employee_viewmodel.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_drop_down.dart';
import '../widgets/custom_snackbar.dart';
import '../widgets/custom_text_filed.dart';

class EditEmployeeScreen extends StatefulWidget {
  Employee employee;

  EditEmployeeScreen({super.key, required this.employee});

  @override
  State<EditEmployeeScreen> createState() => _EditEmployeeScreenState();
}

class _EditEmployeeScreenState extends State<EditEmployeeScreen> {
  EditEmployeeViewModel? model;

  @override
  Widget build(BuildContext context) {
    return BaseView<EditEmployeeViewModel>(
        builder: (buildContext, model, child) {
      model.textEditingController.text = widget.employee.empName ?? '';
      model.textEditingController.selection = TextSelection.fromPosition(
          TextPosition(offset: model.textEditingController.text.length));

      model.dropDnwName = widget.employee.empRole;
      String formattedStartDate =
          DateFormat('yyyy-MM-dd').format(widget.employee.startDate);
      model.startDateController.text = formattedStartDate;
      if (widget.employee.endDate != null) {
        String formattedEndDate =
            DateFormat('yyyy-MM-dd').format(widget.employee.endDate!);
        model.endDateController.text = formattedEndDate;
      }
      return Scaffold(
        appBar: AppBar(
            backgroundColor: ColorConstant.black,
            title: const Text(
              TextConstant.edit_employee,
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
                            controller: model.textEditingController,
                            text: TextConstant.employee_name,
                            onChanged: (value) {
                              model.updateUI();
                              widget.employee.empName = value;
                            },
                            prefixIcon: const Icon(Icons.person)),
                        dropDownWidget(
                          context: context,
                          categoryList: model.dropDnwList,
                          hintText: model.dropDnwName,
                          onChanged: (String? value) {
                            model.updateUI();
                            widget.employee.empRole = value!;
                          },
                        ),
                        customTextField(
                          controller: model.startDateController,
                          text: TextConstant.select_date,
                          showCursor: false,
                          prefixIcon: const Icon(Icons.calendar_month),
                          onTap: () async {
                            //Open Calender
                            final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: model.selectedDate,
                                firstDate: DateTime(2015, 8),
                                lastDate: DateTime(2101));
                            if (picked != null &&
                                picked != model.selectedDate) {
                              if (picked != null) {
                                model.updateUI();
                                if (true) {
                                  model.startDateController.text =
                                      DateFormat('yyyy-MM-dd').format(picked);
                                }
                              }
                              model.updateUI();
                              model.selectedDate = picked;
                              String formattedStartDate =
                                  DateFormat('yyyy-MM-dd')
                                      .format(widget.employee.startDate);
                              widget.employee.startDate = model.selectedDate;
                            }
                          },
                          onChanged: (String? value) {
                            model.updateUI();
                            model.startDateController.text = value!;
                          },
                        ),
                        customTextField(
                          controller: model.endDateController,
                          text: TextConstant.end_date,
                          showCursor: false,
                          prefixIcon: const Icon(Icons.calendar_month),
                          onTap: () async {
                            //open Calender
                            final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: model.selectedDate,
                                firstDate: DateTime(2015, 8),
                                lastDate: DateTime(2101));
                            if (picked != null &&
                                picked != model.selectedDate) {
                              if (picked != null) {
                                model.updateUI();
                                if (true) {
                                  model.endDateController.text =
                                      DateFormat('yyyy-MM-dd').format(picked);
                                }
                              }
                              model.updateUI();
                              model.selectedDate = picked;
                              widget.employee.endDate = model.selectedDate;
                            }
                          },
                          onChanged: (String? value) {
                            model.updateUI();
                            model.endDateController.text = value!;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
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
                            widget.employee.empName =
                                model.textEditingController.text;
                            DateTime startDate =
                                DateTime.parse(model.startDateController.text);
                            widget.employee.startDate = startDate;

                            if (model.endDateController.text.isEmpty) {
                              if (model.textEditingController.text.isEmpty) {
                                coustomSnackBar(
                                    context: context,
                                    text: TextConstant.add_emp_name);
                              } else {
                                Employee employee = Employee(
                                    id: widget.employee.id,
                                    empName: model.textEditingController.text,
                                    empRole: model.dropDnwName,
                                    startDate: widget.employee.startDate,
                                    isCurrentEmployee: true);
                                model.updateDocument(employee, context, true);
                              }
                            } else {
                              if (model.textEditingController.text.isEmpty) {
                                coustomSnackBar(
                                    context: context,
                                    text: TextConstant.add_emp_name);
                              } else {
                                DateTime endDate = DateTime.parse(
                                    model.endDateController.text);
                                widget.employee.endDate = endDate;
                                Employee employee = Employee(
                                    id: widget.employee.id,
                                    empName: model.textEditingController.text,
                                    empRole: model.dropDnwName,
                                    startDate: widget.employee.startDate,
                                    endDate: widget.employee.endDate,
                                    isCurrentEmployee: false);

                                // Update Data
                                model.updateDocument(employee, context, false);
                              }
                            }
                          }),
                      customButton(
                          text: TextConstant.CANCEL,
                          color: ColorConstant.black,
                          height: MediaQuery.of(context).size.height * 0.052,
                          width: MediaQuery.of(context).size.width * 0.4,
                          onTap: () async {
                            model.textEditingController.clear();
                            model.startDateController.clear();
                            model.endDateController.clear();
                            model.dropDnwName = model.dropDnwName;
                            //Navigator.pop(context);
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
