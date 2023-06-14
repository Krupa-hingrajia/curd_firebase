import 'package:demo_test/model/employee_data.dart';
import 'package:demo_test/routing/routes.dart';
import 'package:demo_test/screens/edit_employee_screen.dart';
import 'package:demo_test/screens/show_employee_screen.dart';
import 'package:flutter/material.dart';

import '../screens/add_employee_screen.dart';

class PageRouter {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.addEmployeeScreen:
        return MaterialPageRoute(builder: (context) => AddEmployeeScreen());
      case Routes.employeeListScreen:
        return MaterialPageRoute(
            builder: (context) => const ShowEmployeeScreen());
      case Routes.editEmployeeScreen:
        Employee employee = settings.arguments as Employee;
        return MaterialPageRoute(
            builder: (context) => EditEmployeeScreen(employee: employee));
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("No page Found"),
            ),
          ),
        );
    }
  }
}
