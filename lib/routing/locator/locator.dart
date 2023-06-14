import 'package:demo_test/core/view_model/screen_view_model/add_employee_viewmodel.dart';
import 'package:demo_test/core/view_model/screen_view_model/edit_employee_viewmodel.dart';
import 'package:demo_test/screens/add_employee_screen.dart';
import 'package:demo_test/screens/show_employee_screen.dart';
import 'package:get_it/get_it.dart';

import '../../core/view_model/screen_view_model/show_employee_viewmodel.dart';


var locator = GetIt.instance;

setLocator() {
  locator.registerLazySingleton(() =>  ShowEmployeeViewModel());
  locator.registerLazySingleton(() =>  AddEmployeeViewModel());
  locator.registerLazySingleton(() =>  EditEmployeeViewModel());
}