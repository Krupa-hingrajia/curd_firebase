class Employee {
  String? id;
  String empName;
  String empRole;
  DateTime startDate;
  DateTime? endDate;
  bool? isCurrentEmployee;

  Employee(
      {this.id,
      required this.empName,
      required this.empRole,
      required this.startDate,
      this.endDate,
      this.isCurrentEmployee});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
        id: json['id'],
        empName: json['emp_name'],
        empRole: json['emp_role'],
        startDate: json['start_date'],
        endDate: json['end_date'],
        isCurrentEmployee: json['isCurrent_employee']);
  }

  Map<String, dynamic> toJson() {
    if (isCurrentEmployee == true) {
      return {
        'id': id,
        'emp_name': empName,
        'emp_role': empRole,
        'start_date': startDate,
        'isCurrent_employee': isCurrentEmployee
      };
    } else {
      return {
        'id': id,
        'emp_name': empName,
        'emp_role': empRole,
        'start_date': startDate,
        'end_date': endDate,
        'isCurrent_employee': isCurrentEmployee
      };
    }
  }
}
